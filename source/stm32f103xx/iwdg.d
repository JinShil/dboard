module stm32f103xx.iwdg;

import stm32f103xx.mmio;

/*****************************************************************************
 Independent watchdog
*/
final abstract class IWDG : Peripheral!(0x40003000)
{
    /*************************************************************************
     Key register (IWDG_KR)
    */
    final abstract class KR : Register!(00)
    {
        /*********************************************************************
         Key value
        */
        alias KEY = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     Prescaler register (IWDG_PR)
    */
    final abstract class PR : Register!(0x4)
    {
        /*********************************************************************
         Prescaler divider
        */
        alias PR = BitField!(2, 0, Mutability.rw);
    }

    /*************************************************************************
     Reload register (IWDG_RLR)
    */
    final abstract class RLR : Register!(0x8)
    {
        /*********************************************************************
         Watchdog counter reload value
        */
        alias RL = BitField!(11, 0, Mutability.rw);
    }

    /*************************************************************************
     Status register (IWDG_SR)
    */
    final abstract class SR : Register!(0xc)
    {
        /*********************************************************************
         Watchdog prescaler value update
        */
        alias PVU = Bit!(0, Mutability.rw);

        /*********************************************************************
         Watchdog counter reload value update
        */
        alias RVU = Bit!(1, Mutability.rw);
    }
}
