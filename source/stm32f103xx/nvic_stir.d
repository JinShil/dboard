module stm32f103xx.nvic_stir;

import stm32f103xx.mmio;

/*****************************************************************************
 Nested vectored interrupt controller
*/
final abstract class NVIC_STIR : Peripheral!(0xE000EF00)
{
    /*************************************************************************
     Software trigger interrupt register
    */
    final abstract class STIR : Register!(00)
    {
        /*********************************************************************
         Software generated interrupt ID
        */
        alias INTID = BitField!(8, 0, Mutability.rw);
    }
}
