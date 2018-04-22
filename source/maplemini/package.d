module maplemini;

import gcc.attribute;

import arm.memory;

// import stm32f103xx.rcc;
// import stm32f103xx.pwr;
import stm32f103xx.flash;
// import stm32f103xx.gpio;

public import maplemini.trace;

// Program's main function
extern void main();

/// Call signature of interrupt service routines
alias ISR = void function();

//----------------------------------------------------------------------
// Alias Interrupt Service Routine function pointers
// These are marked extern(C) to avoid name mangling, so we can refer to
// them in our linker script
//----------------------------------------------------------------------

private extern(C) immutable ISR[15] _vectorTable =
[
      &onReset
    , &defaultHandler
    , &onHardFault
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
];

/// Software entry point
@naked void onReset()
{
    // Enable Core-coupled memory for stack
    // RCC.AHB1ENR.CCMDATARAMEN = true;

    // call main
    version(GNU)
    {
      asm
      {
          "ldr r2, handler_address
          bx r2
          handler_address: .word hardwareInit";
      };
    }
}

private void onHardFault()
{
    writeln!"Hard Fault";
    while(true)
    { }
}

private void defaultHandler()
{
    writeln!"Default Handler";
    while(true)
    { }
}


// defined in the linker
extern(C) extern __gshared ubyte __text_end__;
extern(C) extern __gshared ubyte __data_start__;
extern(C) extern __gshared ubyte __data_end__;
extern(C) extern __gshared ubyte __bss_start__;
extern(C) extern __gshared ubyte __bss_end__;

extern(C) void hardwareInit()
{
    // copy data segment out of ROM and into RAM
    memcpy(&__data_start__, &__text_end__, &__data_end__ - &__data_start__);

    // zero out variables initialized to void
    memset(&__bss_start__, 0, &__bss_end__ - &__bss_start__);

    // //----------------------------------------------------------------------
    // // Flash configuration
    // //----------------------------------------------------------------------

    // Enable Flash prefetch, Instruction cache, Data cache and wait state
    with(FLASH.ACR)
    {
        setValue
        !(
              PRFTBE,  true  // prefetch
            , LATENCY, 5     // 5 wait states. No choice if we increase
        )();                 //   the clock speed, which we intend to do
    }

    // //----------------------------------------------------------------------
    // // Clock configuration
    // //----------------------------------------------------------------------
    // with (RCC.CR)
    // {
    //     setValue
    //     !(
    //           HSION,     true      //Default to HSI on
    //         , HSEON,     false
    //         , CSSON,     false
    //         , PLLON,     false
    //         , PLLISAION, false
    //         , PLLI2SON,  false
    //     );
    // }
    // while(!RCC.CR.HSIRDY) { }

    // RCC.CR.HSEBYP = false;

    // with(RCC.CFGR)
    // {
    //     setValue
    //     !(
    //           MCO2,    0
    //         , MCO2PRE, 0
    //         , MCO1PRE, 0
    //         , I2SSRC,  0
    //         , MCO1,    0
    //         , RTCPRE,  0
    //         , HPRE,    0b000 // AHB  = HCLK divided by 1
    //         , PPRE2,   0b100 // APB2 = HCLK divided by 2
    //         , PPRE1,   0b101 // APB1 = HCLK divide by 4
    //         , SW,      0     // HSI is system clock
    //     )();
    // }

    // //----------------------------------------------------------------------
    // // Power configuration
    // //----------------------------------------------------------------------

    // // Enable clock for the power management peripheral
    // RCC.APB1ENR.PWREN = true;

    // // increase voltage from the voltage regulator to acheive a
    // // greater clock speed at the expense of power consumption
    // PWR.CR.VOS = 0b11;

    // // Enable the Over-drive to extend the clock frequency to 180 Mhz
    // PWR.CR.ODEN = true;
    // while(!PWR.CSR.ODRDY) { }

    // PWR.CR.ODSWEN = true;
    // while(!PWR.CSR.ODSWRDY) {}

    // //----------------------------------------------------------------------
    // // External Clock configuration
    // //----------------------------------------------------------------------

    // // Turn on high speed external clock
    // RCC.CR.HSEON = true;
    // while(!RCC.CR.HSERDY) { }

    // // Configure PLL
    // with(RCC.PLLCFGR)
    // {
    //     setValue
    //     !(
    //           PLLSRC, true // HSE
    //         , PLLM,   8
    //         , PLLN,   360
    //         , PLLP,   2
    //         , PLLQ,   7
    //     )();
    // }

    // // Turn on PLL
    // RCC.CR.PLLON = true;
    // while(!RCC.CR.PLLRDY){ }

    // // Select the main PLL as system clock source
    // RCC.CFGR.SW = 0b10; // PLL
    // while(RCC.CFGR.SWS != RCC.CFGR.SW) { }

    // // random number generator
    // random.init();

    // // status LED
    // statusLED.init();

    // //Initialize the LCD
	// lcd.init();

    // Call C-main
    main();
}