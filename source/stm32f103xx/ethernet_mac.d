module stm32f103xx.ethernet_mac;

import stm32f103xx.mmio;

/*****************************************************************************
 Ethernet: media access control
*/
final abstract class ETHERNET_MAC : Peripheral!(0x40028000)
{
    /*************************************************************************
     Ethernet MAC configuration register (ETH_MACCR)
    */
    final abstract class MACCR : Register!(00)
    {
        /*********************************************************************
         Receiver enable
        */
        alias RE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transmitter enable
        */
        alias TE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Deferral check
        */
        alias DC = Bit!(4, Mutability.rw);

        /*********************************************************************
         Back-off limit
        */
        alias BL = BitField!(6, 5, Mutability.rw);

        /*********************************************************************
         Automatic pad/CRC stripping
        */
        alias APCS = Bit!(7, Mutability.rw);

        /*********************************************************************
         Retry disable
        */
        alias RD = Bit!(9, Mutability.rw);

        /*********************************************************************
         IPv4 checksum offload
        */
        alias IPCO = Bit!(10, Mutability.rw);

        /*********************************************************************
         Duplex mode
        */
        alias DM = Bit!(11, Mutability.rw);

        /*********************************************************************
         Loopback mode
        */
        alias LM = Bit!(12, Mutability.rw);

        /*********************************************************************
         Receive own disable
        */
        alias ROD = Bit!(13, Mutability.rw);

        /*********************************************************************
         Fast Ethernet speed
        */
        alias FES = Bit!(14, Mutability.rw);

        /*********************************************************************
         Carrier sense disable
        */
        alias CSD = Bit!(16, Mutability.rw);

        /*********************************************************************
         Interframe gap
        */
        alias IFG = BitField!(19, 17, Mutability.rw);

        /*********************************************************************
         Jabber disable
        */
        alias JD = Bit!(22, Mutability.rw);

