module board;

import board.trace;
import atsamd21g18a.dmac;
import atsamd21g18a.hmatrix;
import atsamd21g18a.nvmctrl;
import atsamd21g18a.usb;
import atsamd21g18a.sysctrl;
import atsamd21g18a.gclk;
import atsamd21g18a.nvmcal;

private alias ISR = void function(); // Alias Interrupt Service Routine function pointers

extern(C) immutable ISR[43] _vectorTable =
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

    // CRAMC0
    // This is undocumented.  It was found in Atmel's startup code.  I don't
    // know what it does.
    HMATRIX.SFR4.SFR = 2;
    
    // Change default QOS values to have the best performance and correct USB behaviour
    with(USB.DEVICE.QOSCTRL)
    {
        CQOS = CQOSValues.MEDIUM;
        DQOS = DQOSValues.MEDIUM;
    }

    with(DMAC.QOSCTRL)
    {
        DQOS = DQOSValues.MEDIUM;
        FQOS = FQOSValues.MEDIUM;
        WRBQOS = WRBQOSValues.MEDIUM;
    }

    // Overwriting the default value of the NVMCTRL.CTRLB.MANW bit (errata reference 13134)
    NVMCTRL.CTRLB.MANW = 1;

    // configure clocks

    // Various bits in the INTFLAG register can be set to one at startup.
	// This will ensure that these bits are cleared
    with(SYSCTRL.INTFLAG)
    {
        setValue
        !(
              BOD33DET, true
            , BOD33RDY, true
            , DFLLRDY,  true
        );
    }

    // Set flash wait states
    NVMCTRL.CTRLB.RWS = NVMCTRL.CTRLB.RWSValues.DUAL;

    // Switch all peripheral clock to a not enabled general clock to save power.
    with(GCLK.CLKCTRL)
    {
        for(IDValues id = IDValues.DFLL48; id <= IDValues.I2S_1; id++)
        {
            // TODO: Enter critical region?

            ID.value = id;
        
            // Switch to known-working source so that the channel can be disabled
            immutable auto previousGen = GEN.value;
            GEN = GENValues.GCLK0;

            // disable it
            CLKEN = false;
            while(CLKEN.value) 
            { 
                // wait for it to become disabled
            }

            // Restore previous configured clock generator
            GEN.value = previousGen;

            // TODO: exit critical region
        }
    }

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
              STARTUP,  StartupValues._4096
            , XTALEN,   true
            , AAMPEN,   false
            , EN1K,     false
            , EN32K,    true
            , ONDEMAND, true
            , RUNSTDBY, false
            , WRTLOCK,  false
            , ENABLE,   true
        );
    }

    // wait for clock source to be ready
    while(!SYSCTRL.PCLKSR.XOSC32KRDY.value) {}

    // See Errata 9905
    with(SYSCTRL.DFLLCTRL)
    {
        setValue
        !(
              WAITLOCK, false
            , BPLCKC,   false
            , QLDIS,    false
            , CCDIS,    false
            , ONDEMAND, false
            , RUNSTDBY, false
            , USBCRM,   false
            , LLAW,     false
            , STABLE,   false
            , MODE,     false
            , ENABLE,   false
        );
    }
    while(SYSCTRL.PCLKSR.DFLLRDY.value) { } // wait for DFLL sync

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
    while(SYSCTRL.PCLKSR.DFLLRDY.value) { }  // wait for DFLL sync

    main();
}

template EnumMembers(E)
    if (is(E == enum))
{
    import std.meta : AliasSeq;
    // Supply the specified identifier to an constant value.
    template WithIdentifier(string ident)
    {
        static if (ident == "Symbolize")
        {
            template Symbolize(alias value)
            {
                enum Symbolize = value;
            }
        }
        else
        {
            mixin("template Symbolize(alias "~ ident ~")"
                 ~"{"
                     ~"alias Symbolize = "~ ident ~";"
                 ~"}");
        }
    }

    template EnumSpecificMembers(names...)
    {
        static if (names.length == 1)
        {
            alias EnumSpecificMembers = AliasSeq!(WithIdentifier!(names[0])
                        .Symbolize!(__traits(getMember, E, names[0])));
        }
        else static if (names.length > 0)
        {
            alias EnumSpecificMembers =
                AliasSeq!(
                    WithIdentifier!(names[0])
                        .Symbolize!(__traits(getMember, E, names[0])),
                    EnumSpecificMembers!(names[1 .. $/2]),
                    EnumSpecificMembers!(names[$/2..$])
                );
        }
        else
        {
            alias EnumSpecificMembers = AliasSeq!();
        }
    }

    alias EnumMembers = EnumSpecificMembers!(__traits(allMembers, E));
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
