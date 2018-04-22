module stm32f103xx.fsmc;

import stm32f103xx.mmio;

/*****************************************************************************
 Flexible static memory controller
*/
final abstract class FSMC : Peripheral!(0xA0000000)
{
    /*************************************************************************
     SRAM/NOR-Flash chip-select control register 1
    */
    final abstract class BCR1 : Register!(00)
    {
        /*********************************************************************
         CBURSTRW
        */
        alias CBURSTRW = Bit!(19, Mutability.rw);

        /*********************************************************************
         ASYNCWAIT
        */
        alias ASYNCWAIT = Bit!(15, Mutability.rw);

        /*********************************************************************
         EXTMOD
        */
        alias EXTMOD = Bit!(14, Mutability.rw);

        /*********************************************************************
         WAITEN
        */
        alias WAITEN = Bit!(13, Mutability.rw);

        /*********************************************************************
         WREN
        */
        alias WREN = Bit!(12, Mutability.rw);

        /*********************************************************************
         WAITCFG
        */
        alias WAITCFG = Bit!(11, Mutability.rw);

        /*********************************************************************
         WAITPOL
        */
        alias WAITPOL = Bit!(9, Mutability.rw);

        /*********************************************************************
         BURSTEN
        */
        alias BURSTEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         FACCEN
        */
        alias FACCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         MWID
        */
        alias MWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         MTYP
        */
        alias MTYP = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         MUXEN
        */
        alias MUXEN = Bit!(1, Mutability.rw);

