module stm32f103xx.gpioe;

import stm32f103xx.mmio;

/*****************************************************************************
 
*/
final abstract class GPIOE : Peripheral!(0x40011800)
{
    /*************************************************************************
     Port configuration register low (GPIOn_CRL)
    */
    final abstract class CRL : Register!(00)
    {
        /*********************************************************************
         Port n.0 mode bits
        */
        alias MODE0 = BitField!(1, 0, Mutability.rw);

        /*********************************************************************
         Port n.0 configuration bits
        */
        alias CNF0 = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         Port n.1 mode bits
        */
        alias MODE1 = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Port n.1 configuration bits
        */
        alias CNF1 = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         Port n.2 mode bits
        */
        alias MODE2 = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Port n.2 configuration bits
        */
        alias CNF2 = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Port n.3 mode bits
        */
        alias MODE3 = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Port n.3 configuration bits
        */
        alias CNF3 = BitField!(15, 14, Mutability.rw);

        /*********************************************************************
         Port n.4 mode bits
        */
        alias MODE4 = BitField!(17, 16, Mutability.rw);

        /*********************************************************************
         Port n.4 configuration bits
        */
        alias CNF4 = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Port n.5 mode bits
        */
        alias MODE5 = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Port n.5 configuration bits
        */
        alias CNF5 = BitField!(23, 22, Mutability.rw);

        /*********************************************************************
         Port n.6 mode bits
        */
        alias MODE6 = BitField!(25, 24, Mutability.rw);

        /*********************************************************************
         Port n.6 configuration bits
        */
        alias CNF6 = BitField!(27, 26, Mutability.rw);

        /*********************************************************************
         Port n.7 mode bits
        */
        alias MODE7 = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         Port n.7 configuration bits
        */
        alias CNF7 = BitField!(31, 30, Mutability.rw);
    }

    /*************************************************************************
     Port configuration register high (GPIOn_CRL)
    */
    final abstract class CRH : Register!(0x4)
    {
        /*********************************************************************
         Port n.8 mode bits
        */
        alias MODE8 = BitField!(1, 0, Mutability.rw);

        /*********************************************************************
         Port n.8 configuration bits
        */
        alias CNF8 = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         Port n.9 mode bits
        */
        alias MODE9 = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Port n.9 configuration bits
        */
        alias CNF9 = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         Port n.10 mode bits
        */
        alias MODE10 = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Port n.10 configuration bits
        */
        alias CNF10 = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Port n.11 mode bits
        */
        alias MODE11 = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Port n.11 configuration bits
        */
        alias CNF11 = BitField!(15, 14, Mutability.rw);

        /*********************************************************************
         Port n.12 mode bits
        */
        alias MODE12 = BitField!(17, 16, Mutability.rw);

        /*********************************************************************
         Port n.12 configuration bits
        */
        alias CNF12 = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Port n.13 mode bits
        */
        alias MODE13 = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Port n.13 configuration bits
        */
        alias CNF13 = BitField!(23, 22, Mutability.rw);

        /*********************************************************************
         Port n.14 mode bits
        */
        alias MODE14 = BitField!(25, 24, Mutability.rw);

        /*********************************************************************
         Port n.14 configuration bits
        */
        alias CNF14 = BitField!(27, 26, Mutability.rw);

        /*********************************************************************
         Port n.15 mode bits
        */
        alias MODE15 = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         Port n.15 configuration bits
        */
        alias CNF15 = BitField!(31, 30, Mutability.rw);
    }

