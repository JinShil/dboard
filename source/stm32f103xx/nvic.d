module stm32f103xx.nvic;

import stm32f103xx.mmio;

/*****************************************************************************
 Nested Vectored Interrupt Controller
*/
final abstract class NVIC : Peripheral!(0xE000E100)
{
    /*************************************************************************
     Interrupt Set-Enable Register
    */
    final abstract class ISER0 : Register!(00)
    {
        /*********************************************************************
         SETENA
        */
        alias SETENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Set-Enable Register
    */
    final abstract class ISER1 : Register!(0x4)
    {
        /*********************************************************************
         SETENA
        */
        alias SETENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear-Enable Register
    */
    final abstract class ICER0 : Register!(0x80)
    {
        /*********************************************************************
         CLRENA
        */
        alias CLRENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear-Enable Register
    */
    final abstract class ICER1 : Register!(0x84)
    {
        /*********************************************************************
         CLRENA
        */
        alias CLRENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Set-Pending Register
    */
    final abstract class ISPR0 : Register!(0x100)
    {
        /*********************************************************************
         SETPEND
        */
        alias SETPEND = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Set-Pending Register
    */
    final abstract class ISPR1 : Register!(0x104)
    {
        /*********************************************************************
         SETPEND
        */
        alias SETPEND = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear-Pending Register
    */
    final abstract class ICPR0 : Register!(0x180)
    {
        /*********************************************************************
         CLRPEND
        */
        alias CLRPEND = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear-Pending Register
    */
    final abstract class ICPR1 : Register!(0x184)
    {
        /*********************************************************************
         CLRPEND
        */
        alias CLRPEND = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Active Bit Register
    */
    final abstract class IABR0 : Register!(0x200)
    {
        /*********************************************************************
         ACTIVE
        */
        alias ACTIVE = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Active Bit Register
    */
    final abstract class IABR1 : Register!(0x204)
    {
        /*********************************************************************
         ACTIVE
        */
        alias ACTIVE = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR0 : Register!(0x300)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR1 : Register!(0x304)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR2 : Register!(0x308)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR3 : Register!(0x30c)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR4 : Register!(0x310)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR5 : Register!(0x314)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR6 : Register!(0x318)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR7 : Register!(0x31c)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR8 : Register!(0x320)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR9 : Register!(0x324)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR10 : Register!(0x328)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR11 : Register!(0x32c)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR12 : Register!(0x330)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR13 : Register!(0x334)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Priority Register
    */
    final abstract class IPR14 : Register!(0x338)
    {
        /*********************************************************************
         IPR_N0
        */
        alias IPR_N0 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         IPR_N1
        */
        alias IPR_N1 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IPR_N2
        */
        alias IPR_N2 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IPR_N3
        */
        alias IPR_N3 = BitField!(31, 24, Mutability.rw);
    }
}
