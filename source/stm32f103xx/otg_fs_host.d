module stm32f103xx.otg_fs_host;

import stm32f103xx.mmio;

/*****************************************************************************
 USB on the go full speed
*/
final abstract class OTG_FS_HOST : Peripheral!(0x50000400)
{
    /*************************************************************************
     OTG_FS host configuration register (OTG_FS_HCFG)
    */
    final abstract class FS_HCFG : Register!(00)
    {
        /*********************************************************************
         FS/LS PHY clock select
        */
        alias FSLSPCS = BitField!(1, 0, Mutability.rw);

        /*********************************************************************
         FS- and LS-only support
        */
        alias FSLSS = Bit!(2, Mutability.r);
    }

    /*************************************************************************
     OTG_FS Host frame interval register
    */
    final abstract class HFIR : Register!(0x4)
    {
        /*********************************************************************
         Frame interval
        */
        alias FRIVL = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host frame number/frame time remaining register (OTG_FS_HFNUM)
    */
    final abstract class FS_HFNUM : Register!(0x8)
    {
        /*********************************************************************
         Frame number
        */
        alias FRNUM = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Frame time remaining
        */
        alias FTREM = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS_Host periodic transmit FIFO/queue status register (OTG_FS_HPTXSTS)
    */
    final abstract class FS_HPTXSTS : Register!(0x10)
    {
        /*********************************************************************
         Periodic transmit data FIFO space available
        */
        alias PTXFSAVL = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Periodic transmit request queue space available
        */
        alias PTXQSAV = BitField!(23, 16, Mutability.r);

        /*********************************************************************
         Top of the periodic transmit request queue
        */
        alias PTXQTOP = BitField!(31, 24, Mutability.r);
    }

    /*************************************************************************
     OTG_FS Host all channels interrupt register
    */
    final abstract class HAINT : Register!(0x14)
    {
        /*********************************************************************
         Channel interrupts
        */
        alias HAINT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host all channels interrupt mask register
    */
    final abstract class HAINTMSK : Register!(0x18)
    {
        /*********************************************************************
         Channel interrupt mask
        */
        alias HAINTM = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host port control and status register (OTG_FS_HPRT)
    */
    final abstract class FS_HPRT : Register!(0x40)
    {
        /*********************************************************************
         Port connect status
        */
        alias PCSTS = Bit!(0, Mutability.r);

        /*********************************************************************
         Port connect detected
        */
        alias PCDET = Bit!(1, Mutability.rw);

        /*********************************************************************
         Port enable
        */
        alias PENA = Bit!(2, Mutability.rw);

        /*********************************************************************
         Port enable/disable change
        */
        alias PENCHNG = Bit!(3, Mutability.rw);

        /*********************************************************************
         Port overcurrent active
        */
        alias POCA = Bit!(4, Mutability.r);

        /*********************************************************************
         Port overcurrent change
        */
        alias POCCHNG = Bit!(5, Mutability.rw);

        /*********************************************************************
         Port resume
        */
        alias PRES = Bit!(6, Mutability.rw);

        /*********************************************************************
         Port suspend
        */
        alias PSUSP = Bit!(7, Mutability.rw);

        /*********************************************************************
         Port reset
        */
        alias PRST = Bit!(8, Mutability.rw);

        /*********************************************************************
         Port line status
        */
        alias PLSTS = BitField!(11, 10, Mutability.r);

        /*********************************************************************
         Port power
        */
        alias PPWR = Bit!(12, Mutability.rw);

        /*********************************************************************
         Port test control
        */
        alias PTCTL = BitField!(16, 13, Mutability.rw);

        /*********************************************************************
         Port speed
        */
        alias PSPD = BitField!(18, 17, Mutability.r);
    }

    /*************************************************************************
     OTG_FS host channel-0 characteristics register (OTG_FS_HCCHAR0)
    */
    final abstract class FS_HCCHAR0 : Register!(0x100)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-1 characteristics register (OTG_FS_HCCHAR1)
    */
    final abstract class FS_HCCHAR1 : Register!(0x120)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-2 characteristics register (OTG_FS_HCCHAR2)
    */
    final abstract class FS_HCCHAR2 : Register!(0x140)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-3 characteristics register (OTG_FS_HCCHAR3)
    */
    final abstract class FS_HCCHAR3 : Register!(0x160)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-4 characteristics register (OTG_FS_HCCHAR4)
    */
    final abstract class FS_HCCHAR4 : Register!(0x180)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-5 characteristics register (OTG_FS_HCCHAR5)
    */
    final abstract class FS_HCCHAR5 : Register!(0x1a0)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-6 characteristics register (OTG_FS_HCCHAR6)
    */
    final abstract class FS_HCCHAR6 : Register!(0x1c0)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-7 characteristics register (OTG_FS_HCCHAR7)
    */
    final abstract class FS_HCCHAR7 : Register!(0x1e0)
    {
        /*********************************************************************
         Maximum packet size
        */
        alias MPSIZ = BitField!(10, 0, Mutability.rw);

        /*********************************************************************
         Endpoint number
        */
        alias EPNUM = BitField!(14, 11, Mutability.rw);

        /*********************************************************************
         Endpoint direction
        */
        alias EPDIR = Bit!(15, Mutability.rw);

        /*********************************************************************
         Low-speed device
        */
        alias LSDEV = Bit!(17, Mutability.rw);

