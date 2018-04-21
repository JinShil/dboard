module stm32f103xx.bkp;

import stm32f103xx.mmio;

/*****************************************************************************
 Backup registers
*/
final abstract class BKP : Peripheral!(0x40006C04)
{
    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR1 : Register!(00)
    {
        /*********************************************************************
         Backup data
        */
        alias D1 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR2 : Register!(0x4)
    {
        /*********************************************************************
         Backup data
        */
        alias D2 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR3 : Register!(0x8)
    {
        /*********************************************************************
         Backup data
        */
        alias D3 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR4 : Register!(0xc)
    {
        /*********************************************************************
         Backup data
        */
        alias D4 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR5 : Register!(0x10)
    {
        /*********************************************************************
         Backup data
        */
        alias D5 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR6 : Register!(0x14)
    {
        /*********************************************************************
         Backup data
        */
        alias D6 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR7 : Register!(0x18)
    {
        /*********************************************************************
         Backup data
        */
        alias D7 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR8 : Register!(0x1c)
    {
        /*********************************************************************
         Backup data
        */
        alias D8 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR9 : Register!(0x20)
    {
        /*********************************************************************
         Backup data
        */
        alias D9 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR10 : Register!(0x24)
    {
        /*********************************************************************
         Backup data
        */
        alias D10 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR11 : Register!(0x3c)
    {
        /*********************************************************************
         Backup data
        */
        alias DR11 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR12 : Register!(0x40)
    {
        /*********************************************************************
         Backup data
        */
        alias DR12 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR13 : Register!(0x44)
    {
        /*********************************************************************
         Backup data
        */
        alias DR13 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR14 : Register!(0x48)
    {
        /*********************************************************************
         Backup data
        */
        alias D14 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR15 : Register!(0x4c)
    {
        /*********************************************************************
         Backup data
        */
        alias D15 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR16 : Register!(0x50)
    {
        /*********************************************************************
         Backup data
        */
        alias D16 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR17 : Register!(0x54)
    {
        /*********************************************************************
         Backup data
        */
        alias D17 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR18 : Register!(0x58)
    {
        /*********************************************************************
         Backup data
        */
        alias D18 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR19 : Register!(0x5c)
    {
        /*********************************************************************
         Backup data
        */
        alias D19 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR20 : Register!(0x60)
    {
        /*********************************************************************
         Backup data
        */
        alias D20 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR21 : Register!(0x64)
    {
        /*********************************************************************
         Backup data
        */
        alias D21 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR22 : Register!(0x68)
    {
        /*********************************************************************
         Backup data
        */
        alias D22 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR23 : Register!(0x6c)
    {
        /*********************************************************************
         Backup data
        */
        alias D23 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR24 : Register!(0x70)
    {
        /*********************************************************************
         Backup data
        */
        alias D24 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR25 : Register!(0x74)
    {
        /*********************************************************************
         Backup data
        */
        alias D25 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR26 : Register!(0x78)
    {
        /*********************************************************************
         Backup data
        */
        alias D26 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR27 : Register!(0x7c)
    {
        /*********************************************************************
         Backup data
        */
        alias D27 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR28 : Register!(0x80)
    {
        /*********************************************************************
         Backup data
        */
        alias D28 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR29 : Register!(0x84)
    {
        /*********************************************************************
         Backup data
        */
        alias D29 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR30 : Register!(0x88)
    {
        /*********************************************************************
         Backup data
        */
        alias D30 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR31 : Register!(0x8c)
    {
        /*********************************************************************
         Backup data
        */
        alias D31 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR32 : Register!(0x90)
    {
        /*********************************************************************
         Backup data
        */
        alias D32 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR33 : Register!(0x94)
    {
        /*********************************************************************
         Backup data
        */
        alias D33 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR34 : Register!(0x98)
    {
        /*********************************************************************
         Backup data
        */
        alias D34 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR35 : Register!(0x9c)
    {
        /*********************************************************************
         Backup data
        */
        alias D35 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR36 : Register!(0xa0)
    {
        /*********************************************************************
         Backup data
        */
        alias D36 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR37 : Register!(0xa4)
    {
        /*********************************************************************
         Backup data
        */
        alias D37 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR38 : Register!(0xa8)
    {
        /*********************************************************************
         Backup data
        */
        alias D38 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR39 : Register!(0xac)
    {
        /*********************************************************************
         Backup data
        */
        alias D39 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR40 : Register!(0xb0)
    {
        /*********************************************************************
         Backup data
        */
        alias D40 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR41 : Register!(0xb4)
    {
        /*********************************************************************
         Backup data
        */
        alias D41 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Backup data register (BKP_DR)
    */
    final abstract class DR42 : Register!(0xb8)
    {
        /*********************************************************************
         Backup data
        */
        alias D42 = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC clock calibration register (BKP_RTCCR)
    */
    final abstract class RTCCR : Register!(0x28)
    {
        /*********************************************************************
         Calibration value
        */
        alias CAL = BitField!(6, 0, Mutability.rw);

        /*********************************************************************
         Calibration Clock Output
        */
        alias CCO = Bit!(7, Mutability.rw);

        /*********************************************************************
         Alarm or second output enable
        */
        alias ASOE = Bit!(8, Mutability.rw);

        /*********************************************************************
         Alarm or second output selection
        */
        alias ASOS = Bit!(9, Mutability.rw);
    }

    /*************************************************************************
     Backup control register (BKP_CR)
    */
    final abstract class CR : Register!(0x2c)
    {
        /*********************************************************************
         Tamper pin enable
        */
        alias TPE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Tamper pin active level
        */
        alias TPAL = Bit!(1, Mutability.rw);
    }

    /*************************************************************************
     BKP_CSR control/status register (BKP_CSR)
    */
    final abstract class CSR : Register!(0x30)
    {
        /*********************************************************************
         Clear Tamper event
        */
        alias CTE = Bit!(0, Mutability.w);

        /*********************************************************************
         Clear Tamper Interrupt
        */
        alias CTI = Bit!(1, Mutability.w);

        /*********************************************************************
         Tamper Pin interrupt enable
        */
        alias TPIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Tamper Event Flag
        */
        alias TEF = Bit!(8, Mutability.r);

        /*********************************************************************
         Tamper Interrupt Flag
        */
        alias TIF = Bit!(9, Mutability.r);
    }
}
