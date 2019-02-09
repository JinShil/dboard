module stm32f103xx.ethernet_dma;

import stm32f103xx.mmio;

/*****************************************************************************
 Ethernet: DMA controller operation
*/
final abstract class ETHERNET_DMA : Peripheral!(0x40029000)
{
    /*************************************************************************
     Ethernet DMA bus mode register
    */
    final abstract class DMABMR : Register!(00)
    {
        /*********************************************************************
         Software reset
        */
        alias SR = Bit!(0, Mutability.rw);

        /*********************************************************************
         DMA Arbitration
        */
        alias DA = Bit!(1, Mutability.rw);

        /*********************************************************************
         Descriptor skip length
        */
        alias DSL = BitField!(6, 2, Mutability.rw);

        /*********************************************************************
         Programmable burst length
        */
        alias PBL = BitField!(13, 8, Mutability.rw);

        /*********************************************************************
         Rx Tx priority ratio
        */
        alias RTPR = BitField!(15, 14, Mutability.rw);

        /*********************************************************************
         Fixed burst
        */
        alias FB = Bit!(16, Mutability.rw);

        /*********************************************************************
         Rx DMA PBL
        */
        alias RDP = BitField!(22, 17, Mutability.rw);

        /*********************************************************************
         Use separate PBL
        */
        alias USP = Bit!(23, Mutability.rw);

        /*********************************************************************
         4xPBL mode
        */
        alias FPM = Bit!(24, Mutability.rw);

