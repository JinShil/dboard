module stm32f103xx.rcc;

import stm32f103xx.mmio;

/*****************************************************************************
 Reset and clock control
*/
final abstract class RCC : Peripheral!(0x40021000)
{
    /*************************************************************************
     Clock control register
    */
    final abstract class CR : Register!(00)
    {
        /*********************************************************************
         Internal High Speed clock enable
        */
        alias HSION = Bit!(0, Mutability.rw);

        /*********************************************************************
         Internal High Speed clock ready flag
        */
        alias HSIRDY = Bit!(1, Mutability.r);

        /*********************************************************************
         Internal High Speed clock trimming
        */
        alias HSITRIM = BitField!(7, 3, Mutability.rw);

        /*********************************************************************
         Internal High Speed clock Calibration
        */
        alias HSICAL = BitField!(15, 8, Mutability.r);

        /*********************************************************************
         External High Speed clock enable
        */
        alias HSEON = Bit!(16, Mutability.rw);

        /*********************************************************************
         External High Speed clock ready flag
        */
        alias HSERDY = Bit!(17, Mutability.r);

        /*********************************************************************
         External High Speed clock Bypass
        */
        alias HSEBYP = Bit!(18, Mutability.rw);

        /*********************************************************************
         Clock Security System enable
        */
        alias CSSON = Bit!(19, Mutability.rw);

        /*********************************************************************
         PLL enable
        */
        alias PLLON = Bit!(24, Mutability.rw);

        /*********************************************************************
         PLL clock ready flag
        */
        alias PLLRDY = Bit!(25, Mutability.r);
    }

    /*************************************************************************
     Clock configuration register (RCC_CFGR)
    */
    final abstract class CFGR : Register!(0x4)
    {
        /*********************************************************************
         System clock Switch
        */
        alias SW = BitField!(1, 0, Mutability.rw);

        /*********************************************************************
         System Clock Switch Status
        */
        alias SWS = BitField!(3, 2, Mutability.r);

        /*********************************************************************
         AHB prescaler
        */
        alias HPRE = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         APB Low speed prescaler (APB1)
        */
        alias PPRE1 = BitField!(10, 8, Mutability.rw);

        /*********************************************************************
         APB High speed prescaler (APB2)
        */
        alias PPRE2 = BitField!(13, 11, Mutability.rw);

        /*********************************************************************
         ADC prescaler
        */
        alias ADCPRE = BitField!(15, 14, Mutability.rw);

        /*********************************************************************
         PLL entry clock source
        */
        alias PLLSRC = Bit!(16, Mutability.rw);

        /*********************************************************************
         HSE divider for PLL entry
        */
        alias PLLXTPRE = Bit!(17, Mutability.rw);

        /*********************************************************************
         PLL Multiplication Factor
        */
        alias PLLMUL = BitField!(21, 18, Mutability.rw);

        /*********************************************************************
         USB OTG FS prescaler
        */
        alias OTGFSPRE = Bit!(22, Mutability.rw);

        /*********************************************************************
         Microcontroller clock output
        */
        alias MCO = BitField!(26, 24, Mutability.rw);
    }

    /*************************************************************************
     Clock interrupt register (RCC_CIR)
    */
    final abstract class CIR : Register!(0x8)
    {
        /*********************************************************************
         LSI Ready Interrupt flag
        */
        alias LSIRDYF = Bit!(0, Mutability.r);

        /*********************************************************************
         LSE Ready Interrupt flag
        */
        alias LSERDYF = Bit!(1, Mutability.r);

        /*********************************************************************
         HSI Ready Interrupt flag
        */
        alias HSIRDYF = Bit!(2, Mutability.r);

        /*********************************************************************
         HSE Ready Interrupt flag
        */
        alias HSERDYF = Bit!(3, Mutability.r);

        /*********************************************************************
         PLL Ready Interrupt flag
        */
        alias PLLRDYF = Bit!(4, Mutability.r);

        /*********************************************************************
         Clock Security System Interrupt flag
        */
        alias CSSF = Bit!(7, Mutability.r);

        /*********************************************************************
         LSI Ready Interrupt Enable
        */
        alias LSIRDYIE = Bit!(8, Mutability.rw);

        /*********************************************************************
         LSE Ready Interrupt Enable
        */
        alias LSERDYIE = Bit!(9, Mutability.rw);

        /*********************************************************************
         HSI Ready Interrupt Enable
        */
        alias HSIRDYIE = Bit!(10, Mutability.rw);

        /*********************************************************************
         HSE Ready Interrupt Enable
        */
        alias HSERDYIE = Bit!(11, Mutability.rw);

        /*********************************************************************
         PLL Ready Interrupt Enable
        */
        alias PLLRDYIE = Bit!(12, Mutability.rw);

