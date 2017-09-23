module source.arm.scb;

import mvf.mmio;

/*****************************************************************************
 Nested Vector Interrupt Controller
*/
final abstract class NVIC : Peripheral!(0xE000E100)
{
    /*************************************************************************
     Interrupt Set-Enable Register.  Enables, or reads the enabled state of
     one or more interrupts.
    */
    final abstract class ISER : Register!(0x00)
    {
        /*********************************************************************
         Enables, or reads the enabled state of one or more interrupts. Each
         bit corresponds to the same numbered interrupt:
         On reads 
            0 the associated interrupt is disabled.
            1 the associated interrupt is enabled.
         On writes
            0 no effect.
            1 enable the associated interrupt.
        */
        alias SETENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear Enable Register,  Disables, or reads the enabled state of
     one or more interrupts.
    */
    final abstract class ICER : Register!(0x80)
    {
        /*********************************************************************
         Disables, or reads the enabled state of one or more interrupts. Each
         bit corresponds to the same numbered interrupt:
         On reads 
            0 the associated interrupt is disabled.
            1 the associated interrupt is enabled.
         On writes
            0 no effect.
            1 disable the associated interrupt.
        */
        alias CLRENA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Set-Pending Register,  On writes, sets the status of one or
     more interrupts to pending. On reads, shows the pending status of the
     interrupts.
    */
    final abstract class ISPR : Register!(0x100)
    {
        /*********************************************************************
         Changes the state of one or more interrupts to pending. Each bit
         corresponds to the same numbered interrupt:
         On reads
            0 the associated interrupt is not pending.
            1 the associated interrupt is pending.
         On writes
            0 no effect.
            1 change the state of the associated interrupt to pending.
        */
        alias SETPEND = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Clear-Pending Register,  On writes, clears the status of one or
     more interrupts to pending. On reads, shows the pending status of the
     interrupts.
    */
    final abstract class ICPR : Register!(0x180)
    {
        /*********************************************************************
         Changes the state of one or more interrupts to not pending. Each bit
         corresponds to the same numbered interrupt:
         On reads
            0 the associated interrupt is not pending.
            1 the associated interrupt is pending.
         On writes
            0 no effect.
            1 change the state of the associated interrupt to not pending.
        */
        alias CLRPEND = BitField!(31, 0, Mutability.rw);
    }

    //TODO: Inte3rrupt Priority Registers
}