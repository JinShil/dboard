module stm32f103xx.otg_fs_global;

import stm32f103xx.mmio;

/*****************************************************************************
 USB on the go full speed
*/
final abstract class OTG_FS_GLOBAL : Peripheral!(0x50000000)
{
    /*************************************************************************
     OTG_FS control and status register (OTG_FS_GOTGCTL)
    */
    final abstract class FS_GOTGCTL : Register!(00)
    {
        /*********************************************************************
         Session request success
        */
        alias SRQSCS = Bit!(0, Mutability.r);

        /*********************************************************************
         Session request
        */
        alias SRQ = Bit!(1, Mutability.rw);

        /*********************************************************************
         Host negotiation success
        */
        alias HNGSCS = Bit!(8, Mutability.r);

        /*********************************************************************
         HNP request
        */
        alias HNPRQ = Bit!(9, Mutability.rw);

        /*********************************************************************
         Host set HNP enable
        */
        alias HSHNPEN = Bit!(10, Mutability.rw);

        /*********************************************************************
         Device HNP enabled
        */
        alias DHNPEN = Bit!(11, Mutability.rw);

        /*********************************************************************
         Connector ID status
        */
        alias CIDSTS = Bit!(16, Mutability.r);

        /*********************************************************************
         Long/short debounce time
        */
        alias DBCT = Bit!(17, Mutability.r);

        /*********************************************************************
         A-session valid
        */
        alias ASVLD = Bit!(18, Mutability.r);

        /*********************************************************************
         B-session valid
        */
        alias BSVLD = Bit!(19, Mutability.r);
    }

    /*************************************************************************
     OTG_FS interrupt register (OTG_FS_GOTGINT)
    */
    final abstract class FS_GOTGINT : Register!(0x4)
    {
        /*********************************************************************
         Session end detected
        */
        alias SEDET = Bit!(2, Mutability.rw);

        /*********************************************************************
         Session request success status change
        */
        alias SRSSCHG = Bit!(8, Mutability.rw);

        /*********************************************************************
         Host negotiation success status change
        */
        alias HNSSCHG = Bit!(9, Mutability.rw);

        /*********************************************************************
         Host negotiation detected
        */
        alias HNGDET = Bit!(17, Mutability.rw);

        /*********************************************************************
         A-device timeout change
        */
        alias ADTOCHG = Bit!(18, Mutability.rw);

