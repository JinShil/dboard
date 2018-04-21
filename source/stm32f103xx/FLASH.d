module stm32f103xx.flash;

import stm32f103xx.mmio;

/*****************************************************************************
 FLASH
*/
final abstract class FLASH : Peripheral!(0x40022000)
{
    /*************************************************************************
     Flash access control register
    */
    final abstract class ACR : Register!(00)
    {
        /*********************************************************************
         Latency
        */
        alias LATENCY = BitField!(2, 0, Mutability.rw);

        /*********************************************************************
         Flash half cycle access enable
        */
        alias HLFCYA = Bit!(3, Mutability.rw);

        /*********************************************************************
         Prefetch buffer enable
        */
        alias PRFTBE = Bit!(4, Mutability.rw);

        /*********************************************************************
         Prefetch buffer status
        */
        alias PRFTBS = Bit!(5, Mutability.r);
    }

    /*************************************************************************
     Flash key register
    */
    final abstract class KEYR : Register!(0x4)
    {
        /*********************************************************************
         FPEC key
        */
        alias KEY = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Flash option key register
    */
    final abstract class OPTKEYR : Register!(0x8)
    {
        /*********************************************************************
         Option byte key
        */
        alias OPTKEY = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Status register
    */
    final abstract class SR : Register!(0xc)
    {
        /*********************************************************************
         End of operation
        */
        alias EOP = Bit!(5, Mutability.rw);

        /*********************************************************************
         Write protection error
        */
        alias WRPRTERR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Programming error
        */
        alias PGERR = Bit!(2, Mutability.rw);

        /*********************************************************************
         Busy
        */
        alias BSY = Bit!(0, Mutability.r);
    }

    /*************************************************************************
     Control register
    */
    final abstract class CR : Register!(0x10)
    {
        /*********************************************************************
         Programming
        */
        alias PG = Bit!(0, Mutability.rw);

        /*********************************************************************
         Page Erase
        */
        alias PER = Bit!(1, Mutability.rw);

        /*********************************************************************
         Mass Erase
        */
        alias MER = Bit!(2, Mutability.rw);

        /*********************************************************************
         Option byte programming
        */
        alias OPTPG = Bit!(4, Mutability.rw);

        /*********************************************************************
         Option byte erase
        */
        alias OPTER = Bit!(5, Mutability.rw);

        /*********************************************************************
         Start
        */
        alias STRT = Bit!(6, Mutability.rw);

        /*********************************************************************
         Lock
        */
        alias LOCK = Bit!(7, Mutability.rw);

        /*********************************************************************
         Option bytes write enable
        */
        alias OPTWRE = Bit!(9, Mutability.rw);

        /*********************************************************************
         Error interrupt enable
        */
        alias ERRIE = Bit!(10, Mutability.rw);

        /*********************************************************************
         End of operation interrupt enable
        */
        alias EOPIE = Bit!(12, Mutability.rw);
    }

    /*************************************************************************
     Flash address register
    */
    final abstract class AR : Register!(0x14)
    {
        /*********************************************************************
         Flash Address
        */
        alias FAR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Option byte register
    */
    final abstract class OBR : Register!(0x1c)
    {
        /*********************************************************************
         Option byte error
        */
        alias OPTERR = Bit!(0, Mutability.rw);

        /*********************************************************************
         Read protection
        */
        alias RDPRT = Bit!(1, Mutability.rw);

        /*********************************************************************
         WDG_SW
        */
        alias WDG_SW = Bit!(2, Mutability.rw);

        /*********************************************************************
         nRST_STOP
        */
        alias nRST_STOP = Bit!(3, Mutability.rw);

        /*********************************************************************
         nRST_STDBY
        */
        alias nRST_STDBY = Bit!(4, Mutability.rw);

        /*********************************************************************
         Data0
        */
        alias Data0 = BitField!(17, 10, Mutability.rw);

        /*********************************************************************
         Data1
        */
        alias Data1 = BitField!(25, 18, Mutability.rw);
    }

    /*************************************************************************
     Write protection register
    */
    final abstract class WRPR : Register!(0x20)
    {
        /*********************************************************************
         Write protect
        */
        alias WRP = BitField!(31, 0, Mutability.rw);
    }
}
