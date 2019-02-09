module stm32f103xx.scb;

import stm32f103xx.mmio;

/*****************************************************************************
 System control block
*/
final abstract class SCB : Peripheral!(0xE000ED00)
{
    /*************************************************************************
     CPUID base register
    */
    final abstract class CPUID : Register!(00)
    {
        /*********************************************************************
         Revision number
        */
        alias Revision = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Part number of the processor
        */
        alias PartNo = BitField!(15, 4, Mutability.rw);

        /*********************************************************************
         Reads as 0xF
        */
        alias Constant = BitField!(19, 16, Mutability.rw);

        /*********************************************************************
         Variant number
        */
        alias Variant = BitField!(23, 20, Mutability.rw);

        /*********************************************************************
         Implementer code
        */
        alias Implementer = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Interrupt control and state register
    */
    final abstract class ICSR : Register!(0x4)
    {
        /*********************************************************************
         Active vector
        */
        alias VECTACTIVE = BitField!(8, 0, Mutability.rw);

        /*********************************************************************
         Return to base level
        */
        alias RETTOBASE = Bit!(11, Mutability.rw);

        /*********************************************************************
         Pending vector
        */
        alias VECTPENDING = BitField!(18, 12, Mutability.rw);

        /*********************************************************************
         Interrupt pending flag
        */
        alias ISRPENDING = Bit!(22, Mutability.rw);

        /*********************************************************************
         SysTick exception clear-pending bit
        */
        alias PENDSTCLR = Bit!(25, Mutability.rw);

        /*********************************************************************
         SysTick exception set-pending bit
        */
        alias PENDSTSET = Bit!(26, Mutability.rw);

        /*********************************************************************
         PendSV clear-pending bit
        */
        alias PENDSVCLR = Bit!(27, Mutability.rw);

        /*********************************************************************
         PendSV set-pending bit
        */
        alias PENDSVSET = Bit!(28, Mutability.rw);

        /*********************************************************************
         NMI set-pending bit.
        */
        alias NMIPENDSET = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Vector table offset register
    */
    final abstract class VTOR : Register!(0x8)
    {
        /*********************************************************************
         Vector table base offset field
        */
        alias TBLOFF = BitField!(29, 9, Mutability.rw);
    }

    /*************************************************************************
     Application interrupt and reset control register
    */
    final abstract class AIRCR : Register!(0xc)
    {
        /*********************************************************************
         VECTRESET
        */
        alias VECTRESET = Bit!(0, Mutability.rw);

        /*********************************************************************
         VECTCLRACTIVE
        */
        alias VECTCLRACTIVE = Bit!(1, Mutability.rw);

        /*********************************************************************
         SYSRESETREQ
        */
        alias SYSRESETREQ = Bit!(2, Mutability.rw);

        /*********************************************************************
         PRIGROUP
        */
        alias PRIGROUP = BitField!(10, 8, Mutability.rw);

        /*********************************************************************
         ENDIANESS
        */
        alias ENDIANESS = Bit!(15, Mutability.rw);

        /*********************************************************************
         Register key
        */
        alias VECTKEYSTAT = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     System control register
    */
    final abstract class SCR : Register!(0x10)
    {
        /*********************************************************************
         SLEEPONEXIT
        */
        alias SLEEPONEXIT = Bit!(1, Mutability.rw);

        /*********************************************************************
         SLEEPDEEP
        */
        alias SLEEPDEEP = Bit!(2, Mutability.rw);

        /*********************************************************************
         Send Event on Pending bit
        */
        alias SEVEONPEND = Bit!(4, Mutability.rw);
    }

    /*************************************************************************
     Configuration and control register
    */
    final abstract class CCR : Register!(0x14)
    {
        /*********************************************************************
         Configures how the processor enters Thread mode
        */
        alias NONBASETHRDENA = Bit!(0, Mutability.rw);

        /*********************************************************************
         USERSETMPEND
        */
        alias USERSETMPEND = Bit!(1, Mutability.rw);

        /*********************************************************************
         UNALIGN_ TRP
        */
        alias UNALIGN__TRP = Bit!(3, Mutability.rw);

        /*********************************************************************
         DIV_0_TRP
        */
        alias DIV_0_TRP = Bit!(4, Mutability.rw);

        /*********************************************************************
         BFHFNMIGN
        */
        alias BFHFNMIGN = Bit!(8, Mutability.rw);

        /*********************************************************************
         STKALIGN
        */
        alias STKALIGN = Bit!(9, Mutability.rw);
    }

    /*************************************************************************
     System handler priority registers
    */
    final abstract class SHPR1 : Register!(0x18)
    {
        /*********************************************************************
         Priority of system handler 4
        */
        alias PRI_4 = BitField!(7, 0, Mutability.rw);

        /*********************************************************************
         Priority of system handler 5
        */
        alias PRI_5 = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         Priority of system handler 6
        */
        alias PRI_6 = BitField!(23, 16, Mutability.rw);
    }

    /*************************************************************************
     System handler priority registers
    */
    final abstract class SHPR2 : Register!(0x1c)
    {
        /*********************************************************************
         Priority of system handler 11
        */
        alias PRI_11 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     System handler priority registers
    */
    final abstract class SHPR3 : Register!(0x20)
    {
        /*********************************************************************
         Priority of system handler 14
        */
        alias PRI_14 = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Priority of system handler 15
        */
        alias PRI_15 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     System handler control and state register
    */
    final abstract class SHCRS : Register!(0x24)
    {
        /*********************************************************************
         Memory management fault exception active bit
        */
        alias MEMFAULTACT = Bit!(0, Mutability.rw);