        /*********************************************************************
         LSI Ready Interrupt Clear
        */
        alias LSIRDYC = Bit!(16, Mutability.w);

        /*********************************************************************
         LSE Ready Interrupt Clear
        */
        alias LSERDYC = Bit!(17, Mutability.w);

        /*********************************************************************
         HSI Ready Interrupt Clear
        */
        alias HSIRDYC = Bit!(18, Mutability.w);

        /*********************************************************************
         HSE Ready Interrupt Clear
        */
        alias HSERDYC = Bit!(19, Mutability.w);

        /*********************************************************************
         PLL Ready Interrupt Clear
        */
        alias PLLRDYC = Bit!(20, Mutability.w);

        /*********************************************************************
         Clock security system interrupt clear
        */
        alias CSSC = Bit!(23, Mutability.w);
    }

    /*************************************************************************
     APB2 peripheral reset register (RCC_APB2RSTR)
    */
    final abstract class APB2RSTR : Register!(0xc)
    {
        /*********************************************************************
         Alternate function I/O reset
        */
        alias AFIORST = Bit!(0, Mutability.rw);

        /*********************************************************************
         IO port A reset
        */
        alias IOPARST = Bit!(2, Mutability.rw);

        /*********************************************************************
         IO port B reset
        */
        alias IOPBRST = Bit!(3, Mutability.rw);

        /*********************************************************************
         IO port C reset
        */
        alias IOPCRST = Bit!(4, Mutability.rw);

        /*********************************************************************
         IO port D reset
        */
        alias IOPDRST = Bit!(5, Mutability.rw);

        /*********************************************************************
         IO port E reset
        */
        alias IOPERST = Bit!(6, Mutability.rw);

        /*********************************************************************
         IO port F reset
        */
        alias IOPFRST = Bit!(7, Mutability.rw);

        /*********************************************************************
         IO port G reset
        */
        alias IOPGRST = Bit!(8, Mutability.rw);

        /*********************************************************************
         ADC 1 interface reset
        */
        alias ADC1RST = Bit!(9, Mutability.rw);

        /*********************************************************************
         ADC 2 interface reset
        */
        alias ADC2RST = Bit!(10, Mutability.rw);

        /*********************************************************************
         TIM1 timer reset
        */
        alias TIM1RST = Bit!(11, Mutability.rw);

        /*********************************************************************
         SPI 1 reset
        */
        alias SPI1RST = Bit!(12, Mutability.rw);

        /*********************************************************************
         TIM8 timer reset
        */
        alias TIM8RST = Bit!(13, Mutability.rw);

        /*********************************************************************
         USART1 reset
        */
        alias USART1RST = Bit!(14, Mutability.rw);

        /*********************************************************************
         ADC 3 interface reset
        */
        alias ADC3RST = Bit!(15, Mutability.rw);

        /*********************************************************************
         TIM9 timer reset
        */
        alias TIM9RST = Bit!(19, Mutability.rw);

        /*********************************************************************
         TIM10 timer reset
        */
        alias TIM10RST = Bit!(20, Mutability.rw);

        /*********************************************************************
         TIM11 timer reset
        */
        alias TIM11RST = Bit!(21, Mutability.rw);
    }

    /*************************************************************************
     APB1 peripheral reset register (RCC_APB1RSTR)
    */
    final abstract class APB1RSTR : Register!(0x10)
    {
        /*********************************************************************
         Timer 2 reset
        */
        alias TIM2RST = Bit!(0, Mutability.rw);

        /*********************************************************************
         Timer 3 reset
        */
        alias TIM3RST = Bit!(1, Mutability.rw);

        /*********************************************************************
         Timer 4 reset
        */
        alias TIM4RST = Bit!(2, Mutability.rw);

        /*********************************************************************
         Timer 5 reset
        */
        alias TIM5RST = Bit!(3, Mutability.rw);

        /*********************************************************************
         Timer 6 reset
        */
        alias TIM6RST = Bit!(4, Mutability.rw);

        /*********************************************************************
         Timer 7 reset
        */
        alias TIM7RST = Bit!(5, Mutability.rw);

        /*********************************************************************
         Timer 12 reset
        */
        alias TIM12RST = Bit!(6, Mutability.rw);

        /*********************************************************************
         Timer 13 reset
        */
        alias TIM13RST = Bit!(7, Mutability.rw);

        /*********************************************************************
         Timer 14 reset
        */
        alias TIM14RST = Bit!(8, Mutability.rw);

        /*********************************************************************
         Window watchdog reset
        */
        alias WWDGRST = Bit!(11, Mutability.rw);

        /*********************************************************************
         SPI2 reset
        */
        alias SPI2RST = Bit!(14, Mutability.rw);

