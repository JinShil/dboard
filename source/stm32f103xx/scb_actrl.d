module stm32f103xx.scb_actrl;

import stm32f103xx.mmio;

/*****************************************************************************
 System control block ACTLR
*/
final abstract class SCB_ACTRL : Peripheral!(0xE000E008)
{
    /*************************************************************************
     Auxiliary control register
    */
    final abstract class ACTRL : Register!(00)
    {
        /*********************************************************************
         DISFOLD
        */
        alias DISFOLD = Bit!(2, Mutability.rw);

        /*********************************************************************
         FPEXCODIS
        */
        alias FPEXCODIS = Bit!(10, Mutability.rw);

        /*********************************************************************
         DISRAMODE
        */
        alias DISRAMODE = Bit!(11, Mutability.rw);

        /*********************************************************************
         DISITMATBFLUSH
        */
        alias DISITMATBFLUSH = Bit!(12, Mutability.rw);
    }
}
