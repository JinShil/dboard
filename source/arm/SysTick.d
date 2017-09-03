module armcm0.systick;

import mvf.mmio;

/*****************************************************************************
 24Bit System Tick Timer for use in RTOS
*/
final abstract class SysTick : Peripheral!(0xE000E010)
{
    /*************************************************************************
     SysTick Control and Status Register
    */
    final abstract class CSR : Register!(00)
    {
        /*****************************************************************
         ENABLE's possible values
        */
        enum ENABLEValues
        {
            /*************************************************************
             disabled
            */
            _0 = 0,

            /*************************************************************
             enabled
            */
            _1 = 1,
        }

        /*********************************************************************
         Enable SysTick Timer
        */
        alias ENABLE = Bit!(0, Mutability.rw, ENABLEValues);

        /*****************************************************************
         TICKINT's possible values
        */
        enum TICKINTValues
        {
            /*************************************************************
             Enable SysTick Exception
            */
            _0 = 0,

            /*************************************************************
             Disable SysTick Exception
            */
            _1 = 1,
        }

        /*********************************************************************
         Generate Tick Interrupt
        */
        alias TICKINT = Bit!(1, Mutability.rw, TICKINTValues);

        /*****************************************************************
         CLKSOURCE's possible values
        */
        enum CLKSOURCEValues
        {
            /*************************************************************
             External Clock
            */
            _0 = 0,

            /*************************************************************
             CPU Clock
            */
            _1 = 1,
        }

        /*********************************************************************
         Source to count from
        */
        alias CLKSOURCE = Bit!(2, Mutability.rw, CLKSOURCEValues);

        /*********************************************************************
         SysTick counted to zero
        */
        alias COUNTFLAG = Bit!(16, Mutability.rw);
    }

    /*************************************************************************
     SysTick Reload Value Register
    */
    final abstract class RVR : Register!(0x4)
    {
        /*********************************************************************
         Value to auto reload SysTick after reaching zero
        */
        alias RELOAD = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     SysTick Current Value Register
    */
    final abstract class CVR : Register!(0x8)
    {
        /*********************************************************************
         Current value
        */
        alias CURRENT = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     SysTick Calibration Value Register
    */
    final abstract class CALIB : Register!(0xc)
    {
        /*********************************************************************
         Reload value to use for 10ms timing
        */
        alias TENMS = BitField!(23, 0, Mutability.r);

        /*****************************************************************
         SKEW's possible values
        */
        enum SKEWValues
        {
            /*************************************************************
             10ms calibration value is exact
            */
            _0 = 0,

            /*************************************************************
             10ms calibration value is inexact, because of the clock frequency
            */
            _1 = 1,
        }

        /*********************************************************************
         Clock Skew
        */
        alias SKEW = Bit!(30, Mutability.r, SKEWValues);

        /*****************************************************************
         NOREF's possible values
        */
        enum NOREFValues
        {
            /*************************************************************
             Ref Clk available
            */
            _0 = 0,

            /*************************************************************
             Ref Clk not available
            */
            _1 = 1,
        }

        /*********************************************************************
         No Ref
        */
        alias NOREF = Bit!(31, Mutability.r, NOREFValues);
    }
}
