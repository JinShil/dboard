module atsamd21g18a.port;

import mvf.mmio;

/*****************************************************************************
 Port Module
*/
final abstract class PORT : Peripheral!(0x41004400)
{
    /*************************************************************************
     Write Configuration
    */
    final abstract class WRCONFIG1 : Register!(0x28)
    {
        /*********************************************************************
         Pin Mask for Multiple Pin Configuration
        */
        alias PINMASK = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Peripheral Multiplexer Enable
        */
        alias PMUXEN = Bit!(16, Mutability.rw);

        /*********************************************************************
         Input Enable
        */
        alias INEN = Bit!(17, Mutability.rw);

        /*********************************************************************
         Pull Enable
        */
        alias PULLEN = Bit!(18, Mutability.rw);

        /*********************************************************************
         Output Driver Strength Selection
        */
        alias DRVSTR = Bit!(22, Mutability.rw);

        /*********************************************************************
         Peripheral Multiplexing
        */
        alias PMUX = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         Write PMUX
        */
        alias WRPMUX = Bit!(28, Mutability.rw);

        /*********************************************************************
         Write PINCFG
        */
        alias WRPINCFG = Bit!(30, Mutability.rw);

        /*********************************************************************
         Half-Word Select
        */
        alias HWSEL = Bit!(31, Mutability.rw);
    }
    /*************************************************************************
     Write Configuration
    */
    final abstract class WRCONFIG2 : Register!(0xa8)
    {
        /*********************************************************************
         Pin Mask for Multiple Pin Configuration
        */
        alias PINMASK = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Peripheral Multiplexer Enable
        */
        alias PMUXEN = Bit!(16, Mutability.rw);

        /*********************************************************************
         Input Enable
        */
        alias INEN = Bit!(17, Mutability.rw);

        /*********************************************************************
         Pull Enable
        */
        alias PULLEN = Bit!(18, Mutability.rw);

        /*********************************************************************
         Output Driver Strength Selection
        */
        alias DRVSTR = Bit!(22, Mutability.rw);

        /*********************************************************************
         Peripheral Multiplexing
        */
        alias PMUX = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         Write PMUX
        */
        alias WRPMUX = Bit!(28, Mutability.rw);

        /*********************************************************************
         Write PINCFG
        */
        alias WRPINCFG = Bit!(30, Mutability.rw);

        /*********************************************************************
         Half-Word Select
        */
        alias HWSEL = Bit!(31, Mutability.rw);
    }

    /*************************************************************
      A block of 32 pins
    */
    enum P
    {
        A = 0
        , B = 1
    }

    /*************************************************************************
     Data Direction
    */
    final abstract class DIR(P port) : Register!(0x00 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Direction
        */
        alias DIR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Direction Clear
    */
    final abstract class DIRCLR(P port) : Register!(0x4 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Direction Clear
        */
        alias DIRCLR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Direction Set
    */
    final abstract class DIRSET(P port) : Register!(0x8 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Direction Set
        */
        alias DIRSET = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Direction Toggle
    */
    final abstract class DIRTGL(P port) : Register!(0xc + (port * 0x80))
    {
        /*********************************************************************
         Port Data Direction Toggle
        */
        alias DIRTGL = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Output Value
    */
    final abstract class OUT(P port) : Register!(0x10 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Output Value
        */
        alias OUT = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Output Value Clear
    */
    final abstract class OUTCLR(P port) : Register!(0x14 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Output Value Clear
        */
        alias OUTCLR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Output Value Set
    */
    final abstract class OUTSET(P port) : Register!(0x18 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Output Value Set
        */
        alias OUTSET = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Output Value Toggle
    */
    final abstract class OUTTGL(P port) : Register!(0x1c + (port * 0x80))
    {
        /*********************************************************************
         Port Data Output Value Toggle
        */
        alias OUTTGL = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Data Input Value
    */
    final abstract class IN(P port) : Register!(0x20 + (port * 0x80))
    {
        /*********************************************************************
         Port Data Input Value
        */
        alias IN = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Control
    */
    final abstract class CTRL(P port) : Register!(0x24 + (port * 0x80))
    {
        /*********************************************************************
         Input Sampling Mode
        */
        alias SAMPLING = BitField!(31, 0, Mutability.w);
    }

    /*************************************************************
        Peripheral Function
    */
    enum FUNCValues
    {
        /*************************************************************
            Peripheral function A selected
        */
        A = 0x0,

        /*************************************************************
            Peripheral function B selected
        */
        B = 0x1,

        /*************************************************************
            Peripheral function C selected
        */
        C = 0x2,

        /*************************************************************
            Peripheral function D selected
        */
        D = 0x3,

        /*************************************************************
            Peripheral function E selected
        */
        E = 0x4,

        /*************************************************************
            Peripheral function F selected
        */
        F = 0x5,

        /*************************************************************
            Peripheral function G selected
        */
        G = 0x6
    }

    /*************************************************************
      Peripheral Multiplexing
    */
    final abstract class PMUX(P port, byte pin) : Register!(0x30 + (pin / 2) + (port * 0x80))
    {
        static if ((pin % 2) == 0)
        {
            alias FUNC = BitField!(3, 0, Mutability.rw, FUNCValues);
        }
        else
        {
            alias FUNC = BitField!(7, 4, Mutability.rw, FUNCValues);
        }
    }

    /*************************************************************
      Pin Configuration
    */
    final abstract class PINCFG(P port, byte pin) : Register!(0x40 + pin + (port * 0x80))
    {
        /*********************************************************************
         Peripheral Multiplexer Enable
        */
        alias PMUXEN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Input Enable
        */
        alias INEN = Bit!(1, Mutability.rw);

        /*********************************************************************
         Pull Enable
        */
        alias PULLEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         Output Driver Strength Selection
        */
        alias DRVSTR = Bit!(6, Mutability.w);
    }
}