        /*********************************************************************
         Debounce done
        */
        alias DBCDNE = Bit!(19, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS AHB configuration register (OTG_FS_GAHBCFG)
    */
    final abstract class FS_GAHBCFG : Register!(0x8)
    {
        /*********************************************************************
         Global interrupt mask
        */
        alias GINT = Bit!(0, Mutability.rw);

        /*********************************************************************
         TxFIFO empty level
        */
        alias TXFELVL = Bit!(7, Mutability.rw);

        /*********************************************************************
         Periodic TxFIFO empty level
        */
        alias PTXFELVL = Bit!(8, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS USB configuration register (OTG_FS_GUSBCFG)
    */
    final abstract class FS_GUSBCFG : Register!(0xc)
    {
        /*********************************************************************
         FS timeout calibration
        */
        alias TOCAL = BitField!(2, 0, Mutability.rw);

        /*********************************************************************
         Full Speed serial transceiver select
        */
        alias PHYSEL = Bit!(6, Mutability.w);

        /*********************************************************************
         SRP-capable
        */
        alias SRPCAP = Bit!(8, Mutability.rw);

        /*********************************************************************
         HNP-capable
        */
        alias HNPCAP = Bit!(9, Mutability.rw);

        /*********************************************************************
         USB turnaround time
        */
        alias TRDT = BitField!(13, 10, Mutability.rw);

        /*********************************************************************
         Force host mode
        */
        alias FHMOD = Bit!(29, Mutability.rw);

        /*********************************************************************
         Force device mode
        */
        alias FDMOD = Bit!(30, Mutability.rw);

        /*********************************************************************
         Corrupt Tx packet
        */
        alias CTXPKT = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS reset register (OTG_FS_GRSTCTL)
    */
    final abstract class FS_GRSTCTL : Register!(0x10)
    {
        /*********************************************************************
         Core soft reset
        */
        alias CSRST = Bit!(0, Mutability.rw);

        /*********************************************************************
         HCLK soft reset
        */
        alias HSRST = Bit!(1, Mutability.rw);

        /*********************************************************************
         Host frame counter reset
        */
        alias FCRST = Bit!(2, Mutability.rw);

        /*********************************************************************
         RxFIFO flush
        */
        alias RXFFLSH = Bit!(4, Mutability.rw);

        /*********************************************************************
         TxFIFO flush
        */
        alias TXFFLSH = Bit!(5, Mutability.rw);

        /*********************************************************************
         TxFIFO number
        */
        alias TXFNUM = BitField!(10, 6, Mutability.rw);

        /*********************************************************************
         AHB master idle
        */
        alias AHBIDL = Bit!(31, Mutability.r);
    }

    /*************************************************************************
     OTG_FS core interrupt register (OTG_FS_GINTSTS)
    */
    final abstract class FS_GINTSTS : Register!(0x14)
    {
        /*********************************************************************
         Current mode of operation
        */
        alias CMOD = Bit!(0, Mutability.r);

        /*********************************************************************
         Mode mismatch interrupt
        */
        alias MMIS = Bit!(1, Mutability.rw);

        /*********************************************************************
         OTG interrupt
        */
        alias OTGINT = Bit!(2, Mutability.r);

        /*********************************************************************
         Start of frame
        */
        alias SOF = Bit!(3, Mutability.rw);

        /*********************************************************************
         RxFIFO non-empty
        */
        alias RXFLVL = Bit!(4, Mutability.r);

        /*********************************************************************
         Non-periodic TxFIFO empty
        */
        alias NPTXFE = Bit!(5, Mutability.r);

        /*********************************************************************
         Global IN non-periodic NAK effective
        */
        alias GINAKEFF = Bit!(6, Mutability.r);

        /*********************************************************************
         Global OUT NAK effective
        */
        alias GOUTNAKEFF = Bit!(7, Mutability.r);

        /*********************************************************************
         Early suspend
        */
        alias ESUSP = Bit!(10, Mutability.rw);

        /*********************************************************************
         USB suspend
        */
        alias USBSUSP = Bit!(11, Mutability.rw);

        /*********************************************************************
         USB reset
        */
        alias USBRST = Bit!(12, Mutability.rw);

        /*********************************************************************
         Enumeration done
        */
        alias ENUMDNE = Bit!(13, Mutability.rw);

        /*********************************************************************
         Isochronous OUT packet dropped interrupt
        */
        alias ISOODRP = Bit!(14, Mutability.rw);

        /*********************************************************************
         End of periodic frame interrupt
        */
        alias EOPF = Bit!(15, Mutability.rw);

        /*********************************************************************
         IN endpoint interrupt
        */
        alias IEPINT = Bit!(18, Mutability.r);

        /*********************************************************************
         OUT endpoint interrupt
        */
        alias OEPINT = Bit!(19, Mutability.r);

        /*********************************************************************
         Incomplete isochronous IN transfer
        */
        alias IISOIXFR = Bit!(20, Mutability.rw);

        /*********************************************************************
         Incomplete periodic transfer(Host mode)/Incomplete isochronous OUT transfer(Device mode)
        */
        alias IPXFR_INCOMPISOOUT = Bit!(21, Mutability.rw);

        /*********************************************************************
         Host port interrupt
        */
        alias HPRTINT = Bit!(24, Mutability.r);

        /*********************************************************************
         Host channels interrupt
        */
        alias HCINT = Bit!(25, Mutability.r);

        /*********************************************************************
         Periodic TxFIFO empty
        */
        alias PTXFE = Bit!(26, Mutability.r);

        /*********************************************************************
         Connector ID status change
        */
        alias CIDSCHG = Bit!(28, Mutability.rw);

        /*********************************************************************
         Disconnect detected interrupt
        */
        alias DISCINT = Bit!(29, Mutability.rw);

        /*********************************************************************
         Session request/new session detected interrupt
        */
        alias SRQINT = Bit!(30, Mutability.rw);

        /*********************************************************************
         Resume/remote wakeup detected interrupt
        */
        alias WKUPINT = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS interrupt mask register (OTG_FS_GINTMSK)
    */
    final abstract class FS_GINTMSK : Register!(0x18)
    {
        /*********************************************************************
         Mode mismatch interrupt mask
        */
        alias MMISM = Bit!(1, Mutability.rw);

        /*********************************************************************
         OTG interrupt mask
        */
        alias OTGINT = Bit!(2, Mutability.rw);

        /*********************************************************************
         Start of frame mask
        */
        alias SOFM = Bit!(3, Mutability.rw);

        /*********************************************************************
         Receive FIFO non-empty mask
        */
        alias RXFLVLM = Bit!(4, Mutability.rw);

        /*********************************************************************
         Non-periodic TxFIFO empty mask
        */
        alias NPTXFEM = Bit!(5, Mutability.rw);

        /*********************************************************************
         Global non-periodic IN NAK effective mask
        */
        alias GINAKEFFM = Bit!(6, Mutability.rw);

        /*********************************************************************
         Global OUT NAK effective mask
        */
        alias GONAKEFFM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Early suspend mask
        */
        alias ESUSPM = Bit!(10, Mutability.rw);

        /*********************************************************************
         USB suspend mask
        */
        alias USBSUSPM = Bit!(11, Mutability.rw);

        /*********************************************************************
         USB reset mask
        */
        alias USBRST = Bit!(12, Mutability.rw);

        /*********************************************************************
         Enumeration done mask
        */
        alias ENUMDNEM = Bit!(13, Mutability.rw);

        /*********************************************************************
         Isochronous OUT packet dropped interrupt mask
        */
        alias ISOODRPM = Bit!(14, Mutability.rw);

        /*********************************************************************
         End of periodic frame interrupt mask
        */
        alias EOPFM = Bit!(15, Mutability.rw);

        /*********************************************************************
         Endpoint mismatch interrupt mask
        */
        alias EPMISM = Bit!(17, Mutability.rw);

        /*********************************************************************
         IN endpoints interrupt mask
        */
        alias IEPINT = Bit!(18, Mutability.rw);

        /*********************************************************************
         OUT endpoints interrupt mask
        */
        alias OEPINT = Bit!(19, Mutability.rw);

        /*********************************************************************
         Incomplete isochronous IN transfer mask
        */
        alias IISOIXFRM = Bit!(20, Mutability.rw);

        /*********************************************************************
         Incomplete periodic transfer mask(Host mode)/Incomplete isochronous OUT transfer mask(Device mode)
        */
        alias IPXFRM_IISOOXFRM = Bit!(21, Mutability.rw);

        /*********************************************************************
         Host port interrupt mask
        */
        alias PRTIM = Bit!(24, Mutability.r);

        /*********************************************************************
         Host channels interrupt mask
        */
        alias HCIM = Bit!(25, Mutability.rw);

        /*********************************************************************
         Periodic TxFIFO empty mask
        */
        alias PTXFEM = Bit!(26, Mutability.rw);

        /*********************************************************************
         Connector ID status change mask
        */
        alias CIDSCHGM = Bit!(28, Mutability.rw);

        /*********************************************************************
         Disconnect detected interrupt mask
        */
        alias DISCINT = Bit!(29, Mutability.rw);

        /*********************************************************************
         Session request/new session detected interrupt mask
        */
        alias SRQIM = Bit!(30, Mutability.rw);

        /*********************************************************************
         Resume/remote wakeup detected interrupt mask
        */
        alias WUIM = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS Receive status debug read(Device mode)
    */
    final abstract class FS_GRXSTSR_Device : Register!(0x1c)
    {
        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Byte count
        */
        alias BCNT = BitField!(14, 4, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(16, 15, Mutability.rw);

        /*********************************************************************
         Packet status
        */
        alias PKTSTS = BitField!(20, 17, Mutability.rw);

        /*********************************************************************
         Frame number
        */
        alias FRMNUM = BitField!(24, 21, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS Receive status debug read(Host mode)
    */
    final abstract class FS_GRXSTSR_Host : Register!(0x1c)
    {
        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Byte count
        */
        alias BCNT = BitField!(14, 4, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(16, 15, Mutability.rw);

        /*********************************************************************
         Packet status
        */
        alias PKTSTS = BitField!(20, 17, Mutability.rw);

        /*********************************************************************
         Frame number
        */
        alias FRMNUM = BitField!(24, 21, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS Receive FIFO size register (OTG_FS_GRXFSIZ)
    */
    final abstract class FS_GRXFSIZ : Register!(0x24)
    {
        /*********************************************************************
         RxFIFO depth
        */
        alias RXFD = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS non-periodic transmit FIFO size register (Device mode)
    */
    final abstract class FS_GNPTXFSIZ_Device : Register!(0x28)
    {
        /*********************************************************************
         Endpoint 0 transmit RAM start address
        */
        alias TX0FSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Endpoint 0 TxFIFO depth
        */
        alias TX0FD = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS non-periodic transmit FIFO size register (Host mode)
    */
    final abstract class FS_GNPTXFSIZ_Host : Register!(0x28)
    {
        /*********************************************************************
         Non-periodic transmit RAM start address
        */
        alias NPTXFSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Non-periodic TxFIFO depth
        */
        alias NPTXFD = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS non-periodic transmit FIFO/queue status register (OTG_FS_GNPTXSTS)
    */
    final abstract class FS_GNPTXSTS : Register!(0x2c)
    {
        /*********************************************************************
         Non-periodic TxFIFO space available
        */
        alias NPTXFSAV = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Non-periodic transmit request queue space available
        */
        alias NPTQXSAV = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Top of the non-periodic transmit request queue
        */
        alias NPTXQTOP = BitField!(30, 24, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS general core configuration register (OTG_FS_GCCFG)
    */
    final abstract class FS_GCCFG : Register!(0x38)
    {
        /*********************************************************************
         Power down
        */
        alias PWRDWN = Bit!(16, Mutability.rw);

        /*********************************************************************
         Enable the VBUS sensing device
        */
        alias VBUSASEN = Bit!(18, Mutability.rw);

        /*********************************************************************
         Enable the VBUS sensing device
        */
        alias VBUSBSEN = Bit!(19, Mutability.rw);

        /*********************************************************************
         SOF output enable
        */
        alias SOFOUTEN = Bit!(20, Mutability.rw);
    }

    /*************************************************************************
     core ID register
    */
    final abstract class FS_CID : Register!(0x3c)
    {
        /*********************************************************************
         Product ID field
        */
        alias PRODUCT_ID = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS Host periodic transmit FIFO size register (OTG_FS_HPTXFSIZ)
    */
    final abstract class FS_HPTXFSIZ : Register!(0x100)
    {
        /*********************************************************************
         Host periodic TxFIFO start address
        */
        alias PTXSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Host periodic TxFIFO depth
        */
        alias PTXFSIZ = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF2)
    */
    final abstract class FS_DIEPTXF1 : Register!(0x104)
    {
        /*********************************************************************
         IN endpoint FIFO2 transmit RAM start address
        */
        alias INEPTXSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         IN endpoint TxFIFO depth
        */
        alias INEPTXFD = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF3)
    */
    final abstract class FS_DIEPTXF2 : Register!(0x108)
    {
        /*********************************************************************
         IN endpoint FIFO3 transmit RAM start address
        */
        alias INEPTXSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         IN endpoint TxFIFO depth
        */
        alias INEPTXFD = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF4)
    */
    final abstract class FS_DIEPTXF3 : Register!(0x10c)
    {
        /*********************************************************************
         IN endpoint FIFO4 transmit RAM start address
        */
        alias INEPTXSA = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         IN endpoint TxFIFO depth
        */
        alias INEPTXFD = BitField!(31, 16, Mutability.rw);
    }
}
