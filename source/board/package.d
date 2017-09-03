module board;

import board.trace;

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
}

// defined in the linker
private extern(C) extern __gshared ubyte __text_end__;
private extern(C) extern __gshared ubyte __data_start__;
private extern(C) extern __gshared ubyte __data_end__;
private extern(C) extern __gshared ubyte __bss_start__;
private extern(C) extern __gshared ubyte __bss_end__;

private void onReset()
{
    // import gcc.builtins;

    // // copy data segment out of ROM and into RAM
    // memcpy(&__data_start__, &__text_end__, &__data_end__ - &__data_start__);

    // // zero out variables initialized to void
    // memset(&__bss_start__, 0, &__bss_end__ - &__bss_start__);

    // copy data segment out of ROM and into RAM
    size_t dataSize = &__data_end__ - &__data_start__;
    immutable(byte[]) dataROM = (cast(immutable byte*)&__text_end__)[0 .. dataSize];
    byte[] dataRAM = (cast(byte*)&__data_start__)[0 .. dataSize];
    dataRAM[0 .. dataSize] = dataROM[0 .. dataSize];
    
    // zero-initialize bss
    size_t bssSize = &__bss_end__ - &__bss_start__;
    byte[] bss = (cast(byte*)&__bss_start__)[0 .. bssSize];
    bss[] = 0;

    while(true)
    {
        writeln("Hello");
    }
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