        /*********************************************************************
         SPI3 reset
        */
        alias SPI3RST = Bit!(15, Mutability.rw);

        /*********************************************************************
         USART 2 reset
        */
        alias USART2RST = Bit!(17, Mutability.rw);

        /*********************************************************************
         USART 3 reset
        */
        alias USART3RST = Bit!(18, Mutability.rw);

        /*********************************************************************
         UART 4 reset
        */
        alias UART4RST = Bit!(19, Mutability.rw);

        /*********************************************************************
         UART 5 reset
        */
        alias UART5RST = Bit!(20, Mutability.rw);

        /*********************************************************************
         I2C1 reset
        */
        alias I2C1RST = Bit!(21, Mutability.rw);

        /*********************************************************************
         I2C2 reset
        */
        alias I2C2RST = Bit!(22, Mutability.rw);

        /*********************************************************************
         USB reset
        */
        alias USBRST = Bit!(23, Mutability.rw);

        /*********************************************************************
         CAN reset
        */
        alias CANRST = Bit!(25, Mutability.rw);

        /*********************************************************************
         Backup interface reset
        */
        alias BKPRST = Bit!(27, Mutability.rw);

        /*********************************************************************
         Power interface reset
        */
        alias PWRRST = Bit!(28, Mutability.rw);

        /*********************************************************************
         DAC interface reset
        */
        alias DACRST = Bit!(29, Mutability.rw);
    }

    /*************************************************************************
     AHB Peripheral Clock enable register (RCC_AHBENR)
    */
    final abstract class AHBENR : Register!(0x14)
    {
        /*********************************************************************
         DMA1 clock enable
        */
        alias DMA1EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         DMA2 clock enable
        */
        alias DMA2EN = Bit!(1, Mutability.rw);

        /*********************************************************************
         SRAM interface clock enable
        */
        alias SRAMEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         FLITF clock enable
        */
        alias FLITFEN = Bit!(4, Mutability.rw);

        /*********************************************************************
         CRC clock enable
        */
        alias CRCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         FSMC clock enable
        */
        alias FSMCEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         SDIO clock enable
        */
        alias SDIOEN = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     APB2 peripheral clock enable register (RCC_APB2ENR)
    */
    final abstract class APB2ENR : Register!(0x18)
    {
        /*********************************************************************
         Alternate function I/O clock enable
        */
        alias AFIOEN = Bit!(0, Mutability.rw);

        /*********************************************************************
         I/O port A clock enable
        */
        alias IOPAEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         I/O port B clock enable
        */
        alias IOPBEN = Bit!(3, Mutability.rw);

        /*********************************************************************
         I/O port C clock enable
        */
        alias IOPCEN = Bit!(4, Mutability.rw);

        /*********************************************************************
         I/O port D clock enable
        */
        alias IOPDEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         I/O port E clock enable
        */
        alias IOPEEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         I/O port F clock enable
        */
        alias IOPFEN = Bit!(7, Mutability.rw);

        /*********************************************************************
         I/O port G clock enable
        */
        alias IOPGEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         ADC 1 interface clock enable
        */
        alias ADC1EN = Bit!(9, Mutability.rw);

        /*********************************************************************
         ADC 2 interface clock enable
        */
        alias ADC2EN = Bit!(10, Mutability.rw);

        /*********************************************************************
         TIM1 Timer clock enable
        */
        alias TIM1EN = Bit!(11, Mutability.rw);

        /*********************************************************************
         SPI 1 clock enable
        */
        alias SPI1EN = Bit!(12, Mutability.rw);

        /*********************************************************************
         TIM8 Timer clock enable
        */
        alias TIM8EN = Bit!(13, Mutability.rw);

        /*********************************************************************
         USART1 clock enable
        */
        alias USART1EN = Bit!(14, Mutability.rw);

        /*********************************************************************
         ADC3 interface clock enable
        */
        alias ADC3EN = Bit!(15, Mutability.rw);

        /*********************************************************************
         TIM9 Timer clock enable
        */
        alias TIM9EN = Bit!(19, Mutability.rw);

        /*********************************************************************
         TIM10 Timer clock enable
        */
        alias TIM10EN = Bit!(20, Mutability.rw);

        /*********************************************************************
         TIM11 Timer clock enable
        */
        alias TIM11EN = Bit!(21, Mutability.rw);
    }

    /*************************************************************************
     APB1 peripheral clock enable register (RCC_APB1ENR)
    */
    final abstract class APB1ENR : Register!(0x1c)
    {
        /*********************************************************************
         Timer 2 clock enable
        */
        alias TIM2EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Timer 3 clock enable
        */
        alias TIM3EN = Bit!(1, Mutability.rw);

