module stm32f103xx.sdio;

import stm32f103xx.mmio;

/*****************************************************************************
 Secure digital input/output interface
*/
final abstract class SDIO : Peripheral!(0x40018000)
{
    /*************************************************************************
     Bits 1:0 = PWRCTRL: Power supply control bits
    */
    final abstract class POWER : Register!(00)
    {
        /*********************************************************************
         PWRCTRL
        */
        alias PWRCTRL = BitField!(1, 0, Mutability.rw);
    }

    /*************************************************************************
     SDI clock control register (SDIO_CLKCR)
    */
    final abstract class CLKCR : Register!(0x4)
    {
        /*********************************************************************
         Clock divide factor
        */
        alias CLKDIV = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         Clock enable bit
        */
        alias CLKEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         Power saving configuration bit
        */
        alias PWRSAV = Bit!(9, Mutability.rw);

        /*********************************************************************
         Clock divider bypass enable bit
        */
        alias BYPASS = Bit!(10, Mutability.rw);

        /*********************************************************************
         Wide bus mode enable bit
        */
        alias WIDBUS = BitField!(12, 11, Mutability.rw);

        /*********************************************************************
         SDIO_CK dephasing selection bit
        */
        alias NEGEDGE = Bit!(13, Mutability.rw);

        /*********************************************************************
         HW Flow Control enable
        */
        alias HWFC_EN = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = : Command argument
    */
    final abstract class ARG : Register!(0x8)
    {
        /*********************************************************************
         Command argument
        */
        alias CMDARG = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     SDIO command register (SDIO_CMD)
    */
    final abstract class CMD : Register!(0xc)
    {
        /*********************************************************************
         CMDINDEX
        */
        alias CMDINDEX = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         WAITRESP
        */
        alias WAITRESP = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         WAITINT
        */
        alias WAITINT = Bit!(8, Mutability.rw);

        /*********************************************************************
         WAITPEND
        */
        alias WAITPEND = Bit!(9, Mutability.rw);

        /*********************************************************************
         CPSMEN
        */
        alias CPSMEN = Bit!(10, Mutability.rw);

        /*********************************************************************
         SDIOSuspend
        */
        alias SDIOSuspend = Bit!(11, Mutability.rw);

        /*********************************************************************
         ENCMDcompl
        */
        alias ENCMDcompl = Bit!(12, Mutability.rw);

        /*********************************************************************
         nIEN
        */
        alias nIEN = Bit!(13, Mutability.rw);

