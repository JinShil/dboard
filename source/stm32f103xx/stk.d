module stm32f103xx.stk;

import stm32f103xx.mmio;

/*****************************************************************************
 SysTick timer
*/
final abstract class STK : Peripheral!(0xE000E010)
{
    /*************************************************************************
     SysTick control and status register
    */
    final abstract class CTRL : Register!(00)
    {
        /*********************************************************************
         Counter enable
        */
        alias ENABLE = Bit!(0, Mutability.rw);

        /*********************************************************************
         SysTick exception request enable
        */
        alias TICKINT = Bit!(1, Mutability.rw);

        /*********************************************************************
         Clock source selection
        */
        alias CLKSOURCE = Bit!(2, Mutability.rw);

        /*********************************************************************
         COUNTFLAG
        */
        alias COUNTFLAG = Bit!(16, Mutability.rw);
    }

    /*************************************************************************
     SysTick reload value register
    */
    final abstract class LOAD_ : Register!(0x4)
    {
        /*********************************************************************
         RELOAD value
        */
        alias RELOAD = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     SysTick current value register
    */
    final abstract class VAL : Register!(0x8)
    {
        /*********************************************************************
         Current counter value
        */
        alias CURRENT = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     SysTick calibration value register
    */
    final abstract class CALIB : Register!(0xc)
    {
        /*********************************************************************
         Calibration value
        */
        alias TENMS = BitField!(23, 0, Mutability.rw);
    }
}
