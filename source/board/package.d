module board;

import core.bitop;
import board.trace;
import atsamd21g18a.pm;
import atsamd21g18a.dmac;
import atsamd21g18a.hmatrix;
import atsamd21g18a.nvmctrl;
import atsamd21g18a.usb;
import atsamd21g18a.sysctrl;
import atsamd21g18a.gclk;
import atsamd21g18a.nvmcal;
import atsamd21g18a.pac0;
import atsamd21g18a.pac1;
import atsamd21g18a.pac2;
import arm.nvic;
import atsamd21g18a.irq;
import atsamd21g18a.port;

private alias ISR = void function(); // Alias Interrupt Service Routine function pointers

private extern(C) immutable ISR[43] _vectorTable =
[
      &onReset
    , &onNMI
    , &onHardFault
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &onSVC
    , &defaultHandler
    , &defaultHandler
    , &onPendSV
    , &onSysTick

    , &onPowerManager
    , &onSystemControl
    , &onWatchDog
    , &onRealTimeClock
    , &onExternalInterrupt
    , &onNonVolatileMemory
    , &onDirectMemoryAccess
    , &onUSB
    , &onEventSystem
    , &onSerCom0
    , &onSerCom1
    , &onSerCom2
    , &onSerCom3
    , &onSerCom4
    , &onSerCom5
    , &onTimer0
    , &onTimer1
    , &onTimer2
    , &onTimer3
    , &onTimer4
    , &onTimer5
    , &onTimer6
    , &onTimer7
    , &onADC
    , &onAnalogComparator0
    , &onDAC
    , &onPeripheralTouch
    , &onAnalogComparator1
];

private void defaultHandler()
{
    writeln("Default Handler");
    while(true)
    { }
}

// defined in the linker
private extern(C) extern __gshared ubyte __text_end__;
private extern(C) extern __gshared ubyte __data_start__;
private extern(C) extern __gshared ubyte __data_end__;
private extern(C) extern __gshared ubyte __bss_start__;
private extern(C) extern __gshared ubyte __bss_end__;

private extern void main();