        /*********************************************************************
         CE_ATACMD
        */
        alias CE_ATACMD = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     SDIO command register
    */
    final abstract class RESPCMD : Register!(0x10)
    {
        /*********************************************************************
         RESPCMD
        */
        alias RESPCMD = BitField!(5, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = CARDSTATUS1
    */
    final abstract class RESPI1 : Register!(0x14)
    {
        /*********************************************************************
         CARDSTATUS1
        */
        alias CARDSTATUS1 = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = CARDSTATUS2
    */
    final abstract class RESP2 : Register!(0x18)
    {
        /*********************************************************************
         CARDSTATUS2
        */
        alias CARDSTATUS2 = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = CARDSTATUS3
    */
    final abstract class RESP3 : Register!(0x1c)
    {
        /*********************************************************************
         CARDSTATUS3
        */
        alias CARDSTATUS3 = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = CARDSTATUS4
    */
    final abstract class RESP4 : Register!(0x20)
    {
        /*********************************************************************
         CARDSTATUS4
        */
        alias CARDSTATUS4 = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 31:0 = DATATIME: Data timeout period
    */
    final abstract class DTIMER : Register!(0x24)
    {
        /*********************************************************************
         Data timeout period
        */
        alias DATATIME = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bits 24:0 = DATALENGTH: Data length value
    */
    final abstract class DLEN : Register!(0x28)
    {
        /*********************************************************************
         Data length value
        */
        alias DATALENGTH = BitField!(24, 0, Mutability.rw);
    }

    /*************************************************************************
     SDIO data control register (SDIO_DCTRL)
    */
    final abstract class DCTRL : Register!(0x2c)
    {
        /*********************************************************************
         DTEN
        */
        alias DTEN = Bit!(0, Mutability.rw);

        /*********************************************************************
         DTDIR
        */
        alias DTDIR = Bit!(1, Mutability.rw);

        /*********************************************************************
         DTMODE
        */
        alias DTMODE = Bit!(2, Mutability.rw);

        /*********************************************************************
         DMAEN
        */
        alias DMAEN = Bit!(3, Mutability.rw);

        /*********************************************************************
         DBLOCKSIZE
        */
        alias DBLOCKSIZE = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         PWSTART
        */
        alias PWSTART = Bit!(8, Mutability.rw);

        /*********************************************************************
         PWSTOP
        */
        alias PWSTOP = Bit!(9, Mutability.rw);

        /*********************************************************************
         RWMOD
        */
        alias RWMOD = Bit!(10, Mutability.rw);

        /*********************************************************************
         SDIOEN
        */
        alias SDIOEN = Bit!(11, Mutability.rw);
    }

    /*************************************************************************
     Bits 24:0 = DATACOUNT: Data count value
    */
    final abstract class DCOUNT : Register!(0x30)
    {
        /*********************************************************************
         Data count value
        */
        alias DATACOUNT = BitField!(24, 0, Mutability.rw);
    }

    /*************************************************************************
     SDIO status register (SDIO_STA)
    */
    final abstract class STA : Register!(0x34)
    {
        /*********************************************************************
         CCRCFAIL
        */
        alias CCRCFAIL = Bit!(0, Mutability.rw);

        /*********************************************************************
         DCRCFAIL
        */
        alias DCRCFAIL = Bit!(1, Mutability.rw);

        /*********************************************************************
         CTIMEOUT
        */
        alias CTIMEOUT = Bit!(2, Mutability.rw);

        /*********************************************************************
         DTIMEOUT
        */
        alias DTIMEOUT = Bit!(3, Mutability.rw);

        /*********************************************************************
         TXUNDERR
        */
        alias TXUNDERR = Bit!(4, Mutability.rw);

        /*********************************************************************
         RXOVERR
        */
        alias RXOVERR = Bit!(5, Mutability.rw);

        /*********************************************************************
         CMDREND
        */
        alias CMDREND = Bit!(6, Mutability.rw);

        /*********************************************************************
         CMDSENT
        */
        alias CMDSENT = Bit!(7, Mutability.rw);

        /*********************************************************************
         DATAEND
        */
        alias DATAEND = Bit!(8, Mutability.rw);

        /*********************************************************************
         STBITERR
        */
        alias STBITERR = Bit!(9, Mutability.rw);

        /*********************************************************************
         DBCKEND
        */
        alias DBCKEND = Bit!(10, Mutability.rw);

        /*********************************************************************
         CMDACT
        */
        alias CMDACT = Bit!(11, Mutability.rw);

        /*********************************************************************
         TXACT
        */
        alias TXACT = Bit!(12, Mutability.rw);

        /*********************************************************************
         RXACT
        */
        alias RXACT = Bit!(13, Mutability.rw);

        /*********************************************************************
         TXFIFOHE
        */
        alias TXFIFOHE = Bit!(14, Mutability.rw);

        /*********************************************************************
         RXFIFOHF
        */
        alias RXFIFOHF = Bit!(15, Mutability.rw);

        /*********************************************************************
         TXFIFOF
        */
        alias TXFIFOF = Bit!(16, Mutability.rw);

        /*********************************************************************
         RXFIFOF
        */
        alias RXFIFOF = Bit!(17, Mutability.rw);

        /*********************************************************************
         TXFIFOE
        */
        alias TXFIFOE = Bit!(18, Mutability.rw);

        /*********************************************************************
         RXFIFOE
        */
        alias RXFIFOE = Bit!(19, Mutability.rw);

        /*********************************************************************
         TXDAVL
        */
        alias TXDAVL = Bit!(20, Mutability.rw);

        /*********************************************************************
         RXDAVL
        */
        alias RXDAVL = Bit!(21, Mutability.rw);

        /*********************************************************************
         SDIOIT
        */
        alias SDIOIT = Bit!(22, Mutability.rw);

        /*********************************************************************
         CEATAEND
        */
        alias CEATAEND = Bit!(23, Mutability.rw);
    }

    /*************************************************************************
     SDIO interrupt clear register (SDIO_ICR)
    */
    final abstract class ICR : Register!(0x38)
    {
        /*********************************************************************
         CCRCFAILC
        */
        alias CCRCFAILC = Bit!(0, Mutability.rw);

        /*********************************************************************
         DCRCFAILC
        */
        alias DCRCFAILC = Bit!(1, Mutability.rw);

        /*********************************************************************
         CTIMEOUTC
        */
        alias CTIMEOUTC = Bit!(2, Mutability.rw);

        /*********************************************************************
         DTIMEOUTC
        */
        alias DTIMEOUTC = Bit!(3, Mutability.rw);

        /*********************************************************************
         TXUNDERRC
        */
        alias TXUNDERRC = Bit!(4, Mutability.rw);

        /*********************************************************************
         RXOVERRC
        */
        alias RXOVERRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         CMDRENDC
        */
        alias CMDRENDC = Bit!(6, Mutability.rw);

        /*********************************************************************
         CMDSENTC
        */
        alias CMDSENTC = Bit!(7, Mutability.rw);

        /*********************************************************************
         DATAENDC
        */
        alias DATAENDC = Bit!(8, Mutability.rw);

        /*********************************************************************
         STBITERRC
        */
        alias STBITERRC = Bit!(9, Mutability.rw);

        /*********************************************************************
         DBCKENDC
        */
        alias DBCKENDC = Bit!(10, Mutability.rw);

        /*********************************************************************
         SDIOITC
        */
        alias SDIOITC = Bit!(22, Mutability.rw);

        /*********************************************************************
         CEATAENDC
        */
        alias CEATAENDC = Bit!(23, Mutability.rw);
    }

    /*************************************************************************
     SDIO mask register (SDIO_MASK)
    */
    final abstract class MASK : Register!(0x3c)
    {
        /*********************************************************************
         CCRCFAILIE
        */
        alias CCRCFAILIE = Bit!(0, Mutability.rw);

        /*********************************************************************
         DCRCFAILIE
        */
        alias DCRCFAILIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         CTIMEOUTIE
        */
        alias CTIMEOUTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         DTIMEOUTIE
        */
        alias DTIMEOUTIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         TXUNDERRIE
        */
        alias TXUNDERRIE = Bit!(4, Mutability.rw);

        /*********************************************************************
         RXOVERRIE
        */
        alias RXOVERRIE = Bit!(5, Mutability.rw);

        /*********************************************************************
         CMDRENDIE
        */
        alias CMDRENDIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         CMDSENTIE
        */
        alias CMDSENTIE = Bit!(7, Mutability.rw);

        /*********************************************************************
         DATAENDIE
        */
        alias DATAENDIE = Bit!(8, Mutability.rw);

        /*********************************************************************
         STBITERRIE
        */
        alias STBITERRIE = Bit!(9, Mutability.rw);

        /*********************************************************************
         DBACKENDIE
        */
        alias DBACKENDIE = Bit!(10, Mutability.rw);

        /*********************************************************************
         CMDACTIE
        */
        alias CMDACTIE = Bit!(11, Mutability.rw);

        /*********************************************************************
         TXACTIE
        */
        alias TXACTIE = Bit!(12, Mutability.rw);

        /*********************************************************************
         RXACTIE
        */
        alias RXACTIE = Bit!(13, Mutability.rw);

        /*********************************************************************
         TXFIFOHEIE
        */
        alias TXFIFOHEIE = Bit!(14, Mutability.rw);

        /*********************************************************************
         RXFIFOHFIE
        */
        alias RXFIFOHFIE = Bit!(15, Mutability.rw);

        /*********************************************************************
         TXFIFOFIE
        */
        alias TXFIFOFIE = Bit!(16, Mutability.rw);

        /*********************************************************************
         RXFIFOFIE
        */
        alias RXFIFOFIE = Bit!(17, Mutability.rw);

        /*********************************************************************
         TXFIFOEIE
        */
        alias TXFIFOEIE = Bit!(18, Mutability.rw);

        /*********************************************************************
         RXFIFOEIE
        */
        alias RXFIFOEIE = Bit!(19, Mutability.rw);

        /*********************************************************************
         TXDAVLIE
        */
        alias TXDAVLIE = Bit!(20, Mutability.rw);

        /*********************************************************************
         RXDAVLIE
        */
        alias RXDAVLIE = Bit!(21, Mutability.rw);

        /*********************************************************************
         SDIOITIE
        */
        alias SDIOITIE = Bit!(22, Mutability.rw);

        /*********************************************************************
         CEATENDIE
        */
        alias CEATENDIE = Bit!(23, Mutability.rw);
    }

    /*************************************************************************
     Bits 23:0 = FIFOCOUNT: Remaining number of words to be written to or read from the FIFO
    */
    final abstract class FIFOCNT : Register!(0x48)
    {
        /*********************************************************************
         FIF0COUNT
        */
        alias FIF0COUNT = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     bits 31:0 = FIFOData: Receive and transmit FIFO data
    */
    final abstract class FIFO : Register!(0x80)
    {
        /*********************************************************************
         FIFOData
        */
        alias FIFOData = BitField!(31, 0, Mutability.rw);
    }
}
