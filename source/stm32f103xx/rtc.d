module stm32f103xx.rtc;

import stm32f103xx.mmio;

/*****************************************************************************
 Real time clock
*/
final abstract class RTC : Peripheral!(0x40002800)
{
    /*************************************************************************
     RTC Control Register High
    */
    final abstract class CRH : Register!(00)
    {
        /*********************************************************************
         Second interrupt Enable
        */
        alias SECIE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Alarm interrupt Enable
        */
        alias ALRIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Overflow interrupt Enable
        */
        alias OWIE = Bit!(2, Mutability.rw);
    }

    /*************************************************************************
     RTC Control Register Low
    */
    final abstract class CRL : Register!(0x4)
    {
        /*********************************************************************
         Second Flag
        */
        alias SECF = Bit!(0, Mutability.rw);

        /*********************************************************************
         Alarm Flag
        */
        alias ALRF = Bit!(1, Mutability.rw);

        /*********************************************************************
         Overflow Flag
        */
        alias OWF = Bit!(2, Mutability.rw);

        /*********************************************************************
         Registers Synchronized Flag
        */
        alias RSF = Bit!(3, Mutability.rw);

        /*********************************************************************
         Configuration Flag
        */
        alias CNF = Bit!(4, Mutability.rw);

        /*********************************************************************
         RTC operation OFF
        */
        alias RTOFF = Bit!(5, Mutability.r);
    }

    /*************************************************************************
     RTC Prescaler Load Register High
    */
    final abstract class PRLH : Register!(0x8)
    {
        /*********************************************************************
         RTC Prescaler Load Register High
        */
        alias PRLH = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Prescaler Load Register Low
    */
    final abstract class PRLL : Register!(0xc)
    {
        /*********************************************************************
         RTC Prescaler Divider Register Low
        */
        alias PRLL = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Prescaler Divider Register High
    */
    final abstract class DIVH : Register!(0x10)
    {
        /*********************************************************************
         RTC prescaler divider register high
        */
        alias DIVH = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Prescaler Divider Register Low
    */
    final abstract class DIVL : Register!(0x14)
    {
        /*********************************************************************
         RTC prescaler divider register Low
        */
        alias DIVL = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Counter Register High
    */
    final abstract class CNTH : Register!(0x18)
    {
        /*********************************************************************
         RTC counter register high
        */
        alias CNTH = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Counter Register Low
    */
    final abstract class CNTL : Register!(0x1c)
    {
        /*********************************************************************
         RTC counter register Low
        */
        alias CNTL = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Alarm Register High
    */
    final abstract class ALRH : Register!(0x20)
    {
        /*********************************************************************
         RTC alarm register high
        */
        alias ALRH = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     RTC Alarm Register Low
    */
    final abstract class ALRL : Register!(0x24)
    {
        /*********************************************************************
         RTC alarm register low
        */
        alias ALRL = BitField!(15, 0, Mutability.rw);
    }
}