        /*********************************************************************
         Address-aligned beats
        */
        alias AAB = Bit!(25, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA transmit poll demand register
    */
    final abstract class DMATPDR : Register!(0x4)
    {
        /*********************************************************************
         Transmit poll demand
        */
        alias TPD = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     EHERNET DMA receive poll demand register
    */
    final abstract class DMARPDR : Register!(0x8)
    {
        /*********************************************************************
         Receive poll demand
        */
        alias RPD = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA receive descriptor list address register
    */
    final abstract class DMARDLAR : Register!(0xc)
    {
        /*********************************************************************
         Start of receive list
        */
        alias SRL = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA transmit descriptor list address register
    */
    final abstract class DMATDLAR : Register!(0x10)
    {
        /*********************************************************************
         Start of transmit list
        */
        alias STL = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA status register
    */
    final abstract class DMASR : Register!(0x14)
    {
        /*********************************************************************
         Transmit status
        */
        alias TS = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transmit process stopped status
        */
        alias TPSS = Bit!(1, Mutability.rw);

        /*********************************************************************
         Transmit buffer unavailable status
        */
        alias TBUS = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transmit jabber timeout status
        */
        alias TJTS = Bit!(3, Mutability.rw);

        /*********************************************************************
         Receive overflow status
        */
        alias ROS = Bit!(4, Mutability.rw);

        /*********************************************************************
         Transmit underflow status
        */
        alias TUS = Bit!(5, Mutability.rw);

        /*********************************************************************
         Receive status
        */
        alias RS = Bit!(6, Mutability.rw);

        /*********************************************************************
         Receive buffer unavailable status
        */
        alias RBUS = Bit!(7, Mutability.rw);

        /*********************************************************************
         Receive process stopped status
        */
        alias RPSS = Bit!(8, Mutability.rw);

        /*********************************************************************
         Receive watchdog timeout status
        */
        alias PWTS = Bit!(9, Mutability.rw);

        /*********************************************************************
         Early transmit status
        */
        alias ETS = Bit!(10, Mutability.rw);

        /*********************************************************************
         Fatal bus error status
        */
        alias FBES = Bit!(13, Mutability.rw);

        /*********************************************************************
         Early receive status
        */
        alias ERS = Bit!(14, Mutability.rw);

        /*********************************************************************
         Abnormal interrupt summary
        */
        alias AIS = Bit!(15, Mutability.rw);

        /*********************************************************************
         Normal interrupt summary
        */
        alias NIS = Bit!(16, Mutability.rw);

        /*********************************************************************
         Receive process state
        */
        alias RPS = BitField!(19, 17, Mutability.r);

        /*********************************************************************
         Transmit process state
        */
        alias TPS = BitField!(22, 20, Mutability.r);

        /*********************************************************************
         Error bits status
        */
        alias EBS = BitField!(25, 23, Mutability.r);

        /*********************************************************************
         MMC status
        */
        alias MMCS = Bit!(27, Mutability.r);

        /*********************************************************************
         PMT status
        */
        alias PMTS = Bit!(28, Mutability.r);

        /*********************************************************************
         Time stamp trigger status
        */
        alias TSTS = Bit!(29, Mutability.r);
    }

    /*************************************************************************
     Ethernet DMA operation mode register
    */
    final abstract class DMAOMR : Register!(0x18)
    {
        /*********************************************************************
         SR
        */
        alias SR = Bit!(1, Mutability.rw);

        /*********************************************************************
         OSF
        */
        alias OSF = Bit!(2, Mutability.rw);

        /*********************************************************************
         RTC
        */
        alias RTC = BitField!(4, 3, Mutability.rw);

        /*********************************************************************
         FUGF
        */
        alias FUGF = Bit!(6, Mutability.rw);

        /*********************************************************************
         FEF
        */
        alias FEF = Bit!(7, Mutability.rw);

        /*********************************************************************
         ST
        */
        alias ST = Bit!(13, Mutability.rw);

        /*********************************************************************
         TTC
        */
        alias TTC = BitField!(16, 14, Mutability.rw);

        /*********************************************************************
         FTF
        */
        alias FTF = Bit!(20, Mutability.rw);

        /*********************************************************************
         TSF
        */
        alias TSF = Bit!(21, Mutability.rw);

        /*********************************************************************
         DFRF
        */
        alias DFRF = Bit!(24, Mutability.rw);

        /*********************************************************************
         RSF
        */
        alias RSF = Bit!(25, Mutability.rw);

        /*********************************************************************
         DTCEFD
        */
        alias DTCEFD = Bit!(26, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA interrupt enable register
    */
    final abstract class DMAIER : Register!(0x1c)
    {
        /*********************************************************************
         Transmit interrupt enable
        */
        alias TIE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transmit process stopped interrupt enable
        */
        alias TPSIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Transmit buffer unavailable interrupt enable
        */
        alias TBUIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transmit jabber timeout interrupt enable
        */
        alias TJTIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Overflow interrupt enable
        */
        alias ROIE = Bit!(4, Mutability.rw);

        /*********************************************************************
         Underflow interrupt enable
        */
        alias TUIE = Bit!(5, Mutability.rw);

        /*********************************************************************
         Receive interrupt enable
        */
        alias RIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         Receive buffer unavailable interrupt enable
        */
        alias RBUIE = Bit!(7, Mutability.rw);

        /*********************************************************************
         Receive process stopped interrupt enable
        */
        alias RPSIE = Bit!(8, Mutability.rw);

        /*********************************************************************
         receive watchdog timeout interrupt enable
        */
        alias RWTIE = Bit!(9, Mutability.rw);

        /*********************************************************************
         Early transmit interrupt enable
        */
        alias ETIE = Bit!(10, Mutability.rw);

        /*********************************************************************
         Fatal bus error interrupt enable
        */
        alias FBEIE = Bit!(13, Mutability.rw);

        /*********************************************************************
         Early receive interrupt enable
        */
        alias ERIE = Bit!(14, Mutability.rw);

        /*********************************************************************
         Abnormal interrupt summary enable
        */
        alias AISE = Bit!(15, Mutability.rw);

        /*********************************************************************
         Normal interrupt summary enable
        */
        alias NISE = Bit!(16, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA missed frame and buffer overflow counter register
    */
    final abstract class DMAMFBOCR : Register!(0x20)
    {
        /*********************************************************************
         Missed frames by the controller
        */
        alias MFC = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Overflow bit for missed frame counter
        */
        alias OMFC = Bit!(16, Mutability.rw);

        /*********************************************************************
         Missed frames by the application
        */
        alias MFA = BitField!(27, 17, Mutability.rw);

        /*********************************************************************
         Overflow bit for FIFO overflow counter
        */
        alias OFOC = Bit!(28, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA current host transmit descriptor register
    */
    final abstract class DMACHTDR : Register!(0x48)
    {
        /*********************************************************************
         Host transmit descriptor address pointer
        */
        alias HTDAP = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA current host receive descriptor register
    */
    final abstract class DMACHRDR : Register!(0x4c)
    {
        /*********************************************************************
         Host receive descriptor address pointer
        */
        alias HRDAP = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA current host transmit buffer address register
    */
    final abstract class DMACHTBAR : Register!(0x50)
    {
        /*********************************************************************
         Host transmit buffer address pointer
        */
        alias HTBAP = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet DMA current host receive buffer address register
    */
    final abstract class DMACHRBAR : Register!(0x54)
    {
        /*********************************************************************
         Host receive buffer address pointer
        */
        alias HRBAP = BitField!(31, 0, Mutability.rw);
    }
}
