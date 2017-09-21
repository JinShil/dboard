module atsamd21g18a.nvmcal;

import mvf.mmio;

/*****************************************************************************
 Non-Volatile Memory Calibration Data
 See 9.3.2 NVM Software Calibration Area Mapping
*/
final abstract class NVMCAL : Peripheral!(0x0080_0000)
{
    /*************************************************************************
     NVM Software Calibration Area Byte 2
    */
    final abstract class CAL2 : Register!(0x6020 + 2)
    {
        private enum BIT_OFFSET = 16;

        /*********************************************************************
         ADC Linearity Calibration.  Should be written to CALIB register.
        */
        alias ADC_LINEARITY = BitField!(34 - BIT_OFFSET, 27 - BIT_OFFSET, Mutability.r);
    }

    /*************************************************************************
     NVM Software Calibration Area Byte 4
    */
    final abstract class CAL4 : Register!(0x6020 + 4)
    {
        private enum BIT_OFFSET = 32;

        /*********************************************************************
         ADC Bias Calibration.  Should be written to CALIB register.
        */
        alias ADC_BIASCAL = BitField!(37 - BIT_OFFSET, 35 - BIT_OFFSET, Mutability.r);

        /*********************************************************************
         OSC32KCalibration. Should be written to OSC32K register.
        */
        alias OSC32K_CAL = BitField!(44 - BIT_OFFSET, 38 - BIT_OFFSET, Mutability.r);

        /*********************************************************************
         USB TRANSN calibration value. Should be written to PADCAL register.
        */
        alias USB_TRANSN = BitField!(49 - BIT_OFFSET, 45 - BIT_OFFSET, Mutability.r);

        /*********************************************************************
         USB TRANSP calibration value. Should be written to PADCAL register.
        */
        alias USB_TRANSP = BitField!(54 - BIT_OFFSET, 50 - BIT_OFFSET, Mutability.r);

        /*********************************************************************
         USB TRIM calibration value. Should be written to the PADCAL register.
        */
        alias USB_TRIM = BitField!(57 - BIT_OFFSET, 55 - BIT_OFFSET, Mutability.r);

        /*********************************************************************
         DFLL48M Coarse calibration value. Should be written to DFLLVAL
         register.
        */
        alias DFLL48M_COARSE_CAL = BitField!(63 - BIT_OFFSET, 58 - BIT_OFFSET, Mutability.r);
    }

    /*************************************************************************
     NVM Software Calibration Area Byte 8
    */
    final abstract class CAL8 : Register!(0x6020 + 8)
    {
        private enum BIT_OFFSET = 64;

        /*********************************************************************
         DFLL48M Coarse calibration value. Should be written to DFLLVAL
         register.
        */
        alias DFLL48M_FINE_CAL = BitField!(73 - BIT_OFFSET, 64 - BIT_OFFSET, Mutability.r);
    }
}