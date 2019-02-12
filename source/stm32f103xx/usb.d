module stm32f103xx.usb;

import stm32f103xx.mmio;

/*****************************************************************************
 Universal serial bus full-speed device interface
*/
final abstract class USB : Peripheral!(0x40005C00)
{
    /*************************************************************************
     endpoint 0 register
    */
    final abstract class EP0R : Register!(00)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rc_w0);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rc_w0);
    }

    /*************************************************************************
     endpoint 1 register
    */
    final abstract class EP1R : Register!(0x4)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 2 register
    */
    final abstract class EP2R : Register!(0x8)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 3 register
    */
    final abstract class EP3R : Register!(0xc)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 4 register
    */
    final abstract class EP4R : Register!(0x10)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 5 register
    */
    final abstract class EP5R : Register!(0x14)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 6 register
    */
    final abstract class EP6R : Register!(0x18)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     endpoint 7 register
    */
    final abstract class EP7R : Register!(0x1c)
    {
        /*********************************************************************
         Endpoint address
        */
        alias EA = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Status bits, for transmission transfers
        */
        alias STAT_TX = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Data Toggle, for transmission transfers
        */
        alias DTOG_TX = Bit!(6, Mutability.rw);

        /*********************************************************************
         Correct Transfer for transmission
        */
        alias CTR_TX = Bit!(7, Mutability.rw);

        /*********************************************************************
         Endpoint kind
        */
        alias EP_KIND = Bit!(8, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EP_TYPE = BitField!(10, 9, Mutability.rw);

        /*********************************************************************
         Setup transaction completed
        */
        alias SETUP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Status bits, for reception transfers
        */
        alias STAT_RX = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Data Toggle, for reception transfers
        */
        alias DTOG_RX = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer for reception
        */
        alias CTR_RX = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     control register
    */
    final abstract class CNTR : Register!(0x40)
    {
        /*********************************************************************
         Force USB Reset
        */
        alias FRES = Bit!(0, Mutability.rw);

        /*********************************************************************
         Power down
        */
        alias PDWN = Bit!(1, Mutability.rw);

        /*********************************************************************
         Low-power mode
        */
        alias LPMODE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Force suspend
        */
        alias FSUSP = Bit!(3, Mutability.rw);

        /*********************************************************************
         Resume request
        */
        alias RESUME = Bit!(4, Mutability.rw);

        /*********************************************************************
         Expected start of frame interrupt mask
        */
        alias ESOFM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Start of frame interrupt mask
        */
        alias SOFM = Bit!(9, Mutability.rw);

        /*********************************************************************
         USB reset interrupt mask
        */
        alias RESETM = Bit!(10, Mutability.rw);

        /*********************************************************************
         Suspend mode interrupt mask
        */
        alias SUSPM = Bit!(11, Mutability.rw);

        /*********************************************************************
         Wakeup interrupt mask
        */
        alias WKUPM = Bit!(12, Mutability.rw);

        /*********************************************************************
         Error interrupt mask
        */
        alias ERRM = Bit!(13, Mutability.rw);

        /*********************************************************************
         Packet memory area over / underrun interrupt mask
        */
        alias PMAOVRM = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer interrupt mask
        */
        alias CTRM = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     interrupt status register
    */
    final abstract class ISTR : Register!(0x44)
    {
        /*********************************************************************
         Endpoint Identifier
        */
        alias EP_ID = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Direction of transaction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Expected start frame
        */
        alias ESOF = Bit!(8, Mutability.rw);

        /*********************************************************************
         start of frame
        */
        alias SOF = Bit!(9, Mutability.rw);

        /*********************************************************************
         reset request
        */
        alias RESET = Bit!(10, Mutability.rw);

        /*********************************************************************
         Suspend mode request
        */
        alias SUSP = Bit!(11, Mutability.rw);

        /*********************************************************************
         Wakeup
        */
        alias WKUP = Bit!(12, Mutability.rw);

        /*********************************************************************
         Error
        */
        alias ERR = Bit!(13, Mutability.rw);

        /*********************************************************************
         Packet memory area over / underrun
        */
        alias PMAOVR = Bit!(14, Mutability.rw);

        /*********************************************************************
         Correct transfer
        */
        alias CTR = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     frame number register
    */
    final abstract class FNR : Register!(0x48)
    {
        /*********************************************************************
         Frame number
        */
        alias FN = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Lost SOF
        */
        alias LSOF = BitField!(12, 11, Mutability.rw);

        /*********************************************************************
         Locked
        */
        alias LCK = Bit!(13, Mutability.rw);

        /*********************************************************************
         Receive data - line status
        */
        alias RXDM = Bit!(14, Mutability.rw);

        /*********************************************************************
         Receive data + line status
        */
        alias RXDP = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     device address
    */
    final abstract class DADDR : Register!(0x4c)
    {
        /*********************************************************************
         Device address
        */
        alias ADD = BitField!(6, 0, Mutability.rw);

        /*********************************************************************
         Enable function
        */
        alias EF = Bit!(7, Mutability.rw);
    }

    /*************************************************************************
     Buffer table address
    */
    final abstract class BTABLE : Register!(0x50)
    {
        /*********************************************************************
         Buffer table
        */
        alias BTABLE = BitField!(15, 3, Mutability.rw);
    }
}
