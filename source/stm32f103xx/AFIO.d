module stm32f103xx.afio;

import stm32f103xx.mmio;

/*****************************************************************************
 Alternate function I/O
*/
final abstract class AFIO : Peripheral!(0x40010000)
{
    /*************************************************************************
     Event Control Register (AFIO_EVCR)
    */
    final abstract class EVCR : Register!(00)
    {
        /*********************************************************************
         Pin selection
        */
        alias PIN = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Port selection
        */
        alias PORT = BitField!(6, 4, Mutability.rw);

        /*********************************************************************
         Event Output Enable
        */
        alias EVOE = Bit!(7, Mutability.rw);
    }

    /*************************************************************************
     AF remap and debug I/O configuration register (AFIO_MAPR)
    */
    final abstract class MAPR : Register!(0x4)
    {
        /*********************************************************************
         SPI1 remapping
        */
        alias SPI1_REMAP = Bit!(0, Mutability.rw);

        /*********************************************************************
         I2C1 remapping
        */
        alias I2C1_REMAP = Bit!(1, Mutability.rw);

        /*********************************************************************
         USART1 remapping
        */
        alias USART1_REMAP = Bit!(2, Mutability.rw);

        /*********************************************************************
         USART2 remapping
        */
        alias USART2_REMAP = Bit!(3, Mutability.rw);

        /*********************************************************************
         USART3 remapping
        */
        alias USART3_REMAP = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         TIM1 remapping
        */
        alias TIM1_REMAP = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         TIM2 remapping
        */
        alias TIM2_REMAP = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         TIM3 remapping
        */
        alias TIM3_REMAP = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         TIM4 remapping
        */
        alias TIM4_REMAP = Bit!(12, Mutability.rw);

        /*********************************************************************
         CAN1 remapping
        */
        alias CAN_REMAP = BitField!(14, 13, Mutability.rw);

        /*********************************************************************
         Port D0/Port D1 mapping on OSCIN/OSCOUT
        */
        alias PD01_REMAP = Bit!(15, Mutability.rw);

        /*********************************************************************
         Set and cleared by software
        */
        alias TIM5CH4_IREMAP = Bit!(16, Mutability.rw);

        /*********************************************************************
         ADC 1 External trigger injected conversion remapping
        */
        alias ADC1_ETRGINJ_REMAP = Bit!(17, Mutability.rw);

        /*********************************************************************
         ADC 1 external trigger regular conversion remapping
        */
        alias ADC1_ETRGREG_REMAP = Bit!(18, Mutability.rw);

        /*********************************************************************
         ADC 2 external trigger injected conversion remapping
        */
        alias ADC2_ETRGINJ_REMAP = Bit!(19, Mutability.rw);

        /*********************************************************************
         ADC 2 external trigger regular conversion remapping
        */
        alias ADC2_ETRGREG_REMAP = Bit!(20, Mutability.rw);

        /*********************************************************************
         Serial wire JTAG configuration
        */
        alias SWJ_CFG = BitField!(26, 24, Mutability.w);
    }

    /*************************************************************************
     External interrupt configuration register 1 (AFIO_EXTICR1)
    */
    final abstract class EXTICR1 : Register!(0x8)
    {
        /*********************************************************************
         EXTI0 configuration
        */
        alias EXTI0 = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         EXTI1 configuration
        */
        alias EXTI1 = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         EXTI2 configuration
        */
        alias EXTI2 = BitField!(11, 8, Mutability.rw);

        /*********************************************************************
         EXTI3 configuration
        */
        alias EXTI3 = BitField!(15, 12, Mutability.rw);
    }

    /*************************************************************************
     External interrupt configuration register 2 (AFIO_EXTICR2)
    */
    final abstract class EXTICR2 : Register!(0xc)
    {
        /*********************************************************************
         EXTI4 configuration
        */
        alias EXTI4 = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         EXTI5 configuration
        */
        alias EXTI5 = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         EXTI6 configuration
        */
        alias EXTI6 = BitField!(11, 8, Mutability.rw);

        /*********************************************************************
         EXTI7 configuration
        */
        alias EXTI7 = BitField!(15, 12, Mutability.rw);
    }

    /*************************************************************************
     External interrupt configuration register 3 (AFIO_EXTICR3)
    */
    final abstract class EXTICR3 : Register!(0x10)
    {
        /*********************************************************************
         EXTI8 configuration
        */
        alias EXTI8 = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         EXTI9 configuration
        */
        alias EXTI9 = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         EXTI10 configuration
        */
        alias EXTI10 = BitField!(11, 8, Mutability.rw);

        /*********************************************************************
         EXTI11 configuration
        */
        alias EXTI11 = BitField!(15, 12, Mutability.rw);
    }

    /*************************************************************************
     External interrupt configuration register 4 (AFIO_EXTICR4)
    */
    final abstract class EXTICR4 : Register!(0x14)
    {
        /*********************************************************************
         EXTI12 configuration
        */
        alias EXTI12 = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         EXTI13 configuration
        */
        alias EXTI13 = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         EXTI14 configuration
        */
        alias EXTI14 = BitField!(11, 8, Mutability.rw);

        /*********************************************************************
         EXTI15 configuration
        */
        alias EXTI15 = BitField!(15, 12, Mutability.rw);
    }

    /*************************************************************************
     AF remap and debug I/O configuration register
    */
    final abstract class MAPR2 : Register!(0x1c)
    {
        /*********************************************************************
         TIM9 remapping
        */
        alias TIM9_REMAP = Bit!(5, Mutability.rw);

        /*********************************************************************
         TIM10 remapping
        */
        alias TIM10_REMAP = Bit!(6, Mutability.rw);

        /*********************************************************************
         TIM11 remapping
        */
        alias TIM11_REMAP = Bit!(7, Mutability.rw);

        /*********************************************************************
         TIM13 remapping
        */
        alias TIM13_REMAP = Bit!(8, Mutability.rw);

        /*********************************************************************
         TIM14 remapping
        */
        alias TIM14_REMAP = Bit!(9, Mutability.rw);

        /*********************************************************************
         NADV connect/disconnect
        */
        alias FSMC_NADV = Bit!(10, Mutability.rw);
    }
}
