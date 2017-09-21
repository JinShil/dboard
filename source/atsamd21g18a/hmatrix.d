module atsamd21g18a.hmatrix;

import mvf.mmio;

/*****************************************************************************
 HSB Matrix
*/
final abstract class HMATRIX : Peripheral!(0x41007000)
{
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS1 : Register!(0x80)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS2 : Register!(0x88)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS3 : Register!(0x90)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS4 : Register!(0x98)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS5 : Register!(0xa0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS6 : Register!(0xa8)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS7 : Register!(0xb0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS8 : Register!(0xb8)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS9 : Register!(0xc0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS10 : Register!(0xc8)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS11 : Register!(0xd0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS12 : Register!(0xd8)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS13 : Register!(0xe0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS14 : Register!(0xe8)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS15 : Register!(0xf0)
    {
    }
    /*************************************************************************
     Priority A for Slave
    */
    final abstract class PRAS16 : Register!(0xf8)
    {
    }

    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS1 : Register!(0x84)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS2 : Register!(0x8c)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS3 : Register!(0x94)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS4 : Register!(0x9c)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS5 : Register!(0xa4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS6 : Register!(0xac)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS7 : Register!(0xb4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS8 : Register!(0xbc)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS9 : Register!(0xc4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS10 : Register!(0xcc)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS11 : Register!(0xd4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS12 : Register!(0xdc)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS13 : Register!(0xe4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS14 : Register!(0xec)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS15 : Register!(0xf4)
    {
    }
    /*************************************************************************
     Priority B for Slave
    */
    final abstract class PRBS16 : Register!(0xfc)
    {
    }

    /*************************************************************************
     Special Function
    */
    final abstract class SFR1 : Register!(0x110)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR2 : Register!(0x114)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR3 : Register!(0x118)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR4 : Register!(0x11c)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR5 : Register!(0x120)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR6 : Register!(0x124)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR7 : Register!(0x128)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR8 : Register!(0x12c)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR9 : Register!(0x130)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR10 : Register!(0x134)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR11 : Register!(0x138)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR12 : Register!(0x13c)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR13 : Register!(0x140)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR14 : Register!(0x144)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR15 : Register!(0x148)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
    /*************************************************************************
     Special Function
    */
    final abstract class SFR16 : Register!(0x14c)
    {
        /*********************************************************************
         Special Function Register
        */
        alias SFR = BitField!(31, 0, Mutability.rw);
    }
}