        /*********************************************************************
         Timer 4 clock enable
        */
        alias TIM4EN = Bit!(2, Mutability.rw);

        /*********************************************************************
         Timer 5 clock enable
        */
        alias TIM5EN = Bit!(3, Mutability.rw);

        /*********************************************************************
         Timer 6 clock enable
        */
        alias TIM6EN = Bit!(4, Mutability.rw);

        /*********************************************************************
         Timer 7 clock enable
        */
        alias TIM7EN = Bit!(5, Mutability.rw);

        /*********************************************************************
         Timer 12 clock enable
        */
        alias TIM12EN = Bit!(6, Mutability.rw);

        /*********************************************************************
         Timer 13 clock enable
        */
        alias TIM13EN = Bit!(7, Mutability.rw);

        /*********************************************************************
         Timer 14 clock enable
        */
        alias TIM14EN = Bit!(8, Mutability.rw);

        /*********************************************************************
         Window watchdog clock enable
        */
        alias WWDGEN = Bit!(11, Mutability.rw);

        /*********************************************************************
         SPI 2 clock enable
        */
        alias SPI2EN = Bit!(14, Mutability.rw);

        /*********************************************************************
         SPI 3 clock enable
        */
        alias SPI3EN = Bit!(15, Mutability.rw);

        /*********************************************************************
         USART 2 clock enable
        */
        alias USART2EN = Bit!(17, Mutability.rw);

        /*********************************************************************
         USART 3 clock enable
        */
        alias USART3EN = Bit!(18, Mutability.rw);

        /*********************************************************************
         UART 4 clock enable
        */
        alias UART4EN = Bit!(19, Mutability.rw);

        /*********************************************************************
         UART 5 clock enable
        */
        alias UART5EN = Bit!(20, Mutability.rw);

        /*********************************************************************
         I2C 1 clock enable
        */
        alias I2C1EN = Bit!(21, Mutability.rw);

        /*********************************************************************
         I2C 2 clock enable
        */
        alias I2C2EN = Bit!(22, Mutability.rw);

        /*********************************************************************
         USB clock enable
        */
        alias USBEN = Bit!(23, Mutability.rw);

        /*********************************************************************
         CAN clock enable
        */
        alias CANEN = Bit!(25, Mutability.rw);

        /*********************************************************************
         Backup interface clock enable
        */
        alias BKPEN = Bit!(27, Mutability.rw);

        /*********************************************************************
         Power interface clock enable
        */
        alias PWREN = Bit!(28, Mutability.rw);

        /*********************************************************************
         DAC interface clock enable
        */
        alias DACEN = Bit!(29, Mutability.rw);
    }

    /*************************************************************************
     Backup domain control register (RCC_BDCR)
    */
    final abstract class BDCR : Register!(0x20)
    {
        /*********************************************************************
         External Low Speed oscillator enable
        */
        alias LSEON = Bit!(0, Mutability.rw);

        /*********************************************************************
         External Low Speed oscillator ready
        */
        alias LSERDY = Bit!(1, Mutability.r);

        /*********************************************************************
         External Low Speed oscillator bypass
        */
        alias LSEBYP = Bit!(2, Mutability.rw);

        /*********************************************************************
         RTC clock source selection
        */
        alias RTCSEL = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         RTC clock enable
        */
        alias RTCEN = Bit!(15, Mutability.rw);

        /*********************************************************************
         Backup domain software reset
        */
        alias BDRST = Bit!(16, Mutability.rw);
    }

    /*************************************************************************
     Control/status register (RCC_CSR)
    */
    final abstract class CSR : Register!(0x24)
    {
        /*********************************************************************
         Internal low speed oscillator enable
        */
        alias LSION = Bit!(0, Mutability.rw);

        /*********************************************************************
         Internal low speed oscillator ready
        */
        alias LSIRDY = Bit!(1, Mutability.r);

        /*********************************************************************
         Remove reset flag
        */
        alias RMVF = Bit!(24, Mutability.rw);

        /*********************************************************************
         PIN reset flag
        */
        alias PINRSTF = Bit!(26, Mutability.rw);

        /*********************************************************************
         POR/PDR reset flag
        */
        alias PORRSTF = Bit!(27, Mutability.rw);

        /*********************************************************************
         Software reset flag
        */
        alias SFTRSTF = Bit!(28, Mutability.rw);

        /*********************************************************************
         Independent watchdog reset flag
        */
        alias IWDGRSTF = Bit!(29, Mutability.rw);

        /*********************************************************************
         Window watchdog reset flag
        */
        alias WWDGRSTF = Bit!(30, Mutability.rw);

        /*********************************************************************
         Low-power reset flag
        */
        alias LPWRRSTF = Bit!(31, Mutability.rw);
    }
}
