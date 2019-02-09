module stm32f103xx.ethernet_ptp;

import stm32f103xx.mmio;

/*****************************************************************************
 Ethernet: Precision time protocol
*/
final abstract class ETHERNET_PTP : Peripheral!(0x40028700)
{
    /*************************************************************************
     Ethernet PTP time stamp control register (ETH_PTPTSCR)
    */
    final abstract class PTPTSCR : Register!(00)
    {
        /*********************************************************************
         Time stamp enable
        */
        alias TSE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Time stamp fine or coarse update
        */
        alias TSFCU = Bit!(1, Mutability.rw);

        /*********************************************************************
         Time stamp system time initialize
        */
        alias TSSTI = Bit!(2, Mutability.rw);

        /*********************************************************************
         Time stamp system time update
        */
        alias TSSTU = Bit!(3, Mutability.rw);

        /*********************************************************************
         Time stamp interrupt trigger enable
        */
        alias TSITE = Bit!(4, Mutability.rw);

        /*********************************************************************
         Time stamp addend register update
        */
        alias TSARU = Bit!(5, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP subsecond increment register
    */
    final abstract class PTPSSIR : Register!(0x4)
    {
        /*********************************************************************
         System time subsecond increment
        */
        alias STSSI = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP time stamp high register
    */
    final abstract class PTPTSHR : Register!(0x8)
    {
        /*********************************************************************
         System time second
        */
        alias STS = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP time stamp low register (ETH_PTPTSLR)
    */
    final abstract class PTPTSLR : Register!(0xc)
    {
        /*********************************************************************
         System time subseconds
        */
        alias STSS = BitField!(30, 0, Mutability.rw);

        /*********************************************************************
         System time positive or negative sign
        */
        alias STPNS = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP time stamp high update register
    */
    final abstract class PTPTSHUR : Register!(0x10)
    {
        /*********************************************************************
         Time stamp update second
        */
        alias TSUS = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP time stamp low update register (ETH_PTPTSLUR)
    */
    final abstract class PTPTSLUR : Register!(0x14)
    {
        /*********************************************************************
         Time stamp update subseconds
        */
        alias TSUSS = BitField!(30, 0, Mutability.rw);

        /*********************************************************************
         Time stamp update positive or negative sign
        */
        alias TSUPNS = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP time stamp addend register
    */
    final abstract class PTPTSAR : Register!(0x18)
    {
        /*********************************************************************
         Time stamp addend
        */
        alias TSA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP target time high register
    */
    final abstract class PTPTTHR : Register!(0x1c)
    {
        /*********************************************************************
         Target time stamp high
        */
        alias TTSH = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet PTP target time low register
    */
    final abstract class PTPTTLR : Register!(0x20)
    {
        /*********************************************************************
         Target time stamp low
        */
        alias TTSL = BitField!(31, 0, Mutability.rw);
    }
}
