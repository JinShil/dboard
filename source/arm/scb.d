module arm.scb;

import mvf.mmio;

/*****************************************************************************
 System Control BLock
*/
final abstract class SCB : Peripheral!(0xE000E008)
{
    /*************************************************************************
     CPU ID
    */
    final abstract class CPUID : Register!(0x00)
    {
        /*********************************************************************
         Implementer code: 0x41 corresponds to ARM
        */
        alias Implementer = BitField!(31, 24, Mutability.r);

        /*********************************************************************
         Variant number, the r value in the rnpn product revision identifier:
         0x0 corresponds to revision 0
        */
        alias Variant = BitField!(23, 20, Mutability.r);

        /*********************************************************************
         Constant that defines the architecture of the processor:
         0xC corresponds to ARMv6-M architecture
        */
        alias Constant = BitField!(19, 16, Mutability.r);

        /*********************************************************************
         Part number of the processor: 0xC20 corresponds to Cortex-
        */
        alias Partno = BitField!(15, 4, Mutability.r);

        /*********************************************************************
         Revision number, the p value in the rnpn product revision identifier:
         0x0 corresponds to patch 0M
        */
        alias Revision = BitField!(3, 0, Mutability.r);
    }

    /*************************************************************************
     Interrupt Control and State Register
    */
    final abstract class ICSR : Register!(0x04)
    {
        /*********************************************************************
         NMI set-pending bit.
         Write:
          0 = no effect1 = changes NMI exception state to pending.
         Read:
          0 = NMI exception is not pending
          1 = NMI exception is pending.
         Because NMI is the highest-priority exception, normally the processor
         enters the NMI exception handler as soon as it detects a write of 1 to
         this bit. Entering the handler then clears this bit to 0. This means a
         read of this bit by the NMI exception handler returns 1 only if the
         NMI signal is reasserted while the processor is executing that handler.
        */
        alias NMIPENDSET = Bit!(31, Mutability.rw);

        /*********************************************************************
         PendSV set-pending bit.
         Write:
          0 = no effect1 = changes PendSV exception state to pending.
         Read:
          0 = PendSV exception is not pending
          1 = PendSV exception is pending.
         Writing 1 to this bit is the only way to set the PendSV exception
         state to pending.
        */
        alias PENDSVSET = Bit!(28, Mutability.rw);

        /*********************************************************************
         PendSV clear-pending bit.
         Write:
          0 = no effect1 = removes the pending state from the PendSV exception
        */
        alias PENDSVCLR = Bit!(27, Mutability.w);

        /*********************************************************************
         SysTick exception set-pending bit.
         Write:
          0 = no effect1 = changes SysTick exception state to pending.
         Read:
          0 = SysTick exception is not pending
          1 = SysTick exception is pending.
         If your device does not implement the SysTick timer, this bit is
         Reserved.
        */
        alias PENDSTSET = Bit!(26, Mutability.rw);

        /*********************************************************************
         Interrupt pending flag, excluding NMI and Faults:
         0 = interrupt not pending1 = interrupt pending.
        */
        alias ISRPENDING = Bit!(22, Mutability.r);

        /*********************************************************************
         Indicates the exception number of the highest priority pending
         enabled exception:
         0 = no pending exceptions
         Nonzero = the exception number of the highest priority pending enabled
         exception.
        */
        alias VECTPENDING = Bit!(22, Mutability.r);

        /*********************************************************************
         Contains the active exception number:
         0 = Thread mode
         Nonzero = The exception number[a] of the currently active exception.
         Note
         Subtract 16 from this value to obtain the CMSIS IRQ number that
         identifies the corresponding bit in the Interrupt Clear-Enable,
         Set-Enable, Clear-Pending, Set-pending, and Priority Register.

         This is the same value as IPSR bits[5:0]
        */
        alias VECTACTIVE = BitField!(5, 0, Mutability.r);
    }

