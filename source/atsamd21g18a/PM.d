module atsamd21g18a.pm;

import mvf.mmio;

/*****************************************************************************
 Power Manager
*/
final abstract class PM : Peripheral!(0x40000400)
{
    /*************************************************************************
     Control
    */
    final abstract class CTRL : Register!(00)
    {
    }

    /*************************************************************************
     Sleep Mode
    */
    final abstract class SLEEP : Register!(0x1)
    {
        /*****************************************************************
         IDLE's possible values
        */
        enum IDLEValues
        {
            /*************************************************************
             The CPU clock domain is stopped
            */
            CPU = 0x0,

            /*************************************************************
             The CPU and AHB clock domains are stopped
            */
            AHB = 0x1,

            /*************************************************************
             The CPU, AHB and APB clock domains are stopped
            */
            APB = 0x2,
        }

        /*********************************************************************
         Idle Mode Configuration
        */
        alias IDLE = BitField!(1, 0, Mutability.rw, IDLEValues);
    }

    /*************************************************************************
     CPU Clock Select
    */
    final abstract class CPUSEL : Register!(0x8)
    {
        /*****************************************************************
         CPUDIV's possible values
        */
        enum CPUDIVValues
        {
            /*************************************************************
             Divide by 1
            */
            DIV1 = 0x0,

            /*************************************************************
             Divide by 2
            */
            DIV2 = 0x1,

            /*************************************************************
             Divide by 4
            */
            DIV4 = 0x2,

            /*************************************************************
             Divide by 8
            */
            DIV8 = 0x3,

            /*************************************************************
             Divide by 16
            */
            DIV16 = 0x4,

            /*************************************************************
             Divide by 32
            */
            DIV32 = 0x5,

            /*************************************************************
             Divide by 64
            */
            DIV64 = 0x6,

            /*************************************************************
             Divide by 128
            */
            DIV128 = 0x7,
        }

        /*********************************************************************
         CPU Prescaler Selection
        */
        alias CPUDIV = BitField!(2, 0, Mutability.rw, CPUDIVValues);
    }

    /*************************************************************************
     APBA Clock Select
    */
    final abstract class APBASEL : Register!(0x9)
    {
        /*****************************************************************
         APBADIV's possible values
        */
        enum APBADIVValues
        {
            /*************************************************************
             Divide by 1
            */
            DIV1 = 0x0,

            /*************************************************************
             Divide by 2
            */
            DIV2 = 0x1,

            /*************************************************************
             Divide by 4
            */
            DIV4 = 0x2,

            /*************************************************************
             Divide by 8
            */
            DIV8 = 0x3,

            /*************************************************************
             Divide by 16
            */
            DIV16 = 0x4,

            /*************************************************************
             Divide by 32
            */
            DIV32 = 0x5,

            /*************************************************************
             Divide by 64
            */
            DIV64 = 0x6,

            /*************************************************************
             Divide by 128
            */
            DIV128 = 0x7,
        }

        /*********************************************************************
         APBA Prescaler Selection
        */
        alias APBADIV = BitField!(2, 0, Mutability.rw, APBADIVValues);
    }

    /*************************************************************************
     APBB Clock Select
    */
    final abstract class APBBSEL : Register!(0xa)
    {
        /*****************************************************************
         APBBDIV's possible values
        */
        enum APBBDIVValues
        {
            /*************************************************************
             Divide by 1
            */
            DIV1 = 0x0,

            /*************************************************************
             Divide by 2
            */
            DIV2 = 0x1,

            /*************************************************************
             Divide by 4
            */
            DIV4 = 0x2,

            /*************************************************************
             Divide by 8
            */
            DIV8 = 0x3,

            /*************************************************************
             Divide by 16
            */
            DIV16 = 0x4,

            /*************************************************************
             Divide by 32
            */
            DIV32 = 0x5,

            /*************************************************************
             Divide by 64
            */
            DIV64 = 0x6,

            /*************************************************************
             Divide by 128
            */
            DIV128 = 0x7,
        }

        /*********************************************************************
         APBB Prescaler Selection
        */
        alias APBBDIV = BitField!(2, 0, Mutability.rw, APBBDIVValues);
    }