        /*********************************************************************
         Endpoint type
        */
        alias EPTYP = BitField!(19, 18, Mutability.rw);

        /*********************************************************************
         Multicount
        */
        alias MCNT = BitField!(21, 20, Mutability.rw);

        /*********************************************************************
         Device address
        */
        alias DAD = BitField!(28, 22, Mutability.rw);

        /*********************************************************************
         Odd frame
        */
        alias ODDFRM = Bit!(29, Mutability.rw);

        /*********************************************************************
         Channel disable
        */
        alias CHDIS = Bit!(30, Mutability.rw);

        /*********************************************************************
         Channel enable
        */
        alias CHENA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-0 interrupt register (OTG_FS_HCINT0)
    */
    final abstract class FS_HCINT0 : Register!(0x108)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-1 interrupt register (OTG_FS_HCINT1)
    */
    final abstract class FS_HCINT1 : Register!(0x128)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-2 interrupt register (OTG_FS_HCINT2)
    */
    final abstract class FS_HCINT2 : Register!(0x148)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-3 interrupt register (OTG_FS_HCINT3)
    */
    final abstract class FS_HCINT3 : Register!(0x168)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-4 interrupt register (OTG_FS_HCINT4)
    */
    final abstract class FS_HCINT4 : Register!(0x188)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-5 interrupt register (OTG_FS_HCINT5)
    */
    final abstract class FS_HCINT5 : Register!(0x1a8)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-6 interrupt register (OTG_FS_HCINT6)
    */
    final abstract class FS_HCINT6 : Register!(0x1c8)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-7 interrupt register (OTG_FS_HCINT7)
    */
    final abstract class FS_HCINT7 : Register!(0x1e8)
    {
        /*********************************************************************
         Transfer completed
        */
        alias XFRC = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted
        */
        alias CHH = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt
        */
        alias STALL = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt
        */
        alias NAK = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt
        */
        alias ACK = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transaction error
        */
        alias TXERR = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error
        */
        alias BBERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun
        */
        alias FRMOR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error
        */
        alias DTERR = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-0 mask register (OTG_FS_HCINTMSK0)
    */
    final abstract class FS_HCINTMSK0 : Register!(0x10c)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-1 mask register (OTG_FS_HCINTMSK1)
    */
    final abstract class FS_HCINTMSK1 : Register!(0x12c)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-2 mask register (OTG_FS_HCINTMSK2)
    */
    final abstract class FS_HCINTMSK2 : Register!(0x14c)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-3 mask register (OTG_FS_HCINTMSK3)
    */
    final abstract class FS_HCINTMSK3 : Register!(0x16c)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-4 mask register (OTG_FS_HCINTMSK4)
    */
    final abstract class FS_HCINTMSK4 : Register!(0x18c)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-5 mask register (OTG_FS_HCINTMSK5)
    */
    final abstract class FS_HCINTMSK5 : Register!(0x1ac)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-6 mask register (OTG_FS_HCINTMSK6)
    */
    final abstract class FS_HCINTMSK6 : Register!(0x1cc)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-7 mask register (OTG_FS_HCINTMSK7)
    */
    final abstract class FS_HCINTMSK7 : Register!(0x1ec)
    {
        /*********************************************************************
         Transfer completed mask
        */
        alias XFRCM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel halted mask
        */
        alias CHHM = Bit!(1, Mutability.rw);

        /*********************************************************************
         STALL response received interrupt mask
        */
        alias STALLM = Bit!(3, Mutability.rw);

        /*********************************************************************
         NAK response received interrupt mask
        */
        alias NAKM = Bit!(4, Mutability.rw);

        /*********************************************************************
         ACK response received/transmitted interrupt mask
        */
        alias ACKM = Bit!(5, Mutability.rw);

        /*********************************************************************
         response received interrupt mask
        */
        alias NYET = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transaction error mask
        */
        alias TXERRM = Bit!(7, Mutability.rw);

        /*********************************************************************
         Babble error mask
        */
        alias BBERRM = Bit!(8, Mutability.rw);

        /*********************************************************************
         Frame overrun mask
        */
        alias FRMORM = Bit!(9, Mutability.rw);

        /*********************************************************************
         Data toggle error mask
        */
        alias DTERRM = Bit!(10, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-0 transfer size register
    */
    final abstract class FS_HCTSIZ0 : Register!(0x110)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-1 transfer size register
    */
    final abstract class FS_HCTSIZ1 : Register!(0x130)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-2 transfer size register
    */
    final abstract class FS_HCTSIZ2 : Register!(0x150)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-3 transfer size register
    */
    final abstract class FS_HCTSIZ3 : Register!(0x170)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-x transfer size register
    */
    final abstract class FS_HCTSIZ4 : Register!(0x190)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-5 transfer size register
    */
    final abstract class FS_HCTSIZ5 : Register!(0x1b0)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-6 transfer size register
    */
    final abstract class FS_HCTSIZ6 : Register!(0x1d0)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }

    /*************************************************************************
     OTG_FS host channel-7 transfer size register
    */
    final abstract class FS_HCTSIZ7 : Register!(0x1f0)
    {
        /*********************************************************************
         Transfer size
        */
        alias XFRSIZ = BitField!(18, 0, Mutability.rw);

        /*********************************************************************
         Packet count
        */
        alias PKTCNT = BitField!(28, 19, Mutability.rw);

        /*********************************************************************
         Data PID
        */
        alias DPID = BitField!(30, 29, Mutability.rw);
    }
}
