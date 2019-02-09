module maplemini;

import gcc.attribute;

import arm.memory;

import stm32f103xx.rcc;
// import stm32f103xx.pwr;
import stm32f103xx.flash;
import stm32f103xx.nvic;

public import maplemini.trace;
public import led = maplemini.led;
public import usb = maplemini.usb;

// Program's main function
extern(C) void main();

/// Call signature of interrupt service routines
alias ISR = void function();

//----------------------------------------------------------------------
// Alias Interrupt Service Routine function pointers
// This are marked `extern(C)`` to avoid name mangling, so we can refer to
// it in our linker script
//----------------------------------------------------------------------

private extern(C) immutable ISR[75] _vectorTable =
[
      &onReset
    , &defaultHandler
    , &onHardFault
    , &defaultHandler
    , &onBusFault
    , &onUsageFault
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // WWDG
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // FLASH
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // EXTI2
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // DMA1_Channel2
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // DMA1_Channel6
    , &defaultHandler
    , &defaultHandler
    , &onUSBHighPriority

    , &usb.interrupt  // USB_LP_CAN_RX0
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // TIM1_BRK
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // TIM2
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // I2C1_ER
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // SPI2
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // EXTI15_10
    , &defaultHandler
    , &onUSBWakeup
    , &defaultHandler

    , &defaultHandler    // 44 TIM8_UP
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // 48 FSMC
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // 52 UART4
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler

    , &defaultHandler    // 56 DMA1_Channel1
    , &defaultHandler
    , &defaultHandler
    , &defaultHandler
];

/// Software entry point
void onReset()
{
    // Enable Core-coupled memory for stack
    // RCC.AHB1ENR.CCMDATARAMEN = true;

    hardwareInit();
}

private void defaultHandler()
{
    writeln!"Default Handler";
    while(true)
    { }
}

private void onHardFault()
{
    writeln!"Hard Fault";
    while(true)
    { }
}

private void onBusFault()
{
    writeln!"Bus Fault";
    while(true)
    { }
}

private void onUsageFault()
{
    writeln!"Usage Fault";
    while(true)
    { }
}

private void onUSBHighPriority()
{
    writeln!"USB High Priority Interrupt";
    while(true)
    { }
}

private void onUSBWakeup()
{
    writeln!"USB Wakeup Interrupt";
    while(true)
    { }
}

// defined in the linker
extern(C) extern __gshared ubyte __text_end__;
extern(C) extern __gshared ubyte __data_start__;
extern(C) extern __gshared ubyte __data_end__;
extern(C) extern __gshared ubyte __bss_start__;
extern(C) extern __gshared ubyte __bss_end__;

void hardwareInit()
{
    // copy data segment out of ROM and into RAM
    memcpy(&__data_start__, &__text_end__, &__data_end__ - &__data_start__);

    // zero out variables initialized to void
    memset(&__bss_start__, 0, &__bss_end__ - &__bss_start__);

    //----------------------------------------------------------------------
    // Flash configuration
    //----------------------------------------------------------------------

    // Enable Flash prefetch, Instruction cache, Data cache and wait state
    with(FLASH.ACR)
    {
        setValue
        !(
              PRFTBE,  true  // prefetch
            , LATENCY, 2     // 2 wait states are needed if 48 MHz < SYSCLK ≤ 72 MHz
        );                   // which will be configured later
    }

    //----------------------------------------------------------------------
    // Clock configuration
    //----------------------------------------------------------------------
    with (RCC.CR)
    {
        setValue
        !(
              HSION,     true      //Default to HSI on
            , HSEON,     false
            , CSSON,     false
            , PLLON,     false
        );
    }
    while(!RCC.CR.HSIRDY) { }

    // From the reference manual:
    // "The HSEBYP bit can be written only if the HSE oscillator is disabled."
    // It was disabled above.
    RCC.CR.HSEBYP = false;

    with(RCC.CFGR)
    {
        setValue
        !(
              MCO,      0
            , PLLSRC,   true  // HSE
            , PLLMUL,   0b111 // 8MHz * 9 = 72MHz
            , OTGFSPRE, 0     // USB must be 48MHz (72MHz / 1.5)
            , HPRE,     0b000 // AHB  = HCLK divided by 1
            , PPRE2,    0b100 // APB2 = HCLK divided by 2
            , PPRE1,    0b101 // APB1 = HCLK divide by 4
            , SW,       0     // HSI is system clock
        )();
    }

    //----------------------------------------------------------------------
    // External Clock configuration
    //----------------------------------------------------------------------

    // Turn on high speed external clock
    RCC.CR.HSEON = true;
    while(!RCC.CR.HSERDY) { }

    // Turn on PLL
    RCC.CR.PLLON = true;
    while(!RCC.CR.PLLRDY){ }

    // Select the main PLL as system clock source
    RCC.CFGR.SW = 0b10; // PLL
    while(RCC.CFGR.SWS != RCC.CFGR.SW) { }

    led.init();

    usb.init();

    // Call C-main
    main();
}