        /*********************************************************************
         Watchdog disable
        */
        alias WD = Bit!(23, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC frame filter register (ETH_MACCFFR)
    */
    final abstract class MACFFR : Register!(0x4)
    {
        /*********************************************************************
         Promiscuous mode
        */
        alias PM = Bit!(0, Mutability.rw);

        /*********************************************************************
         Hash unicast
        */
        alias HU = Bit!(1, Mutability.rw);

        /*********************************************************************
         Hash multicast
        */
        alias HM = Bit!(2, Mutability.rw);

        /*********************************************************************
         Destination address inverse filtering
        */
        alias DAIF = Bit!(3, Mutability.rw);

        /*********************************************************************
         Pass all multicast
        */
        alias PAM = Bit!(4, Mutability.rw);

        /*********************************************************************
         Broadcast frames disable
        */
        alias BFD = Bit!(5, Mutability.rw);

        /*********************************************************************
         Pass control frames
        */
        alias PCF = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         Source address inverse filtering
        */
        alias SAIF = Bit!(8, Mutability.rw);

        /*********************************************************************
         Source address filter
        */
        alias SAF = Bit!(9, Mutability.rw);

        /*********************************************************************
         Hash or perfect filter
        */
        alias HPF = Bit!(10, Mutability.rw);

        /*********************************************************************
         Receive all
        */
        alias RA = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC hash table high register
    */
    final abstract class MACHTHR : Register!(0x8)
    {
        /*********************************************************************
         Hash table high
        */
        alias HTH = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC hash table low register
    */
    final abstract class MACHTLR : Register!(0xc)
    {
        /*********************************************************************
         Hash table low
        */
        alias HTL = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC MII address register (ETH_MACMIIAR)
    */
    final abstract class MACMIIAR : Register!(0x10)
    {
        /*********************************************************************
         MII busy
        */
        alias MB = Bit!(0, Mutability.rw);

        /*********************************************************************
         MII write
        */
        alias MW = Bit!(1, Mutability.rw);

        /*********************************************************************
         Clock range
        */
        alias CR = BitField!(4, 2, Mutability.rw);

        /*********************************************************************
         MII register
        */
        alias MR = BitField!(10, 6, Mutability.rw);

        /*********************************************************************
         PHY address
        */
        alias PA = BitField!(15, 11, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC MII data register (ETH_MACMIIDR)
    */
    final abstract class MACMIIDR : Register!(0x14)
    {
        /*********************************************************************
         MII data
        */
        alias MD = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC flow control register (ETH_MACFCR)
    */
    final abstract class MACFCR : Register!(0x18)
    {
        /*********************************************************************
         Flow control busy/back pressure activate
        */
        alias FCB_BPA = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transmit flow control enable
        */
        alias TFCE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Receive flow control enable
        */
        alias RFCE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Unicast pause frame detect
        */
        alias UPFD = Bit!(3, Mutability.rw);

        /*********************************************************************
         Pause low threshold
        */
        alias PLT = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         Zero-quanta pause disable
        */
        alias ZQPD = Bit!(7, Mutability.rw);

        /*********************************************************************
         Pass control frames
        */
        alias PT = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC VLAN tag register (ETH_MACVLANTR)
    */
    final abstract class MACVLANTR : Register!(0x1c)
    {
        /*********************************************************************
         VLAN tag identifier (for receive frames)
        */
        alias VLANTI = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         12-bit VLAN tag comparison
        */
        alias VLANTC = Bit!(16, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC remote wakeup frame filter register (ETH_MACRWUFFR)
    */
    final abstract class MACRWUFFR : Register!(0x28)
    {
    }

    /*************************************************************************
     Ethernet MAC PMT control and status register (ETH_MACPMTCSR)
    */
    final abstract class MACPMTCSR : Register!(0x2c)
    {
        /*********************************************************************
         Power down
        */
        alias PD = Bit!(0, Mutability.rw);

        /*********************************************************************
         Magic Packet enable
        */
        alias MPE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Wakeup frame enable
        */
        alias WFE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Magic packet received
        */
        alias MPR = Bit!(5, Mutability.rw);

        /*********************************************************************
         Wakeup frame received
        */
        alias WFR = Bit!(6, Mutability.rw);

        /*********************************************************************
         Global unicast
        */
        alias GU = Bit!(9, Mutability.rw);

        /*********************************************************************
         Wakeup frame filter register pointer reset
        */
        alias WFFRPR = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC interrupt status register (ETH_MACSR)
    */
    final abstract class MACSR : Register!(0x38)
    {
        /*********************************************************************
         PMT status
        */
        alias PMTS = Bit!(3, Mutability.rw);

        /*********************************************************************
         MMC status
        */
        alias MMCS = Bit!(4, Mutability.rw);

        /*********************************************************************
         MMC receive status
        */
        alias MMCRS = Bit!(5, Mutability.rw);

        /*********************************************************************
         MMC transmit status
        */
        alias MMCTS = Bit!(6, Mutability.rw);

        /*********************************************************************
         Time stamp trigger status
        */
        alias TSTS = Bit!(9, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC interrupt mask register (ETH_MACIMR)
    */
    final abstract class MACIMR : Register!(0x3c)
    {
        /*********************************************************************
         PMT interrupt mask
        */
        alias PMTIM = Bit!(3, Mutability.rw);

        /*********************************************************************
         Time stamp trigger interrupt mask
        */
        alias TSTIM = Bit!(9, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 0 high register (ETH_MACA0HR)
    */
    final abstract class MACA0HR : Register!(0x40)
    {
        /*********************************************************************
         MAC address0 high
        */
        alias MACA0H = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Always 1
        */
        alias MO = Bit!(31, Mutability.r);
    }

    /*************************************************************************
     Ethernet MAC address 0 low register
    */
    final abstract class MACA0LR : Register!(0x44)
    {
        /*********************************************************************
         MAC address0 low
        */
        alias MACA0L = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 1 high register (ETH_MACA1HR)
    */
    final abstract class MACA1HR : Register!(0x48)
    {
        /*********************************************************************
         MAC address1 high
        */
        alias MACA1H = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Mask byte control
        */
        alias MBC = BitField!(29, 24, Mutability.rw);

        /*********************************************************************
         Source address
        */
        alias SA = Bit!(30, Mutability.rw);

        /*********************************************************************
         Address enable
        */
        alias AE = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address1 low register
    */
    final abstract class MACA1LR : Register!(0x4c)
    {
        /*********************************************************************
         MAC address1 low
        */
        alias MACA1L = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 2 high register (ETH_MACA2HR)
    */
    final abstract class MACA2HR : Register!(0x50)
    {
        /*********************************************************************
         Ethernet MAC address 2 high register
        */
        alias ETH_MACA2HR = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Mask byte control
        */
        alias MBC = BitField!(29, 24, Mutability.rw);

        /*********************************************************************
         Source address
        */
        alias SA = Bit!(30, Mutability.rw);

        /*********************************************************************
         Address enable
        */
        alias AE = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 2 low register
    */
    final abstract class MACA2LR : Register!(0x54)
    {
        /*********************************************************************
         MAC address2 low
        */
        alias MACA2L = BitField!(30, 0, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 3 high register (ETH_MACA3HR)
    */
    final abstract class MACA3HR : Register!(0x58)
    {
        /*********************************************************************
         MAC address3 high
        */
        alias MACA3H = BitField!(15, 0, Mutability.rw);

        /*********************************************************************
         Mask byte control
        */
        alias MBC = BitField!(29, 24, Mutability.rw);

        /*********************************************************************
         Source address
        */
        alias SA = Bit!(30, Mutability.rw);

        /*********************************************************************
         Address enable
        */
        alias AE = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Ethernet MAC address 3 low register
    */
    final abstract class MACA3LR : Register!(0x5c)
    {
        /*********************************************************************
         MAC address3 low
        */
        alias MBCA3L = BitField!(31, 0, Mutability.rw);
    }
}