    /*************************************************************************
     APBC Clock Select
    */
    final abstract class APBCSEL : Register!(0xb)
    {
        /*****************************************************************
         APBCDIV's possible values
        */
        enum APBCDIVValues
        {
            /*************************************************************
             Divide by 1
            */
            DIV1 = 0x0,

            /*************************************************************
             Divide by 2
            */
            DIV2 = 0x1,

            /*************************************************************
             Divide by 4
            */
            DIV4 = 0x2,

            /*************************************************************
             Divide by 8
            */
            DIV8 = 0x3,

            /*************************************************************
             Divide by 16
            */
            DIV16 = 0x4,

            /*************************************************************
             Divide by 32
            */
            DIV32 = 0x5,

            /*************************************************************
             Divide by 64
            */
            DIV64 = 0x6,

            /*************************************************************
             Divide by 128
            */
            DIV128 = 0x7,
        }

        /*********************************************************************
         APBC Prescaler Selection
        */
        alias APBCDIV = BitField!(2, 0, Mutability.rw, APBCDIVValues);
    }

    /*************************************************************************
     AHB Mask
    */
    final abstract class AHBMASK : Register!(0x14)
    {
        /*********************************************************************
         HPB0 AHB Clock Mask
        */
        alias HPB0_ = Bit!(0, Mutability.rw);

        /*********************************************************************
         HPB1 AHB Clock Mask
        */
        alias HPB1_ = Bit!(1, Mutability.rw);

        /*********************************************************************
         HPB2 AHB Clock Mask
        */
        alias HPB2_ = Bit!(2, Mutability.rw);

        /*********************************************************************
         DSU AHB Clock Mask
        */
        alias DSU_ = Bit!(3, Mutability.rw);

        /*********************************************************************
         NVMCTRL AHB Clock Mask
        */
        alias NVMCTRL_ = Bit!(4, Mutability.rw);

        /*********************************************************************
         DMAC AHB Clock Mask
        */
        alias DMAC_ = Bit!(5, Mutability.rw);

        /*********************************************************************
         USB AHB Clock Mask
        */
        alias USB_ = Bit!(6, Mutability.rw);
    }

    /*************************************************************************
     APBA Mask
    */
    final abstract class APBAMASK : Register!(0x18)
    {
        /*********************************************************************
         PAC0 APB Clock Enable
        */
        alias PAC0_ = Bit!(0, Mutability.rw);

        /*********************************************************************
         PM APB Clock Enable
        */
        alias PM_ = Bit!(1, Mutability.rw);

        /*********************************************************************
         SYSCTRL APB Clock Enable
        */
        alias SYSCTRL_ = Bit!(2, Mutability.rw);

        /*********************************************************************
         GCLK APB Clock Enable
        */
        alias GCLK_ = Bit!(3, Mutability.rw);

        /*********************************************************************
         WDT APB Clock Enable
        */
        alias WDT_ = Bit!(4, Mutability.rw);

        /*********************************************************************
         RTC APB Clock Enable
        */
        alias RTC_ = Bit!(5, Mutability.rw);

        /*********************************************************************
         EIC APB Clock Enable
        */
        alias EIC_ = Bit!(6, Mutability.rw);
    }

    /*************************************************************************
     APBB Mask
    */
    final abstract class APBBMASK : Register!(0x1c)
    {
        /*********************************************************************
         PAC1 APB Clock Enable
        */
        alias PAC1_ = Bit!(0, Mutability.rw);

        /*********************************************************************
         DSU APB Clock Enable
        */
        alias DSU_ = Bit!(1, Mutability.rw);

        /*********************************************************************
         NVMCTRL APB Clock Enable
        */
        alias NVMCTRL_ = Bit!(2, Mutability.rw);

        /*********************************************************************
         PORT APB Clock Enable
        */
        alias PORT_ = Bit!(3, Mutability.rw);

        /*********************************************************************
         DMAC APB Clock Enable
        */
        alias DMAC_ = Bit!(4, Mutability.rw);

        /*********************************************************************
         USB APB Clock Enable
        */
        alias USB_ = Bit!(5, Mutability.rw);