    /*************************************************************************
     Application Interrupt and Reset Control Register

     The AIRCR provides endian status for data accesses and reset control of
     the system. 

     To write to this register, you must write 0x05FA to the VECTKEY field,
     otherwise the processor ignores the write. 
    */
    final abstract class AIRCR : Register!(0x0C)
    {
        /*********************************************************************
         On writes, write 0x05FA to VECTKEY, otherwise the write is ignored.
        */
        alias VECTKEY = BitField!(31, 16, Mutability.w);

        /*********************************************************************
         Data endianness implemented:
         0 = Little-endian
         1 = Big-endian.
        */
        alias ENDIANESS = Bit!(15, Mutability.r);

        /*********************************************************************
         System reset request:
         0 = no effect
         1 = requests a system level reset.
         This bit reads as 0.
        */
        alias SYSRESETREQ = Bit!(2, Mutability.w);

        /*********************************************************************
         Reserved for debug use. This bit reads as 0. When writing to the
         register you must write 0 to this bit, otherwise behavior is
         Unpredictable.
        */
        alias VECTCLRACTIVE = Bit!(1, Mutability.w);
    }

    /*************************************************************************
     System Control Register
     The SCR controls features of entry to and exit from low power state.
    */
    final abstract class SCR : Register!(0x10)
    {
        /*********************************************************************
         Send Event on Pending bit:
         0 = only enabled interrupts or events can wakeup the processor,
         disabled interrupts are excluded1 = enabled events and all interrupts,
         including disabled interrupts, can wakeup the processor.

         When an event or interrupt enters pending state, the event signal wakes
         up the processor from WFE. If the processor is not waiting for an event,
         the event is registered and affects the next WFE.

         The processor also wakes up on execution of an SEV instruction or an
         external event.
        */
        alias SEVONPEND = Bit!(4, Mutability.rw);

        /*********************************************************************
         Controls whether the processor uses sleep or deep sleep as its low
         power mode:
         0 = sleep
         1 = deep sleep.

         If your device does not support two sleep modes, the effect of
         changing the value of this bit is implementation-defined.
        */
        alias SLEEPDEEP = Bit!(2, Mutability.rw);

        /*********************************************************************
         Indicates sleep-on-exit when returning from Handler mode to Thread
         mode:

         0 = do not sleep when returning to Thread mode.
         1 = enter sleep, or deep sleep, on return from an ISR to Thread mode.

         Setting this bit to 1 enables an interrupt driven application to avoid
         returning to an empty main application.
        */
        alias SLEEPONEXIT = Bit!(1, Mutability.rw);
    }

    /*************************************************************************
     Configuration and Control Register

     The CCR is a read-only register and indicates some aspects of the behavior
     of the Cortex-M0 processor.
    */
    final abstract class CCR : Register!(0x14)
    {
        /*********************************************************************
         Always reads as one, indicates 8-byte stack alignment on exception
         entry.

         On exception entry, the processor uses bit[9] of the stacked PSR to
         indicate the stack alignment. On return from the exception it uses
         this stacked bit to restore the correct stack alignment.
        */
        alias STKALIGN = Bit!(9, Mutability.r);

        /*********************************************************************
         Always reads as one, indicates that all unaligned accesses generate a
         HardFault.
        */
        alias UNALIGN_TRP = Bit!(3, Mutability.r);
    }

    /*************************************************************************
     System Handler Priority Register

     Each PRI_N field is 8 bits wide, but the processor implements only
     bits[7:6] of each field, and bits[5:0] read as zero and ignore writes.
    */
    final abstract class SHPR2 : Register!(0x1C)
    {
        /*********************************************************************
         Priority of system handler 11, SVCall
        */
        alias PRI_11 = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     System Handler Priority Register

     Each PRI_N field is 8 bits wide, but the processor implements only
     bits[7:6] of each field, and bits[5:0] read as zero and ignore writes.
    */
    final abstract class SHPR3 : Register!(0x20)
    {
        /*********************************************************************
         Priority of system handler 15, SysTick
        */
        alias PRI_15 = BitField!(31, 24, Mutability.rw);

        /*********************************************************************
         Priority of system handler 14, PendSV
        */
        alias PRI_14 = BitField!(23, 16, Mutability.rw);
    }
}