        /*********************************************************************
         Bus fault exception active bit
        */
        alias BUSFAULTACT = Bit!(1, Mutability.rw);

        /*********************************************************************
         Usage fault exception active bit
        */
        alias USGFAULTACT = Bit!(3, Mutability.rw);

        /*********************************************************************
         SVC call active bit
        */
        alias SVCALLACT = Bit!(7, Mutability.rw);

        /*********************************************************************
         Debug monitor active bit
        */
        alias MONITORACT = Bit!(8, Mutability.rw);

        /*********************************************************************
         PendSV exception active bit
        */
        alias PENDSVACT = Bit!(10, Mutability.rw);

        /*********************************************************************
         SysTick exception active bit
        */
        alias SYSTICKACT = Bit!(11, Mutability.rw);

        /*********************************************************************
         Usage fault exception pending bit
        */
        alias USGFAULTPENDED = Bit!(12, Mutability.rw);

        /*********************************************************************
         Memory management fault exception pending bit
        */
        alias MEMFAULTPENDED = Bit!(13, Mutability.rw);

        /*********************************************************************
         Bus fault exception pending bit
        */
        alias BUSFAULTPENDED = Bit!(14, Mutability.rw);

        /*********************************************************************
         SVC call pending bit
        */
        alias SVCALLPENDED = Bit!(15, Mutability.rw);

        /*********************************************************************
         Memory management fault enable bit
        */
        alias MEMFAULTENA = Bit!(16, Mutability.rw);

        /*********************************************************************
         Bus fault enable bit
        */
        alias BUSFAULTENA = Bit!(17, Mutability.rw);

        /*********************************************************************
         Usage fault enable bit
        */
        alias USGFAULTENA = Bit!(18, Mutability.rw);
    }

    /*************************************************************************
     Configurable fault status register
    */
    final abstract class CFSR_UFSR_BFSR_MMFSR : Register!(0x28)
    {
        /*********************************************************************
         IACCVIOL
        */
        alias IACCVIOL = Bit!(0, Mutability.rw);

        /*********************************************************************
         DACCVIOL
        */
        alias DACCVIOL = Bit!(1, Mutability.rw);

        /*********************************************************************
         MUNSTKERR
        */
        alias MUNSTKERR = Bit!(3, Mutability.rw);

        /*********************************************************************
         MSTKERR
        */
        alias MSTKERR = Bit!(4, Mutability.rw);

        /*********************************************************************
         MLSPERR
        */
        alias MLSPERR = Bit!(5, Mutability.rw);

        /*********************************************************************
         MMARVALID
        */
        alias MMARVALID = Bit!(7, Mutability.rw);

        /*********************************************************************
         Instruction bus error
        */
        alias IBUSERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Precise data bus error
        */
        alias PRECISERR = Bit!(9, Mutability.rw);

        /*********************************************************************
         Imprecise data bus error
        */
        alias IMPRECISERR = Bit!(10, Mutability.rw);

        /*********************************************************************
         Bus fault on unstacking for a return from exception
        */
        alias UNSTKERR = Bit!(11, Mutability.rw);

        /*********************************************************************
         Bus fault on stacking for exception entry
        */
        alias STKERR = Bit!(12, Mutability.rw);

        /*********************************************************************
         Bus fault on floating-point lazy state preservation
        */
        alias LSPERR = Bit!(13, Mutability.rw);

        /*********************************************************************
         Bus Fault Address Register (BFAR) valid flag
        */
        alias BFARVALID = Bit!(15, Mutability.rw);

        /*********************************************************************
         Undefined instruction usage fault
        */
        alias UNDEFINSTR = Bit!(16, Mutability.rw);

        /*********************************************************************
         Invalid state usage fault
        */
        alias INVSTATE = Bit!(17, Mutability.rw);

        /*********************************************************************
         Invalid PC load usage fault
        */
        alias INVPC = Bit!(18, Mutability.rw);

        /*********************************************************************
         No coprocessor usage fault.
        */
        alias NOCP = Bit!(19, Mutability.rw);

        /*********************************************************************
         Unaligned access usage fault
        */
        alias UNALIGNED = Bit!(24, Mutability.rw);

        /*********************************************************************
         Divide by zero usage fault
        */
        alias DIVBYZERO = Bit!(25, Mutability.rw);
    }

    /*************************************************************************
     Hard fault status register
    */
    final abstract class HFSR : Register!(0x2c)
    {
        /*********************************************************************
         Vector table hard fault
        */
        alias VECTTBL = Bit!(1, Mutability.rw);

        /*********************************************************************
         Forced hard fault
        */
        alias FORCED = Bit!(30, Mutability.rw);

        /*********************************************************************
         Reserved for Debug use
        */
        alias DEBUG_VT = Bit!(31, Mutability.rw);
    }

    /*************************************************************************
     Memory management fault address register
    */
    final abstract class MMFAR : Register!(0x34)
    {
        /*********************************************************************
         Memory management fault address
        */
        alias MMFAR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Bus fault address register
    */
    final abstract class BFAR : Register!(0x38)
    {
        /*********************************************************************
         Bus fault address
        */
        alias BFAR = BitField!(31, 0, Mutability.rw);
    }
}