private void onReset()
{
    // copy data segment out of ROM and into RAM
    size_t dataSize = &__data_end__ - &__data_start__;
    immutable(byte[]) dataROM = (cast(immutable byte*)&__text_end__)[0 .. dataSize];
    byte[] dataRAM = (cast(byte*)&__data_start__)[0 .. dataSize];
    dataRAM[0 .. dataSize] = dataROM[0 .. dataSize];
    
    // zero-initialize bss
    size_t bssSize = &__bss_end__ - &__bss_start__;
    byte[] bss = (cast(byte*)&__bss_start__)[0 .. bssSize];
    bss[] = 0;

    // Overwriting the default value of the NVMCTRL.CTRLB.MANW bit (errata reference 13134)
    NVMCTRL.CTRLB.MANW = 1;

    //******************************************************************************************
    // configure clocks
    //******************************************************************************************

    // Set flash wait states
    NVMCTRL.CTRLB.RWS = NVMCTRL.CTRLB.RWSValues.DUAL;

    // Configure and enable external 32kHz crystal
    with(SYSCTRL.XOSC32K)
    {
        // Number of clock cycles to wait until clock source is considered stable
        enum StartupValues 
        {
            _2048,
            _4096,
            _16384,
            _32768,
            _65536,
            _131072,
            _262144,
        }

        setValue
        !(
              STARTUP,  StartupValues._65536
            , XTALEN,   true
            , AAMPEN,   false
            , EN1K,     false
            , EN32K,    true
            , ONDEMAND, false
            , RUNSTDBY, false
            , WRTLOCK,  false
            , ENABLE,   true
        );
    }
    while(!SYSCTRL.PCLKSR.XOSC32KRDY.value) { }

    // See Errata 9905
    // "The DFLL clock must be requested before being configured otherwise a write access
    // to a DFLL register can freeze the device."  This driver will enable and configure
    // the DFLL before the ONDEMAND bit is set.
    SYSCTRL.DFLLCTRL.ONDEMAND = false;
    while(!SYSCTRL.PCLKSR.DFLLRDY.value) { } // wait for DFLL sync

    // set course and fine values
    //TODO: The setValue template can't seem to be used with variables.  Investigate
    SYSCTRL.DFLLVAL.COARSE = NVMCAL.CAL4.DFLL48M_COARSE_CAL;
    SYSCTRL.DFLLVAL.FINE = NVMCAL.CAL8.DFLL48M_FINE_CAL;

    // Set DFLL for USB Clock Recovery Mode, Bypass Coarse Lock, Disable Chill Cycle,
	// Fine calibration register locks (stable) after fine lock
    with(SYSCTRL.DFLLCTRL)
    {
        setValue
        !(
              BPLCKC,   true
            , CCDIS,    true
            , USBCRM,   true
            , STABLE,   true
            , ENABLE,   true
        );
    }
    while(!SYSCTRL.PCLKSR.DFLLRDY.value) { }  // wait for DFLL sync

    // GENCTRL[0] is used for F_CPU (for GCLK_GENCTRL_DIV => 0 & 1 will both do Divide-by-1)
    with(GCLK.GENDIV)
    {
        setValue
        !(
              ID,  0
            , DIV, 1
        );
    }

    // Enable GCLK generator 0, source = DFLL48M, run in Standby
    with(GCLK.GENCTRL)
    {
        setValue
        !(
              ID,       0
            , SRC,      SRCValues.DFLL48M
            , RUNSTDBY, true
            , GENEN,    true
        );
    }
    while(GCLK.STATUS.SYNCBUSY.value) { }  // Wait till synchronization is complete

    asm { "cpsie i" ::: "memory"; };

    // USB initialization

    //PM.AHBMASK.USB_ = true;
    PM.APBBMASK.PORT_ = true;
    PM.APBBMASK.USB_ = true;
    PM.APBAMASK.GCLK_ = true;

    // with(PORT)
    // {
    //     DIR!(P.A).DIR = (1 << 17);  //output
    //     OUTSET!(P.A).OUTSET = (1 << 17);
    // }

    with(PORT)
    {
        // DIR!(P.A, 24).DIR = 0;
        // DIR!(P.A, 25).DIR = 0;

        PINCFG!(P.A, 24).PMUXEN = true;
        PINCFG!(P.A, 25).PMUXEN = true;

        PMUX!(P.A, 24).FUNC = FUNCValues.G;
        PMUX!(P.A, 25).FUNC = FUNCValues.G;
    }

    with(GCLK.CLKCTRL)
    {
        setValue
        !(
              ID,       IDValues.USB
            , CLKEN,    true
            , GEN,      GENValues.GCLK0
        );
    }

    // GCLK.CLKCTRL.GEN = GCLK.CLKCTRL.GENValues.GCLK0;
    // GCLK.CLKCTRL.CLKEN = true;
    while(GCLK.STATUS.SYNCBUSY.value) { }

    USB.DEVICE.CTRLA.SWRST = true;
    while(USB.DEVICE.SYNCBUSY.SWRST.value) { }

    // CRAMC0
    // This is undocumented.  It was found in Atmel's startup code.  I don't
    // know what it does.
    // HMATRIX.SFR4.SFR = 2;

    // with (USB.DEVICE.QOSCTRL)
    // {
    //     setValue
    //     !(
    //           CQOS, CQOSValues.MEDIUM
    //         , DQOS, DQOSValues.MEDIUM
    //     );
    // }

    auto pad_transn = NVMCAL.CAL4.USB_TRANSN.value;
    auto pad_transp = NVMCAL.CAL4.USB_TRANSP.value;
    auto pad_trim = NVMCAL.CAL4.USB_TRIM.value;

    if (pad_transn == 0x1F)
    {
		pad_transn = 5;
	}

	if (pad_transp == 0x1F) 
    {
		pad_transp = 29;
	}

	if (pad_trim == 0x7) 
    {
		pad_trim = 3;
	}

    with(USB.DEVICE.PADCAL)
    {
        TRANSN = pad_transn;
        TRANSP = pad_transp;
        TRIM = pad_trim;
    }

    USB.DEVICE.CTRLB.SPDCONF = USB.DEVICE.CTRLB.SPDCONFValues.FS;

    with (USB.DEVICE.CTRLA)
    {
        MODE = MODEValues.DEVICE;
        ENABLE = true;
    }
    while(USB.DEVICE.SYNCBUSY.ENABLE.value) { }

    NVIC.IPR[IRQ.USB] = 0;
    NVIC.ISER.SETENA = (1 << IRQ.USB);

    main();
}

private void onNMI()
{

}

private void onHardFault()
{
    writeln("Hard Fault");
    while(true)
    { }
}

private void onSVC()
{

}

private void onPendSV()
{

}

private void onSysTick()
{

}

private void onPowerManager()
{

}

private void onSystemControl()
{

}

private void onWatchDog()
{

}

private void onRealTimeClock()
{

}

private void onExternalInterrupt()
{

}

private void onNonVolatileMemory()
{

}

private void onDirectMemoryAccess()
{

}

private void onUSB()
{
    writeln("USB Interrupt");
}

private void onEventSystem()
{

}

private void onSerCom0()
{

}

private void onSerCom1()
{
    
}

private void onSerCom2()
{
    
}

private void onSerCom3()
{
    
}

private void onSerCom4()
{
    
}

private void onSerCom5()
{
    
}

private void onTimer0()
{

}

private void onTimer1()
{

}

private void onTimer2()
{

}

private void onTimer3()
{

}

private void onTimer4()
{

}

private void onTimer5()
{

}

private void onTimer6()
{

}

private void onTimer7()
{

}

private void onADC()
{

}

private void onAnalogComparator0()
{

}

private void onDAC()
{

}

private void onPeripheralTouch()
{

}

private void onI2S()
{

}

private void onAnalogComparator1()
{

}
