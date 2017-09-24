module arm.nvic;

import mvf.mmio;

 alias SymbolList(TList...) = TList; 

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

    /*************************************************************************
     Interrupt Priority Registers.  Sets or reads interrupt priorities.
    */
    alias IPR = SymbolList!
    (
          IPR0.PRI0, IPR0.PRI1, IPR0.PRI2, IPR0.PRI3
        , IPR1.PRI0, IPR1.PRI1, IPR1.PRI2, IPR1.PRI3
        , IPR2.PRI0, IPR2.PRI1, IPR2.PRI2, IPR2.PRI3
        , IPR3.PRI0, IPR3.PRI1, IPR3.PRI2, IPR3.PRI3
        , IPR4.PRI0, IPR4.PRI1, IPR4.PRI2, IPR4.PRI3
        , IPR5.PRI0, IPR5.PRI1, IPR5.PRI2, IPR5.PRI3
        , IPR6.PRI0, IPR6.PRI1, IPR6.PRI2, IPR6.PRI3
        , IPR7.PRI0, IPR7.PRI1, IPR7.PRI2, IPR7.PRI3
    );

    private alias IPR0 = IPRTemplate!0;
    private alias IPR1 = IPRTemplate!1;
    private alias IPR2 = IPRTemplate!2;
    private alias IPR3 = IPRTemplate!3;
    private alias IPR4 = IPRTemplate!4;
    private alias IPR5 = IPRTemplate!5;
    private alias IPR6 = IPRTemplate!6;
    private alias IPR7 = IPRTemplate!7;

    private final abstract class IPRTemplate(int bank) : Register!(0x300 + bank * 4)
    {
        /*********************************************************************
         Priority of interrupt number 0
        */
        alias PRI0 = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         Priority of interrupt number 1
        */
        alias PRI1 = BitField!(15, 14, Mutability.rw);

        /*********************************************************************
         Priority of interrupt number 2
        */
        alias PRI2 = BitField!(23, 22, Mutability.rw);

        /*********************************************************************
         Priority of interrupt number 3
        */
        alias PRI3 = BitField!(31, 30, Mutability.rw);
    }
}