        /*********************************************************************
         HMATRIX APB Clock Enable
        */
        alias HMATRIX_ = Bit!(6, Mutability.rw);
    }

    /*************************************************************************
     APBC Mask
    */
    final abstract class APBCMASK : Register!(0x20)
    {
        /*********************************************************************
         PAC2 APB Clock Enable
        */
        alias PAC2_ = Bit!(0, Mutability.rw);

        /*********************************************************************
         EVSYS APB Clock Enable
        */
        alias EVSYS_ = Bit!(1, Mutability.rw);

        /*********************************************************************
         SERCOM0 APB Clock Enable
        */
        alias SERCOM0_ = Bit!(2, Mutability.rw);

        /*********************************************************************
         SERCOM1 APB Clock Enable
        */
        alias SERCOM1_ = Bit!(3, Mutability.rw);

        /*********************************************************************
         SERCOM2 APB Clock Enable
        */
        alias SERCOM2_ = Bit!(4, Mutability.rw);

        /*********************************************************************
         SERCOM3 APB Clock Enable
        */
        alias SERCOM3_ = Bit!(5, Mutability.rw);

        /*********************************************************************
         SERCOM4 APB Clock Enable
        */
        alias SERCOM4_ = Bit!(6, Mutability.rw);

        /*********************************************************************
         SERCOM5 APB Clock Enable
        */
        alias SERCOM5_ = Bit!(7, Mutability.rw);

        /*********************************************************************
         TCC0 APB Clock Enable
        */
        alias TCC0_ = Bit!(8, Mutability.rw);

        /*********************************************************************
         TCC1 APB Clock Enable
        */
        alias TCC1_ = Bit!(9, Mutability.rw);

        /*********************************************************************
         TCC2 APB Clock Enable
        */
        alias TCC2_ = Bit!(10, Mutability.rw);

        /*********************************************************************
         TC3 APB Clock Enable
        */
        alias TC3_ = Bit!(11, Mutability.rw);

        /*********************************************************************
         TC4 APB Clock Enable
        */
        alias TC4_ = Bit!(12, Mutability.rw);

        /*********************************************************************
         TC5 APB Clock Enable
        */
        alias TC5_ = Bit!(13, Mutability.rw);

        /*********************************************************************
         ADC APB Clock Enable
        */
        alias ADC_ = Bit!(16, Mutability.rw);

        /*********************************************************************
         AC APB Clock Enable
        */
        alias AC_ = Bit!(17, Mutability.rw);

        /*********************************************************************
         DAC APB Clock Enable
        */
        alias DAC_ = Bit!(18, Mutability.rw);

        /*********************************************************************
         PTC APB Clock Enable
        */
        alias PTC_ = Bit!(19, Mutability.rw);

        /*********************************************************************
         I2S APB Clock Enable
        */
        alias I2S_ = Bit!(20, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Enable Clear
    */
    final abstract class INTENCLR : Register!(0x34)
    {
        /*********************************************************************
         Clock Ready Interrupt Enable
        */
        alias CKRDY = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Enable Set
    */
    final abstract class INTENSET : Register!(0x35)
    {
        /*********************************************************************
         Clock Ready Interrupt Enable
        */
        alias CKRDY = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Flag Status and Clear
    */
    final abstract class INTFLAG : Register!(0x36)
    {
        /*********************************************************************
         Clock Ready
        */
        alias CKRDY = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Reset Cause
    */
    final abstract class RCAUSE : Register!(0x38)
    {
        /*********************************************************************
         Power On Reset
        */
        alias POR = Bit!(0, Mutability.rw);

        /*********************************************************************
         Brown Out 12 Detector Reset
        */
        alias BOD12 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Brown Out 33 Detector Reset
        */
        alias BOD33 = Bit!(2, Mutability.rw);

        /*********************************************************************
         External Reset
        */
        alias EXT = Bit!(4, Mutability.rw);

        /*********************************************************************
         Watchdog Reset
        */
        alias WDT = Bit!(5, Mutability.rw);

        /*********************************************************************
         System Reset Request
        */
        alias SYST = Bit!(6, Mutability.rw);
    }
}
