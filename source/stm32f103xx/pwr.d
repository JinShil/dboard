module stm32f103xx.pwr;

import stm32f103xx.mmio;

/*****************************************************************************
 Power control
*/
final abstract class PWR : Peripheral!(0x40007000)
{
    /*************************************************************************
     Power control register (PWR_CR)
    */
    final abstract class CR : Register!(00)
    {
        /*********************************************************************
         Low Power Deep Sleep
        */
        alias LPDS = Bit!(0, Mutability.rw);

        /*********************************************************************
         Power Down Deep Sleep
        */
        alias PDDS = Bit!(1, Mutability.rw);

        /*********************************************************************
         Clear Wake-up Flag
        */
        alias CWUF = Bit!(2, Mutability.rw);

        /*********************************************************************
         Clear STANDBY Flag
        */
        alias CSBF = Bit!(3, Mutability.rw);

        /*********************************************************************
         Power Voltage Detector Enable
        */
        alias PVDE = Bit!(4, Mutability.rw);

        /*********************************************************************
         PVD Level Selection
        */
        alias PLS = BitField!(7, 5, Mutability.rw);

        /*********************************************************************
         Disable Backup Domain write protection
        */
        alias DBP = Bit!(8, Mutability.rw);
    }

    /*************************************************************************
     Power control register (PWR_CR)
    */
    final abstract class CSR : Register!(0x4)
    {
        /*********************************************************************
         Wake-Up Flag
        */
        alias WUF = Bit!(0, Mutability.r);

        /*********************************************************************
         STANDBY Flag
        */
        alias SBF = Bit!(1, Mutability.r);

        /*********************************************************************
         PVD Output
        */
        alias PVDO = Bit!(2, Mutability.r);

        /*********************************************************************
         Enable WKUP pin
        */
        alias EWUP = Bit!(8, Mutability.rw);
    }
}
