module stm32f103xx.wwdg;

import stm32f103xx.mmio;

/*****************************************************************************
 Window watchdog
*/
final abstract class WWDG : Peripheral!(0x40002C00)
{
    /*************************************************************************
     Control register (WWDG_CR)
    */
    final abstract class CR : Register!(00)
    {
        /*********************************************************************
         7-bit counter (MSB to LSB)
        */
        alias T = BitField!(6, 0, Mutability.rw);

        /*********************************************************************
         Activation bit
        */
        alias WDGA = Bit!(7, Mutability.rw);
    }

    /*************************************************************************
     Configuration register (WWDG_CFR)
    */
    final abstract class CFR : Register!(0x4)
    {
        /*********************************************************************
         7-bit window value
        */
        alias W = BitField!(6, 0, Mutability.rw);

        /*********************************************************************
         Timer Base
        */
        alias WDGTB = BitField!(8, 7, Mutability.rw);

        /*********************************************************************
         Early Wakeup Interrupt
        */
        alias EWI = Bit!(9, Mutability.rw);
    }

    /*************************************************************************
     Status register (WWDG_SR)
    */
    final abstract class SR : Register!(0x8)
    {
        /*********************************************************************
         Early Wakeup Interrupt
        */
        alias EWI = Bit!(0, Mutability.rw);
    }
}