        /*********************************************************************
         MBKEN
        */
        alias MBKEN = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select timing register 1
    */
    final abstract class BTR1 : Register!(0x4)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         BUSTURN
        */
        alias BUSTURN = BitField!(19, 16, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select control register 2
    */
    final abstract class BCR2 : Register!(0x8)
    {
        /*********************************************************************
         CBURSTRW
        */
        alias CBURSTRW = Bit!(19, Mutability.rw);

        /*********************************************************************
         ASYNCWAIT
        */
        alias ASYNCWAIT = Bit!(15, Mutability.rw);

        /*********************************************************************
         EXTMOD
        */
        alias EXTMOD = Bit!(14, Mutability.rw);

        /*********************************************************************
         WAITEN
        */
        alias WAITEN = Bit!(13, Mutability.rw);

        /*********************************************************************
         WREN
        */
        alias WREN = Bit!(12, Mutability.rw);

        /*********************************************************************
         WAITCFG
        */
        alias WAITCFG = Bit!(11, Mutability.rw);

        /*********************************************************************
         WRAPMOD
        */
        alias WRAPMOD = Bit!(10, Mutability.rw);

        /*********************************************************************
         WAITPOL
        */
        alias WAITPOL = Bit!(9, Mutability.rw);

        /*********************************************************************
         BURSTEN
        */
        alias BURSTEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         FACCEN
        */
        alias FACCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         MWID
        */
        alias MWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         MTYP
        */
        alias MTYP = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         MUXEN
        */
        alias MUXEN = Bit!(1, Mutability.rw);

        /*********************************************************************
         MBKEN
        */
        alias MBKEN = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select timing register 2
    */
    final abstract class BTR2 : Register!(0xc)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         BUSTURN
        */
        alias BUSTURN = BitField!(19, 16, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select control register 3
    */
    final abstract class BCR3 : Register!(0x10)
    {
        /*********************************************************************
         CBURSTRW
        */
        alias CBURSTRW = Bit!(19, Mutability.rw);

        /*********************************************************************
         ASYNCWAIT
        */
        alias ASYNCWAIT = Bit!(15, Mutability.rw);

        /*********************************************************************
         EXTMOD
        */
        alias EXTMOD = Bit!(14, Mutability.rw);

        /*********************************************************************
         WAITEN
        */
        alias WAITEN = Bit!(13, Mutability.rw);

        /*********************************************************************
         WREN
        */
        alias WREN = Bit!(12, Mutability.rw);

        /*********************************************************************
         WAITCFG
        */
        alias WAITCFG = Bit!(11, Mutability.rw);

        /*********************************************************************
         WRAPMOD
        */
        alias WRAPMOD = Bit!(10, Mutability.rw);

        /*********************************************************************
         WAITPOL
        */
        alias WAITPOL = Bit!(9, Mutability.rw);

        /*********************************************************************
         BURSTEN
        */
        alias BURSTEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         FACCEN
        */
        alias FACCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         MWID
        */
        alias MWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         MTYP
        */
        alias MTYP = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         MUXEN
        */
        alias MUXEN = Bit!(1, Mutability.rw);

        /*********************************************************************
         MBKEN
        */
        alias MBKEN = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select timing register 3
    */
    final abstract class BTR3 : Register!(0x14)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         BUSTURN
        */
        alias BUSTURN = BitField!(19, 16, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select control register 4
    */
    final abstract class BCR4 : Register!(0x18)
    {
        /*********************************************************************
         CBURSTRW
        */
        alias CBURSTRW = Bit!(19, Mutability.rw);

        /*********************************************************************
         ASYNCWAIT
        */
        alias ASYNCWAIT = Bit!(15, Mutability.rw);

        /*********************************************************************
         EXTMOD
        */
        alias EXTMOD = Bit!(14, Mutability.rw);

        /*********************************************************************
         WAITEN
        */
        alias WAITEN = Bit!(13, Mutability.rw);

        /*********************************************************************
         WREN
        */
        alias WREN = Bit!(12, Mutability.rw);

        /*********************************************************************
         WAITCFG
        */
        alias WAITCFG = Bit!(11, Mutability.rw);

        /*********************************************************************
         WRAPMOD
        */
        alias WRAPMOD = Bit!(10, Mutability.rw);

        /*********************************************************************
         WAITPOL
        */
        alias WAITPOL = Bit!(9, Mutability.rw);

        /*********************************************************************
         BURSTEN
        */
        alias BURSTEN = Bit!(8, Mutability.rw);

        /*********************************************************************
         FACCEN
        */
        alias FACCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         MWID
        */
        alias MWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         MTYP
        */
        alias MTYP = BitField!(3, 2, Mutability.rw);

        /*********************************************************************
         MUXEN
        */
        alias MUXEN = Bit!(1, Mutability.rw);

        /*********************************************************************
         MBKEN
        */
        alias MBKEN = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash chip-select timing register 4
    */
    final abstract class BTR4 : Register!(0x1c)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         BUSTURN
        */
        alias BUSTURN = BitField!(19, 16, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     PC Card/NAND Flash control register 2
    */
    final abstract class PCR2 : Register!(0x60)
    {
        /*********************************************************************
         ECCPS
        */
        alias ECCPS = BitField!(19, 17, Mutability.rw);

        /*********************************************************************
         TAR
        */
        alias TAR = BitField!(16, 13, Mutability.rw);

        /*********************************************************************
         TCLR
        */
        alias TCLR = BitField!(12, 9, Mutability.rw);

        /*********************************************************************
         ECCEN
        */
        alias ECCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         PWID
        */
        alias PWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         PTYP
        */
        alias PTYP = Bit!(3, Mutability.rw);

        /*********************************************************************
         PBKEN
        */
        alias PBKEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         PWAITEN
        */
        alias PWAITEN = Bit!(1, Mutability.rw);
    }

    /*************************************************************************
     FIFO status and interrupt register 2
    */
    final abstract class SR2 : Register!(0x64)
    {
        /*********************************************************************
         FEMPT
        */
        alias FEMPT = Bit!(6, Mutability.r);

        /*********************************************************************
         IFEN
        */
        alias IFEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         ILEN
        */
        alias ILEN = Bit!(4, Mutability.rw);

        /*********************************************************************
         IREN
        */
        alias IREN = Bit!(3, Mutability.rw);

        /*********************************************************************
         IFS
        */
        alias IFS = Bit!(2, Mutability.rw);

        /*********************************************************************
         ILS
        */
        alias ILS = Bit!(1, Mutability.rw);

        /*********************************************************************
         IRS
        */
        alias IRS = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Common memory space timing register 2
    */
    final abstract class PMEM2 : Register!(0x68)
    {
        /*********************************************************************
         MEMHIZx
        */
        alias MEMHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         MEMHOLDx
        */
        alias MEMHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         MEMWAITx
        */
        alias MEMWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         MEMSETx
        */
        alias MEMSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Attribute memory space timing register 2
    */
    final abstract class PATT2 : Register!(0x6c)
    {
        /*********************************************************************
         Attribute memory x databus HiZ time
        */
        alias ATTHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         Attribute memory x hold time
        */
        alias ATTHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Attribute memory x wait time
        */
        alias ATTWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         Attribute memory x setup time
        */
        alias ATTSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     ECC result register 2
    */
    final abstract class ECCR2 : Register!(0x74)
    {
        /*********************************************************************
         ECC result
        */
        alias ECCx = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     PC Card/NAND Flash control register 3
    */
    final abstract class PCR3 : Register!(0x80)
    {
        /*********************************************************************
         ECCPS
        */
        alias ECCPS = BitField!(19, 17, Mutability.rw);

        /*********************************************************************
         TAR
        */
        alias TAR = BitField!(16, 13, Mutability.rw);

        /*********************************************************************
         TCLR
        */
        alias TCLR = BitField!(12, 9, Mutability.rw);

        /*********************************************************************
         ECCEN
        */
        alias ECCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         PWID
        */
        alias PWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         PTYP
        */
        alias PTYP = Bit!(3, Mutability.rw);

        /*********************************************************************
         PBKEN
        */
        alias PBKEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         PWAITEN
        */
        alias PWAITEN = Bit!(1, Mutability.rw);
    }

    /*************************************************************************
     FIFO status and interrupt register 3
    */
    final abstract class SR3 : Register!(0x84)
    {
        /*********************************************************************
         FEMPT
        */
        alias FEMPT = Bit!(6, Mutability.r);

        /*********************************************************************
         IFEN
        */
        alias IFEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         ILEN
        */
        alias ILEN = Bit!(4, Mutability.rw);

        /*********************************************************************
         IREN
        */
        alias IREN = Bit!(3, Mutability.rw);

        /*********************************************************************
         IFS
        */
        alias IFS = Bit!(2, Mutability.rw);

        /*********************************************************************
         ILS
        */
        alias ILS = Bit!(1, Mutability.rw);

        /*********************************************************************
         IRS
        */
        alias IRS = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Common memory space timing register 3
    */
    final abstract class PMEM3 : Register!(0x88)
    {
        /*********************************************************************
         MEMHIZx
        */
        alias MEMHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         MEMHOLDx
        */
        alias MEMHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         MEMWAITx
        */
        alias MEMWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         MEMSETx
        */
        alias MEMSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Attribute memory space timing register 3
    */
    final abstract class PATT3 : Register!(0x8c)
    {
        /*********************************************************************
         ATTHIZx
        */
        alias ATTHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         ATTHOLDx
        */
        alias ATTHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         ATTWAITx
        */
        alias ATTWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ATTSETx
        */
        alias ATTSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     ECC result register 3
    */
    final abstract class ECCR3 : Register!(0x94)
    {
        /*********************************************************************
         ECCx
        */
        alias ECCx = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     PC Card/NAND Flash control register 4
    */
    final abstract class PCR4 : Register!(0xa0)
    {
        /*********************************************************************
         ECCPS
        */
        alias ECCPS = BitField!(19, 17, Mutability.rw);

        /*********************************************************************
         TAR
        */
        alias TAR = BitField!(16, 13, Mutability.rw);

        /*********************************************************************
         TCLR
        */
        alias TCLR = BitField!(12, 9, Mutability.rw);

        /*********************************************************************
         ECCEN
        */
        alias ECCEN = Bit!(6, Mutability.rw);

        /*********************************************************************
         PWID
        */
        alias PWID = BitField!(5, 4, Mutability.rw);

        /*********************************************************************
         PTYP
        */
        alias PTYP = Bit!(3, Mutability.rw);

        /*********************************************************************
         PBKEN
        */
        alias PBKEN = Bit!(2, Mutability.rw);

        /*********************************************************************
         PWAITEN
        */
        alias PWAITEN = Bit!(1, Mutability.rw);
    }

    /*************************************************************************
     FIFO status and interrupt register 4
    */
    final abstract class SR4 : Register!(0xa4)
    {
        /*********************************************************************
         FEMPT
        */
        alias FEMPT = Bit!(6, Mutability.r);

        /*********************************************************************
         IFEN
        */
        alias IFEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         ILEN
        */
        alias ILEN = Bit!(4, Mutability.rw);

        /*********************************************************************
         IREN
        */
        alias IREN = Bit!(3, Mutability.rw);

        /*********************************************************************
         IFS
        */
        alias IFS = Bit!(2, Mutability.rw);

        /*********************************************************************
         ILS
        */
        alias ILS = Bit!(1, Mutability.rw);

        /*********************************************************************
         IRS
        */
        alias IRS = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Common memory space timing register 4
    */
    final abstract class PMEM4 : Register!(0xa8)
    {
        /*********************************************************************
         MEMHIZx
        */
        alias MEMHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         MEMHOLDx
        */
        alias MEMHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         MEMWAITx
        */
        alias MEMWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         MEMSETx
        */
        alias MEMSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Attribute memory space timing register 4
    */
    final abstract class PATT4 : Register!(0xac)
    {
        /*********************************************************************
         ATTHIZx
        */
        alias ATTHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         ATTHOLDx
        */
        alias ATTHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         ATTWAITx
        */
        alias ATTWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ATTSETx
        */
        alias ATTSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     I/O space timing register 4
    */
    final abstract class PIO4 : Register!(0xb0)
    {
        /*********************************************************************
         IOHIZx
        */
        alias IOHIZx = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         IOHOLDx
        */
        alias IOHOLDx = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         IOWAITx
        */
        alias IOWAITx = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         IOSETx
        */
        alias IOSETx = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash write timing registers 1
    */
    final abstract class BWTR1 : Register!(0x104)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash write timing registers 2
    */
    final abstract class BWTR2 : Register!(0x10c)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash write timing registers 3
    */
    final abstract class BWTR3 : Register!(0x114)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     SRAM/NOR-Flash write timing registers 4
    */
    final abstract class BWTR4 : Register!(0x11c)
    {
        /*********************************************************************
         ACCMOD
        */
        alias ACCMOD = BitField!(29, 28, Mutability.rw);

        /*********************************************************************
         DATLAT
        */
        alias DATLAT = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         CLKDIV
        */
        alias CLKDIV = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         DATAST
        */
        alias DATAST = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         ADDHLD
        */
        alias ADDHLD = BitField!(7, 4, Mutability.rw);

        /*********************************************************************
         ADDSET
        */
        alias ADDSET = BitField!(3, 0, Mutability.rw);
    }
}