    /*************************************************************************
     Port input data register (GPIOn_IDR)
    */
    final abstract class IDR : Register!(0x8)
    {
        /*********************************************************************
         Port input data
        */
        alias IDR0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR8 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR9 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR10 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR11 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR12 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR13 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR14 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Port input data
        */
        alias IDR15 = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     Port output data register (GPIOn_ODR)
    */
    final abstract class ODR : Register!(0xc)
    {
        /*********************************************************************
         Port output data
        */
        alias ODR0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR8 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR9 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR10 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR11 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR12 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR13 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR14 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Port output data
        */
        alias ODR15 = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     Port bit set/reset register (GPIOn_BSRR)
    */
    final abstract class BSRR : Register!(0x10)
    {
        /*********************************************************************
         Set bit 0
        */
        alias BS0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Set bit 1
        */
        alias BS1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Set bit 1
        */
        alias BS2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Set bit 3
        */
        alias BS3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Set bit 4
        */
        alias BS4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Set bit 5
        */
        alias BS5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Set bit 6
        */
        alias BS6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Set bit 7
        */
        alias BS7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Set bit 8
        */
        alias BS8 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Set bit 9
        */
        alias BS9 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Set bit 10
        */
        alias BS10 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Set bit 11
        */
        alias BS11 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Set bit 12
        */
        alias BS12 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Set bit 13
        */
        alias BS13 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Set bit 14
        */
        alias BS14 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Set bit 15
        */
        alias BS15 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Reset bit 0
        */
        alias BR0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Reset bit 1
        */
        alias BR1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Reset bit 2
        */
        alias BR2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Reset bit 3
        */
        alias BR3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Reset bit 4
        */
        alias BR4 = Bit!(20, Mutability.rw);

        /*********************************************************************
         Reset bit 5
        */
        alias BR5 = Bit!(21, Mutability.rw);

        /*********************************************************************
         Reset bit 6
        */
        alias BR6 = Bit!(22, Mutability.rw);

        /*********************************************************************
         Reset bit 7
        */
        alias BR7 = Bit!(23, Mutability.rw);

        /*********************************************************************
         Reset bit 8
        */
        alias BR8 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Reset bit 9
        */
        alias BR9 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Reset bit 10
        */
        alias BR10 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Reset bit 11
        */
        alias BR11 = Bit!(27, Mutability.rw);

        /*********************************************************************
         Reset bit 12
        */
        alias BR12 = Bit!(28, Mutability.rw);

        /*********************************************************************
         Reset bit 13
        */
        alias BR13 = Bit!(29, Mutability.rw);

        /*********************************************************************
         Reset bit 14
        */
        alias BR14 = Bit!(30, Mutability.rw);

        /*********************************************************************
         Reset bit 15
        */
        alias BR15 = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Port bit reset register (GPIOn_BRR)
    */
    final abstract class BRR : Register!(0x14)
    {
        /*********************************************************************
         Reset bit 0
        */
        alias BR0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Reset bit 1
        */
        alias BR1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Reset bit 1
        */
        alias BR2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Reset bit 3
        */
        alias BR3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Reset bit 4
        */
        alias BR4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Reset bit 5
        */
        alias BR5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Reset bit 6
        */
        alias BR6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Reset bit 7
        */
        alias BR7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Reset bit 8
        */
        alias BR8 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Reset bit 9
        */
        alias BR9 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Reset bit 10
        */
        alias BR10 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Reset bit 11
        */
        alias BR11 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Reset bit 12
        */
        alias BR12 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Reset bit 13
        */
        alias BR13 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Reset bit 14
        */
        alias BR14 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Reset bit 15
        */
        alias BR15 = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     Port configuration lock register
    */
    final abstract class LCKR : Register!(0x18)
    {
        /*********************************************************************
         Port A Lock bit 0
        */
        alias LCK0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 1
        */
        alias LCK1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 2
        */
        alias LCK2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 3
        */
        alias LCK3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 4
        */
        alias LCK4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 5
        */
        alias LCK5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 6
        */
        alias LCK6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 7
        */
        alias LCK7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 8
        */
        alias LCK8 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 9
        */
        alias LCK9 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 10
        */
        alias LCK10 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 11
        */
        alias LCK11 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 12
        */
        alias LCK12 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 13
        */
        alias LCK13 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 14
        */
        alias LCK14 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Port A Lock bit 15
        */
        alias LCK15 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Lock key
        */
        alias LCKK = Bit!(16, Mutability.rw);
    }
}
