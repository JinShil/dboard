module stm32f103xx.ethernet_mmc;

import stm32f103xx.mmio;

/*****************************************************************************
 Ethernet: MAC management counters
*/
final abstract class ETHERNET_MMC : Peripheral!(0x40028100)
{
    /*************************************************************************
     Ethernet MMC control register (ETH_MMCCR)
    */
    final abstract class MMCCR : Register!(00)
    {
        /*********************************************************************
         Counter reset
        */
        alias CR = Bit!(0, Mutability.rw);

        /*********************************************************************
         Counter stop rollover
        */
        alias CSR = Bit!(1, Mutability.rw);

        /*********************************************************************
         Reset on read
        */
        alias ROR = Bit!(2, Mutability.rw);

        /*********************************************************************
         MMC counter freeze
        */
        alias MCF = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC receive interrupt register (ETH_MMCRIR)
    */
    final abstract class MMCRIR : Register!(0x4)
    {
        /*********************************************************************
         Received frames CRC error status
        */
        alias RFCES = Bit!(5, Mutability.rw);

        /*********************************************************************
         Received frames alignment error status
        */
        alias RFAES = Bit!(6, Mutability.rw);

        /*********************************************************************
         Received Good Unicast Frames Status
        */
        alias RGUFS = Bit!(17, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC transmit interrupt register (ETH_MMCTIR)
    */
    final abstract class MMCTIR : Register!(0x8)
    {
        /*********************************************************************
         Transmitted good frames single collision status
        */
        alias TGFSCS = Bit!(14, Mutability.rw);

        /*********************************************************************
         Transmitted good frames more single collision status
        */
        alias TGFMSCS = Bit!(15, Mutability.rw);

        /*********************************************************************
         Transmitted good frames status
        */
        alias TGFS = Bit!(21, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC receive interrupt mask register (ETH_MMCRIMR)
    */
    final abstract class MMCRIMR : Register!(0xc)
    {
        /*********************************************************************
         Received frame CRC error mask
        */
        alias RFCEM = Bit!(5, Mutability.rw);

        /*********************************************************************
         Received frames alignment error mask
        */
        alias RFAEM = Bit!(6, Mutability.rw);

        /*********************************************************************
         Received good unicast frames mask
        */
        alias RGUFM = Bit!(17, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC transmit interrupt mask register (ETH_MMCTIMR)
    */
    final abstract class MMCTIMR : Register!(0x10)
    {
        /*********************************************************************
         Transmitted good frames single collision mask
        */
        alias TGFSCM = Bit!(14, Mutability.rw);

        /*********************************************************************
         Transmitted good frames more single collision mask
        */
        alias TGFMSCM = Bit!(15, Mutability.rw);

        /*********************************************************************
         Transmitted good frames mask
        */
        alias TGFM = Bit!(21, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC transmitted good frames after a single collision counter
    */
    final abstract class MMCTGFSCCR : Register!(0x4c)
    {
        /*********************************************************************
         Transmitted good frames after a single collision counter
        */
        alias TGFSCC = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC transmitted good frames after more than a single collision
    */
    final abstract class MMCTGFMSCCR : Register!(0x50)
    {
        /*********************************************************************
         Transmitted good frames after more than a single collision counter
        */
        alias TGFMSCC = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC transmitted good frames counter register
    */
    final abstract class MMCTGFCR : Register!(0x68)
    {
        /*********************************************************************
         Transmitted good frames counter
        */
        alias TGFC = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC received frames with CRC error counter register
    */
    final abstract class MMCRFCECR : Register!(0x94)
    {
        /*********************************************************************
         Received frames with CRC error counter
        */
        alias RFCFC = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MMC received frames with alignment error counter register
    */
    final abstract class MMCRFAECR : Register!(0x98)
    {
        /*********************************************************************
         Received frames with alignment error counter
        */
        alias RFAEC = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     MMC received good unicast frames counter register
    */
    final abstract class MMCRGUFCR : Register!(0xc4)
    {
        /*********************************************************************
         Received good unicast frames counter
        */
        alias RGUFC = BitField!(31, 0, Mutability.rw);
    }
}
