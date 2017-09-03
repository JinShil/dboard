module atsamd21g18a.tcc0;

import mvf.mmio;

/*****************************************************************************
 Timer Counter Control 0
*/
final abstract class TCC0 : Peripheral!(0x42002000)
{
    /*************************************************************************
     Control A
    */
    final abstract class CTRLA : Register!(00)
    {
        /*********************************************************************
         Software Reset
        */
        alias SWRST = Bit!(0, Mutability.rw);

        /*********************************************************************
         Enable
        */
        alias ENABLE = Bit!(1, Mutability.rw);

        /*****************************************************************
         RESOLUTION's possible values
        */
        enum RESOLUTIONValues
        {
            /*************************************************************
             Dithering is disabled
            */
            NONE = 0x0,

            /*************************************************************
             Dithering is done every 16 PWM frames
            */
            DITH4 = 0x1,

            /*************************************************************
             Dithering is done every 32 PWM frames
            */
            DITH5 = 0x2,

            /*************************************************************
             Dithering is done every 64 PWM frames
            */
            DITH6 = 0x3,
        }

        /*********************************************************************
         Enhanced Resolution
        */
        alias RESOLUTION = BitField!(6, 5, Mutability.rw, RESOLUTIONValues);

        /*****************************************************************
         PRESCALER's possible values
        */
        enum PRESCALERValues
        {
            /*************************************************************
             No division
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
             Divide by 64
            */
            DIV64 = 0x5,

            /*************************************************************
             Divide by 256
            */
            DIV256 = 0x6,

            /*************************************************************
             Divide by 1024
            */
            DIV1024 = 0x7,
        }

        /*********************************************************************
         Prescaler
        */
        alias PRESCALER = BitField!(10, 8, Mutability.rw, PRESCALERValues);

        /*********************************************************************
         Run in Standby
        */
        alias RUNSTDBY = Bit!(11, Mutability.rw);

        /*****************************************************************
         PRESCSYNC's possible values
        */
        enum PRESCSYNCValues
        {
            /*************************************************************
             Reload or reset counter on next GCLK
            */
            GCLK = 0x0,

            /*************************************************************
             Reload or reset counter on next prescaler clock
            */
            PRESC = 0x1,

            /*************************************************************
             Reload or reset counter on next GCLK and reset prescaler counter
            */
            RESYNC = 0x2,
        }

        /*********************************************************************
         Prescaler and Counter Synchronization Selection
        */
        alias PRESCSYNC = BitField!(13, 12, Mutability.rw, PRESCSYNCValues);

        /*********************************************************************
         Auto Lock
        */
        alias ALOCK = Bit!(14, Mutability.rw);

        /*********************************************************************
         Capture Channel 0 Enable
        */
        alias CPTEN0 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Capture Channel 1 Enable
        */
        alias CPTEN1 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Capture Channel 2 Enable
        */
        alias CPTEN2 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Capture Channel 3 Enable
        */
        alias CPTEN3 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     Control B Clear
    */
    final abstract class CTRLBCLR : Register!(0x4)
    {
        /*********************************************************************
         Counter Direction
        */
        alias DIR = Bit!(0, Mutability.rw);

        /*********************************************************************
         Lock Update
        */
        alias LUPD = Bit!(1, Mutability.rw);

        /*********************************************************************
         One-Shot
        */
        alias ONESHOT = Bit!(2, Mutability.rw);

        /*****************************************************************
         IDXCMD's possible values
        */
        enum IDXCMDValues
        {
            /*************************************************************
             Command disabled: Index toggles between cycles A and B
            */
            DISABLE = 0x0,

            /*************************************************************
             Set index: cycle B will be forced in the next cycle
            */
            SET = 0x1,

            /*************************************************************
             Clear index: cycle A will be forced in the next cycle
            */
            CLEAR = 0x2,

            /*************************************************************
             Hold index: the next cycle will be the same as the current cycle
            */
            HOLD = 0x3,
        }

        /*********************************************************************
         Ramp Index Command
        */
        alias IDXCMD = BitField!(4, 3, Mutability.rw, IDXCMDValues);

        /*****************************************************************
         CMD's possible values
        */
        enum CMDValues
        {
            /*************************************************************
             No action
            */
            NONE = 0x0,

            /*************************************************************
             Clear start, restart or retrigger
            */
            RETRIGGER = 0x1,

            /*************************************************************
             Force stop
            */
            STOP = 0x2,

            /*************************************************************
             Force update of double buffered registers
            */
            UPDATE = 0x3,

            /*************************************************************
             Force COUNT read synchronization
            */
            READSYNC = 0x4,
        }

        /*********************************************************************
         TCC Command
        */
        alias CMD = BitField!(7, 5, Mutability.rw, CMDValues);
    }

    /*************************************************************************
     Control B Set
    */
    final abstract class CTRLBSET : Register!(0x5)
    {
        /*********************************************************************
         Counter Direction
        */
        alias DIR = Bit!(0, Mutability.rw);

        /*********************************************************************
         Lock Update
        */
        alias LUPD = Bit!(1, Mutability.rw);

        /*********************************************************************
         One-Shot
        */
        alias ONESHOT = Bit!(2, Mutability.rw);

        /*****************************************************************
         IDXCMD's possible values
        */
        enum IDXCMDValues
        {
            /*************************************************************
             Command disabled: Index toggles between cycles A and B
            */
            DISABLE = 0x0,

            /*************************************************************
             Set index: cycle B will be forced in the next cycle
            */
            SET = 0x1,

            /*************************************************************
             Clear index: cycle A will be forced in the next cycle
            */
            CLEAR = 0x2,

            /*************************************************************
             Hold index: the next cycle will be the same as the current cycle
            */
            HOLD = 0x3,
        }

        /*********************************************************************
         Ramp Index Command
        */
        alias IDXCMD = BitField!(4, 3, Mutability.rw, IDXCMDValues);

        /*****************************************************************
         CMD's possible values
        */
        enum CMDValues
        {
            /*************************************************************
             No action
            */
            NONE = 0x0,

            /*************************************************************
             Clear start, restart or retrigger
            */
            RETRIGGER = 0x1,

            /*************************************************************
             Force stop
            */
            STOP = 0x2,

            /*************************************************************
             Force update of double buffered registers
            */
            UPDATE = 0x3,

            /*************************************************************
             Force COUNT read synchronization
            */
            READSYNC = 0x4,
        }

        /*********************************************************************
         TCC Command
        */
        alias CMD = BitField!(7, 5, Mutability.rw, CMDValues);
    }

    /*************************************************************************
     Synchronization Busy
    */
    final abstract class SYNCBUSY : Register!(0x8)
    {
        /*********************************************************************
         Swrst Busy
        */
        alias SWRST = Bit!(0, Mutability.rw);

        /*********************************************************************
         Enable Busy
        */
        alias ENABLE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Ctrlb Busy
        */
        alias CTRLB = Bit!(2, Mutability.rw);

        /*********************************************************************
         Status Busy
        */
        alias STATUS = Bit!(3, Mutability.rw);

        /*********************************************************************
         Count Busy
        */
        alias COUNT = Bit!(4, Mutability.rw);

        /*********************************************************************
         Pattern Busy
        */
        alias PATT = Bit!(5, Mutability.rw);

        /*********************************************************************
         Wave Busy
        */
        alias WAVE = Bit!(6, Mutability.rw);

        /*********************************************************************
         Period busy
        */
        alias PER = Bit!(7, Mutability.rw);

        /*********************************************************************
         Compare Channel 0 Busy
        */
        alias CC0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Compare Channel 1 Busy
        */
        alias CC1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Compare Channel 2 Busy
        */
        alias CC2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Compare Channel 3 Busy
        */
        alias CC3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Pattern Buffer Busy
        */
        alias PATTB = Bit!(16, Mutability.rw);

        /*********************************************************************
         Wave Buffer Busy
        */
        alias WAVEB = Bit!(17, Mutability.rw);

        /*********************************************************************
         Period Buffer Busy
        */
        alias PERB = Bit!(18, Mutability.rw);

        /*********************************************************************
         Compare Channel Buffer 0 Busy
        */
        alias CCB0 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Compare Channel Buffer 1 Busy
        */
        alias CCB1 = Bit!(20, Mutability.rw);

        /*********************************************************************
         Compare Channel Buffer 2 Busy
        */
        alias CCB2 = Bit!(21, Mutability.rw);

        /*********************************************************************
         Compare Channel Buffer 3 Busy
        */
        alias CCB3 = Bit!(22, Mutability.rw);
    }

    /*************************************************************************
     Recoverable Fault A Configuration
    */
    final abstract class FCTRLA : Register!(0xc)
    {
        /*****************************************************************
         SRC's possible values
        */
        enum SRCValues
        {
            /*************************************************************
             Fault input disabled
            */
            DISABLE = 0x0,

            /*************************************************************
             MCEx (x=0,1) event input
            */
            ENABLE = 0x1,

            /*************************************************************
             Inverted MCEx (x=0,1) event input
            */
            INVERT = 0x2,

            /*************************************************************
             Alternate fault (A or B) state at the end of the previous period
            */
            ALTFAULT = 0x3,
        }

        /*********************************************************************
         Fault A Source
        */
        alias SRC = BitField!(1, 0, Mutability.rw, SRCValues);

        /*********************************************************************
         Fault A Keeper
        */
        alias KEEP = Bit!(3, Mutability.rw);

        /*********************************************************************
         Fault A Qualification
        */
        alias QUAL = Bit!(4, Mutability.rw);

        /*****************************************************************
         BLANK's possible values
        */
        enum BLANKValues
        {
            /*************************************************************
             No blanking applied
            */
            NONE = 0x0,

            /*************************************************************
             Blanking applied from rising edge of the output waveform
            */
            RISE = 0x1,

            /*************************************************************
             Blanking applied from falling edge of the output waveform
            */
            FALL = 0x2,

            /*************************************************************
             Blanking applied from each toggle of the output waveform
            */
            BOTH = 0x3,
        }

        /*********************************************************************
         Fault A Blanking Mode
        */
        alias BLANK = BitField!(6, 5, Mutability.rw, BLANKValues);

        /*********************************************************************
         Fault A Restart
        */
        alias RESTART = Bit!(7, Mutability.rw);

        /*****************************************************************
         HALT's possible values
        */
        enum HALTValues
        {
            /*************************************************************
             Halt action disabled
            */
            DISABLE = 0x0,

            /*************************************************************
             Hardware halt action
            */
            HW = 0x1,

            /*************************************************************
             Software halt action
            */
            SW = 0x2,

            /*************************************************************
             Non-recoverable fault
            */
            NR = 0x3,
        }

        /*********************************************************************
         Fault A Halt Mode
        */
        alias HALT = BitField!(9, 8, Mutability.rw, HALTValues);

        /*****************************************************************
         CHSEL's possible values
        */
        enum CHSELValues
        {
            /*************************************************************
             Capture value stored in channel 0
            */
            CC0 = 0x0,

            /*************************************************************
             Capture value stored in channel 1
            */
            CC1 = 0x1,

            /*************************************************************
             Capture value stored in channel 2
            */
            CC2 = 0x2,

            /*************************************************************
             Capture value stored in channel 3
            */
            CC3 = 0x3,
        }

        /*********************************************************************
         Fault A Capture Channel
        */
        alias CHSEL = BitField!(11, 10, Mutability.rw, CHSELValues);

        /*****************************************************************
         CAPTURE's possible values
        */
        enum CAPTUREValues
        {
            /*************************************************************
             No capture
            */
            DISABLE = 0x0,

            /*************************************************************
             Capture on fault
            */
            CAPT = 0x1,

            /*************************************************************
             Minimum capture
            */
            CAPTMIN = 0x2,

            /*************************************************************
             Maximum capture
            */
            CAPTMAX = 0x3,

            /*************************************************************
             Minimum local detection
            */
            LOCMIN = 0x4,

            /*************************************************************
             Maximum local detection
            */
            LOCMAX = 0x5,

            /*************************************************************
             Minimum and maximum local detection
            */
            DERIV0 = 0x6,
        }

        /*********************************************************************
         Fault A Capture Action
        */
        alias CAPTURE = BitField!(14, 12, Mutability.rw, CAPTUREValues);

        /*********************************************************************
         Fault A Blanking Time
        */
        alias BLANKVAL = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Fault A Filter Value
        */
        alias FILTERVAL = BitField!(27, 24, Mutability.rw);
    }

    /*************************************************************************
     Recoverable Fault B Configuration
    */
    final abstract class FCTRLB : Register!(0x10)
    {
        /*****************************************************************
         SRC's possible values
        */
        enum SRCValues
        {
            /*************************************************************
             Fault input disabled
            */
            DISABLE = 0x0,

            /*************************************************************
             MCEx (x=0,1) event input
            */
            ENABLE = 0x1,

            /*************************************************************
             Inverted MCEx (x=0,1) event input
            */
            INVERT = 0x2,

            /*************************************************************
             Alternate fault (A or B) state at the end of the previous period
            */
            ALTFAULT = 0x3,
        }

        /*********************************************************************
         Fault B Source
        */
        alias SRC = BitField!(1, 0, Mutability.rw, SRCValues);

        /*********************************************************************
         Fault B Keeper
        */
        alias KEEP = Bit!(3, Mutability.rw);

        /*********************************************************************
         Fault B Qualification
        */
        alias QUAL = Bit!(4, Mutability.rw);

        /*****************************************************************
         BLANK's possible values
        */
        enum BLANKValues
        {
            /*************************************************************
             No blanking applied
            */
            NONE = 0x0,

            /*************************************************************
             Blanking applied from rising edge of the output waveform
            */
            RISE = 0x1,

            /*************************************************************
             Blanking applied from falling edge of the output waveform
            */
            FALL = 0x2,

            /*************************************************************
             Blanking applied from each toggle of the output waveform
            */
            BOTH = 0x3,
        }

        /*********************************************************************
         Fault B Blanking Mode
        */
        alias BLANK = BitField!(6, 5, Mutability.rw, BLANKValues);

        /*********************************************************************
         Fault B Restart
        */
        alias RESTART = Bit!(7, Mutability.rw);

        /*****************************************************************
         HALT's possible values
        */
        enum HALTValues
        {
            /*************************************************************
             Halt action disabled
            */
            DISABLE = 0x0,

            /*************************************************************
             Hardware halt action
            */
            HW = 0x1,

            /*************************************************************
             Software halt action
            */
            SW = 0x2,

            /*************************************************************
             Non-recoverable fault
            */
            NR = 0x3,
        }

        /*********************************************************************
         Fault B Halt Mode
        */
        alias HALT = BitField!(9, 8, Mutability.rw, HALTValues);

        /*****************************************************************
         CHSEL's possible values
        */
        enum CHSELValues
        {
            /*************************************************************
             Capture value stored in channel 0
            */
            CC0 = 0x0,

            /*************************************************************
             Capture value stored in channel 1
            */
            CC1 = 0x1,

            /*************************************************************
             Capture value stored in channel 2
            */
            CC2 = 0x2,

            /*************************************************************
             Capture value stored in channel 3
            */
            CC3 = 0x3,
        }

        /*********************************************************************
         Fault B Capture Channel
        */
        alias CHSEL = BitField!(11, 10, Mutability.rw, CHSELValues);

        /*****************************************************************
         CAPTURE's possible values
        */
        enum CAPTUREValues
        {
            /*************************************************************
             No capture
            */
            DISABLE = 0x0,

            /*************************************************************
             Capture on fault
            */
            CAPT = 0x1,

            /*************************************************************
             Minimum capture
            */
            CAPTMIN = 0x2,

            /*************************************************************
             Maximum capture
            */
            CAPTMAX = 0x3,

            /*************************************************************
             Minimum local detection
            */
            LOCMIN = 0x4,

            /*************************************************************
             Maximum local detection
            */
            LOCMAX = 0x5,

            /*************************************************************
             Minimum and maximum local detection
            */
            DERIV0 = 0x6,
        }

        /*********************************************************************
         Fault B Capture Action
        */
        alias CAPTURE = BitField!(14, 12, Mutability.rw, CAPTUREValues);

        /*********************************************************************
         Fault B Blanking Time
        */
        alias BLANKVAL = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Fault B Filter Value
        */
        alias FILTERVAL = BitField!(27, 24, Mutability.rw);
    }

    /*************************************************************************
     Waveform Extension Configuration
    */
    final abstract class WEXCTRL : Register!(0x14)
    {
        /*********************************************************************
         Output Matrix
        */
        alias OTMX = BitField!(1, 0, Mutability.rw);

        /*********************************************************************
         Dead-time Insertion Generator 0 Enable
        */
        alias DTIEN0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Dead-time Insertion Generator 1 Enable
        */
        alias DTIEN1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Dead-time Insertion Generator 2 Enable
        */
        alias DTIEN2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Dead-time Insertion Generator 3 Enable
        */
        alias DTIEN3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Dead-time Low Side Outputs Value
        */
        alias DTLS = BitField!(23, 16, Mutability.rw);

        /*********************************************************************
         Dead-time High Side Outputs Value
        */
        alias DTHS = BitField!(31, 24, Mutability.rw);
    }

    /*************************************************************************
     Driver Control
    */
    final abstract class DRVCTRL : Register!(0x18)
    {
        /*********************************************************************
         Non-Recoverable State 0 Output Enable
        */
        alias NRE0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 1 Output Enable
        */
        alias NRE1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 2 Output Enable
        */
        alias NRE2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 3 Output Enable
        */
        alias NRE3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 4 Output Enable
        */
        alias NRE4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 5 Output Enable
        */
        alias NRE5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 6 Output Enable
        */
        alias NRE6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 7 Output Enable
        */
        alias NRE7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 0 Output Value
        */
        alias NRV0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 1 Output Value
        */
        alias NRV1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 2 Output Value
        */
        alias NRV2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 3 Output Value
        */
        alias NRV3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 4 Output Value
        */
        alias NRV4 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 5 Output Value
        */
        alias NRV5 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 6 Output Value
        */
        alias NRV6 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Non-Recoverable State 7 Output Value
        */
        alias NRV7 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Output Waveform 0 Inversion
        */
        alias INVEN0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Output Waveform 1 Inversion
        */
        alias INVEN1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Output Waveform 2 Inversion
        */
        alias INVEN2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Output Waveform 3 Inversion
        */
        alias INVEN3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Output Waveform 4 Inversion
        */
        alias INVEN4 = Bit!(20, Mutability.rw);

        /*********************************************************************
         Output Waveform 5 Inversion
        */
        alias INVEN5 = Bit!(21, Mutability.rw);

        /*********************************************************************
         Output Waveform 6 Inversion
        */
        alias INVEN6 = Bit!(22, Mutability.rw);

        /*********************************************************************
         Output Waveform 7 Inversion
        */
        alias INVEN7 = Bit!(23, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault Input 0 Filter Value
        */
        alias FILTERVAL0 = BitField!(27, 24, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault Input 1 Filter Value
        */
        alias FILTERVAL1 = BitField!(31, 28, Mutability.rw);
    }

    /*************************************************************************
     Debug Control
    */
    final abstract class DBGCTRL : Register!(0x1e)
    {
        /*********************************************************************
         Debug Running Mode
        */
        alias DBGRUN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Fault Detection on Debug Break Detection
        */
        alias FDDBD = Bit!(2, Mutability.rw);
    }

    /*************************************************************************
     Event Control
    */
    final abstract class EVCTRL : Register!(0x20)
    {
        /*****************************************************************
         EVACT0's possible values
        */
        enum EVACT0Values
        {
            /*************************************************************
             Event action disabled
            */
            OFF = 0x0,

            /*************************************************************
             Start, restart or re-trigger counter on event
            */
            RETRIGGER = 0x1,

            /*************************************************************
             Count on event
            */
            COUNTEV = 0x2,

            /*************************************************************
             Start counter on event
            */
            START = 0x3,

            /*************************************************************
             Increment counter on event
            */
            INC = 0x4,

            /*************************************************************
             Count on active state of asynchronous event
            */
            COUNT = 0x5,

            /*************************************************************
             Non-recoverable fault
            */
            FAULT = 0x7,
        }

        /*********************************************************************
         Timer/counter Input Event0 Action
        */
        alias EVACT0 = BitField!(2, 0, Mutability.rw, EVACT0Values);

        /*****************************************************************
         EVACT1's possible values
        */
        enum EVACT1Values
        {
            /*************************************************************
             Event action disabled
            */
            OFF = 0x0,

            /*************************************************************
             Re-trigger counter on event
            */
            RETRIGGER = 0x1,

            /*************************************************************
             Direction control
            */
            DIR = 0x2,

            /*************************************************************
             Stop counter on event
            */
            STOP = 0x3,

            /*************************************************************
             Decrement counter on event
            */
            DEC = 0x4,

            /*************************************************************
             Period capture value in CC0 register, pulse width capture value in CC1 register
            */
            PPW = 0x5,

            /*************************************************************
             Period capture value in CC1 register, pulse width capture value in CC0 register
            */
            PWP = 0x6,

            /*************************************************************
             Non-recoverable fault
            */
            FAULT = 0x7,
        }

        /*********************************************************************
         Timer/counter Input Event1 Action
        */
        alias EVACT1 = BitField!(5, 3, Mutability.rw, EVACT1Values);

        /*****************************************************************
         CNTSEL's possible values
        */
        enum CNTSELValues
        {
            /*************************************************************
             An interrupt/event is generated when a new counter cycle starts
            */
            START = 0x0,

            /*************************************************************
             An interrupt/event is generated when a counter cycle ends
            */
            END = 0x1,

            /*************************************************************
             An interrupt/event is generated when a counter cycle ends, except for the first and last cycles
            */
            BETWEEN = 0x2,

            /*************************************************************
             An interrupt/event is generated when a new counter cycle starts or a counter cycle ends
            */
            BOUNDARY = 0x3,
        }

        /*********************************************************************
         Timer/counter Output Event Mode
        */
        alias CNTSEL = BitField!(7, 6, Mutability.rw, CNTSELValues);

        /*********************************************************************
         Overflow/Underflow Output Event Enable
        */
        alias OVFEO = Bit!(8, Mutability.rw);

        /*********************************************************************
         Retrigger Output Event Enable
        */
        alias TRGEO = Bit!(9, Mutability.rw);

        /*********************************************************************
         Timer/counter Output Event Enable
        */
        alias CNTEO = Bit!(10, Mutability.rw);

        /*********************************************************************
         Inverted Event 0 Input Enable
        */
        alias TCINV0 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Inverted Event 1 Input Enable
        */
        alias TCINV1 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Timer/counter Event 0 Input Enable
        */
        alias TCEI0 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Timer/counter Event 1 Input Enable
        */
        alias TCEI1 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 0 Event Input Enable
        */
        alias MCEI0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 1 Event Input Enable
        */
        alias MCEI1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 2 Event Input Enable
        */
        alias MCEI2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 3 Event Input Enable
        */
        alias MCEI3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 0 Event Output Enable
        */
        alias MCEO0 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 1 Event Output Enable
        */
        alias MCEO1 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 2 Event Output Enable
        */
        alias MCEO2 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 3 Event Output Enable
        */
        alias MCEO3 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Enable Clear
    */
    final abstract class INTENCLR : Register!(0x24)
    {
        /*********************************************************************
         Overflow Interrupt Enable
        */
        alias OVF = Bit!(0, Mutability.rw);

        /*********************************************************************
         Retrigger Interrupt Enable
        */
        alias TRG = Bit!(1, Mutability.rw);

        /*********************************************************************
         Counter Interrupt Enable
        */
        alias CNT = Bit!(2, Mutability.rw);

        /*********************************************************************
         Error Interrupt Enable
        */
        alias ERR = Bit!(3, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Debug Fault Interrupt Enable
        */
        alias DFS = Bit!(11, Mutability.rw);

        /*********************************************************************
         Recoverable Fault A Interrupt Enable
        */
        alias FAULTA = Bit!(12, Mutability.rw);

        /*********************************************************************
         Recoverable Fault B Interrupt Enable
        */
        alias FAULTB = Bit!(13, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 0 Interrupt Enable
        */
        alias FAULT0 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 1 Interrupt Enable
        */
        alias FAULT1 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 0 Interrupt Enable
        */
        alias MC0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 1 Interrupt Enable
        */
        alias MC1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 2 Interrupt Enable
        */
        alias MC2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 3 Interrupt Enable
        */
        alias MC3 = Bit!(19, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Enable Set
    */
    final abstract class INTENSET : Register!(0x28)
    {
        /*********************************************************************
         Overflow Interrupt Enable
        */
        alias OVF = Bit!(0, Mutability.rw);

        /*********************************************************************
         Retrigger Interrupt Enable
        */
        alias TRG = Bit!(1, Mutability.rw);

        /*********************************************************************
         Counter Interrupt Enable
        */
        alias CNT = Bit!(2, Mutability.rw);

        /*********************************************************************
         Error Interrupt Enable
        */
        alias ERR = Bit!(3, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Debug Fault Interrupt Enable
        */
        alias DFS = Bit!(11, Mutability.rw);

        /*********************************************************************
         Recoverable Fault A Interrupt Enable
        */
        alias FAULTA = Bit!(12, Mutability.rw);

        /*********************************************************************
         Recoverable Fault B Interrupt Enable
        */
        alias FAULTB = Bit!(13, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 0 Interrupt Enable
        */
        alias FAULT0 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 1 Interrupt Enable
        */
        alias FAULT1 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 0 Interrupt Enable
        */
        alias MC0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 1 Interrupt Enable
        */
        alias MC1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 2 Interrupt Enable
        */
        alias MC2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Match or Capture Channel 3 Interrupt Enable
        */
        alias MC3 = Bit!(19, Mutability.rw);
    }

    /*************************************************************************
     Interrupt Flag Status and Clear
    */
    final abstract class INTFLAG : Register!(0x2c)
    {
        /*********************************************************************
         Overflow
        */
        alias OVF = Bit!(0, Mutability.rw);

        /*********************************************************************
         Retrigger
        */
        alias TRG = Bit!(1, Mutability.rw);

        /*********************************************************************
         Counter
        */
        alias CNT = Bit!(2, Mutability.rw);

        /*********************************************************************
         Error
        */
        alias ERR = Bit!(3, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Debug Fault
        */
        alias DFS = Bit!(11, Mutability.rw);

        /*********************************************************************
         Recoverable Fault A
        */
        alias FAULTA = Bit!(12, Mutability.rw);

        /*********************************************************************
         Recoverable Fault B
        */
        alias FAULTB = Bit!(13, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 0
        */
        alias FAULT0 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 1
        */
        alias FAULT1 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Match or Capture 0
        */
        alias MC0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Match or Capture 1
        */
        alias MC1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Match or Capture 2
        */
        alias MC2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Match or Capture 3
        */
        alias MC3 = Bit!(19, Mutability.rw);
    }

    /*************************************************************************
     Status
    */
    final abstract class STATUS : Register!(0x30)
    {
        /*********************************************************************
         Stop
        */
        alias STOP = Bit!(0, Mutability.r);

        /*********************************************************************
         Ramp
        */
        alias IDX = Bit!(1, Mutability.r);

        /*********************************************************************
         Non-Recoverable Debug Fault State
        */
        alias DFS = Bit!(3, Mutability.rw);

        /*********************************************************************
         Slave
        */
        alias SLAVE = Bit!(4, Mutability.r);

        /*********************************************************************
         Pattern Buffer Valid
        */
        alias PATTBV = Bit!(5, Mutability.rw);

        /*********************************************************************
         Wave Buffer Valid
        */
        alias WAVEBV = Bit!(6, Mutability.rw);

        /*********************************************************************
         Period Buffer Valid
        */
        alias PERBV = Bit!(7, Mutability.rw);

        /*********************************************************************
         Recoverable Fault A Input
        */
        alias FAULTAIN = Bit!(8, Mutability.r);

        /*********************************************************************
         Recoverable Fault B Input
        */
        alias FAULTBIN = Bit!(9, Mutability.r);

        /*********************************************************************
         Non-Recoverable Fault0 Input
        */
        alias FAULT0IN = Bit!(10, Mutability.r);

        /*********************************************************************
         Non-Recoverable Fault1 Input
        */
        alias FAULT1IN = Bit!(11, Mutability.r);

        /*********************************************************************
         Recoverable Fault A State
        */
        alias FAULTA = Bit!(12, Mutability.rw);

        /*********************************************************************
         Recoverable Fault B State
        */
        alias FAULTB = Bit!(13, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 0 State
        */
        alias FAULT0 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Non-Recoverable Fault 1 State
        */
        alias FAULT1 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Compare Channel 0 Buffer Valid
        */
        alias CCBV0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Compare Channel 1 Buffer Valid
        */
        alias CCBV1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Compare Channel 2 Buffer Valid
        */
        alias CCBV2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Compare Channel 3 Buffer Valid
        */
        alias CCBV3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Compare Channel 0 Value
        */
        alias CMP0 = Bit!(24, Mutability.r);

        /*********************************************************************
         Compare Channel 1 Value
        */
        alias CMP1 = Bit!(25, Mutability.r);

        /*********************************************************************
         Compare Channel 2 Value
        */
        alias CMP2 = Bit!(26, Mutability.r);

        /*********************************************************************
         Compare Channel 3 Value
        */
        alias CMP3 = Bit!(27, Mutability.r);
    }

    /*************************************************************************
     Count
    */
    final abstract class COUNT : Register!(0x34)
    {
        /*********************************************************************
         Counter Value
        */
        alias COUNT = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     Count
    */
    final abstract class COUNT_DITH4 : Register!(0x34)
    {
        /*********************************************************************
         Counter Value
        */
        alias COUNT = BitField!(23, 4, Mutability.rw);
    }

    /*************************************************************************
     Count
    */
    final abstract class COUNT_DITH5 : Register!(0x34)
    {
        /*********************************************************************
         Counter Value
        */
        alias COUNT = BitField!(23, 5, Mutability.rw);
    }

    /*************************************************************************
     Count
    */
    final abstract class COUNT_DITH6 : Register!(0x34)
    {
        /*********************************************************************
         Counter Value
        */
        alias COUNT = BitField!(23, 6, Mutability.rw);
    }

    /*************************************************************************
     Pattern
    */
    final abstract class PATT : Register!(0x38)
    {
        /*********************************************************************
         Pattern Generator 0 Output Enable
        */
        alias PGE0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Pattern Generator 1 Output Enable
        */
        alias PGE1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Pattern Generator 2 Output Enable
        */
        alias PGE2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Pattern Generator 3 Output Enable
        */
        alias PGE3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Pattern Generator 4 Output Enable
        */
        alias PGE4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Pattern Generator 5 Output Enable
        */
        alias PGE5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Pattern Generator 6 Output Enable
        */
        alias PGE6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Pattern Generator 7 Output Enable
        */
        alias PGE7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Pattern Generator 0 Output Value
        */
        alias PGV0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Pattern Generator 1 Output Value
        */
        alias PGV1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Pattern Generator 2 Output Value
        */
        alias PGV2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Pattern Generator 3 Output Value
        */
        alias PGV3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Pattern Generator 4 Output Value
        */
        alias PGV4 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Pattern Generator 5 Output Value
        */
        alias PGV5 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Pattern Generator 6 Output Value
        */
        alias PGV6 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Pattern Generator 7 Output Value
        */
        alias PGV7 = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     Waveform Control
    */
    final abstract class WAVE : Register!(0x3c)
    {
        /*****************************************************************
         WAVEGEN's possible values
        */
        enum WAVEGENValues
        {
            /*************************************************************
             Normal frequency
            */
            NFRQ = 0x0,

            /*************************************************************
             Match frequency
            */
            MFRQ = 0x1,

            /*************************************************************
             Normal PWM
            */
            NPWM = 0x2,

            /*************************************************************
             Dual-slope critical
            */
            DSCRITICAL = 0x4,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches ZERO
            */
            DSBOTTOM = 0x5,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches ZERO or TOP
            */
            DSBOTH = 0x6,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches TOP
            */
            DSTOP = 0x7,
        }

        /*********************************************************************
         Waveform Generation
        */
        alias WAVEGEN = BitField!(2, 0, Mutability.rw, WAVEGENValues);

        /*****************************************************************
         RAMP's possible values
        */
        enum RAMPValues
        {
            /*************************************************************
             RAMP1 operation
            */
            RAMP1 = 0x0,

            /*************************************************************
             Alternative RAMP2 operation
            */
            RAMP2A = 0x1,

            /*************************************************************
             RAMP2 operation
            */
            RAMP2 = 0x2,
        }

        /*********************************************************************
         Ramp Mode
        */
        alias RAMP = BitField!(5, 4, Mutability.rw, RAMPValues);

        /*********************************************************************
         Circular period Enable
        */
        alias CIPEREN = Bit!(7, Mutability.rw);

        /*********************************************************************
         Circular Channel 0 Enable
        */
        alias CICCEN0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Circular Channel 1 Enable
        */
        alias CICCEN1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Circular Channel 2 Enable
        */
        alias CICCEN2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Circular Channel 3 Enable
        */
        alias CICCEN3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Channel 0 Polarity
        */
        alias POL0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Channel 1 Polarity
        */
        alias POL1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Channel 2 Polarity
        */
        alias POL2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Channel 3 Polarity
        */
        alias POL3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 0
        */
        alias SWAP0 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 1
        */
        alias SWAP1 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 2
        */
        alias SWAP2 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 3
        */
        alias SWAP3 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     Period
    */
    final abstract class PER : Register!(0x40)
    {
        /*********************************************************************
         Period Value
        */
        alias PER = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     Period
    */
    final abstract class PER_DITH4 : Register!(0x40)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Period Value
        */
        alias PER = BitField!(23, 4, Mutability.rw);
    }

    /*************************************************************************
     Period
    */
    final abstract class PER_DITH5 : Register!(0x40)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Period Value
        */
        alias PER = BitField!(23, 5, Mutability.rw);
    }

    /*************************************************************************
     Period
    */
    final abstract class PER_DITH6 : Register!(0x40)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Period Value
        */
        alias PER = BitField!(23, 6, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC1 : Register!(0x44)
    {
        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC2 : Register!(0x48)
    {
        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC3 : Register!(0x4c)
    {
        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC4 : Register!(0x50)
    {
        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC1_DITH4 : Register!(0x44)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC2_DITH4 : Register!(0x48)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC3_DITH4 : Register!(0x4c)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC4_DITH4 : Register!(0x50)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 4, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC1_DITH5 : Register!(0x44)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC2_DITH5 : Register!(0x48)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC3_DITH5 : Register!(0x4c)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC4_DITH5 : Register!(0x50)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 5, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC1_DITH6 : Register!(0x44)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC2_DITH6 : Register!(0x48)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC3_DITH6 : Register!(0x4c)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture
    */
    final abstract class CC4_DITH6 : Register!(0x50)
    {
        /*********************************************************************
         Dithering Cycle Number
        */
        alias DITHERCY = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Value
        */
        alias CC = BitField!(23, 6, Mutability.rw);
    }

    /*************************************************************************
     Pattern Buffer
    */
    final abstract class PATTB : Register!(0x64)
    {
        /*********************************************************************
         Pattern Generator 0 Output Enable Buffer
        */
        alias PGEB0 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Pattern Generator 1 Output Enable Buffer
        */
        alias PGEB1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Pattern Generator 2 Output Enable Buffer
        */
        alias PGEB2 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Pattern Generator 3 Output Enable Buffer
        */
        alias PGEB3 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Pattern Generator 4 Output Enable Buffer
        */
        alias PGEB4 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Pattern Generator 5 Output Enable Buffer
        */
        alias PGEB5 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Pattern Generator 6 Output Enable Buffer
        */
        alias PGEB6 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Pattern Generator 7 Output Enable Buffer
        */
        alias PGEB7 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Pattern Generator 0 Output Enable
        */
        alias PGVB0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Pattern Generator 1 Output Enable
        */
        alias PGVB1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Pattern Generator 2 Output Enable
        */
        alias PGVB2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Pattern Generator 3 Output Enable
        */
        alias PGVB3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Pattern Generator 4 Output Enable
        */
        alias PGVB4 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Pattern Generator 5 Output Enable
        */
        alias PGVB5 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Pattern Generator 6 Output Enable
        */
        alias PGVB6 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Pattern Generator 7 Output Enable
        */
        alias PGVB7 = Bit!(15, Mutability.rw);
    }

    /*************************************************************************
     Waveform Control Buffer
    */
    final abstract class WAVEB : Register!(0x68)
    {
        /*****************************************************************
         WAVEGENB's possible values
        */
        enum WAVEGENBValues
        {
            /*************************************************************
             Normal frequency
            */
            NFRQ = 0x0,

            /*************************************************************
             Match frequency
            */
            MFRQ = 0x1,

            /*************************************************************
             Normal PWM
            */
            NPWM = 0x2,

            /*************************************************************
             Dual-slope critical
            */
            DSCRITICAL = 0x4,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches ZERO
            */
            DSBOTTOM = 0x5,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches ZERO or TOP
            */
            DSBOTH = 0x6,

            /*************************************************************
             Dual-slope with interrupt/event condition when COUNT reaches TOP
            */
            DSTOP = 0x7,
        }

        /*********************************************************************
         Waveform Generation Buffer
        */
        alias WAVEGENB = BitField!(2, 0, Mutability.rw, WAVEGENBValues);

        /*****************************************************************
         RAMPB's possible values
        */
        enum RAMPBValues
        {
            /*************************************************************
             RAMP1 operation
            */
            RAMP1 = 0x0,

            /*************************************************************
             Alternative RAMP2 operation
            */
            RAMP2A = 0x1,

            /*************************************************************
             RAMP2 operation
            */
            RAMP2 = 0x2,
        }

        /*********************************************************************
         Ramp Mode Buffer
        */
        alias RAMPB = BitField!(5, 4, Mutability.rw, RAMPBValues);

        /*********************************************************************
         Circular Period Enable Buffer
        */
        alias CIPERENB = Bit!(7, Mutability.rw);

        /*********************************************************************
         Circular Channel 0 Enable Buffer
        */
        alias CICCENB0 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Circular Channel 1 Enable Buffer
        */
        alias CICCENB1 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Circular Channel 2 Enable Buffer
        */
        alias CICCENB2 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Circular Channel 3 Enable Buffer
        */
        alias CICCENB3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Channel 0 Polarity Buffer
        */
        alias POLB0 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Channel 1 Polarity Buffer
        */
        alias POLB1 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Channel 2 Polarity Buffer
        */
        alias POLB2 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Channel 3 Polarity Buffer
        */
        alias POLB3 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 0 Buffer
        */
        alias SWAPB0 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 1 Buffer
        */
        alias SWAPB1 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 2 Buffer
        */
        alias SWAPB2 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Swap DTI Output Pair 3 Buffer
        */
        alias SWAPB3 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     Period Buffer
    */
    final abstract class PERB : Register!(0x6c)
    {
        /*********************************************************************
         Period Buffer Value
        */
        alias PERB = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     Period Buffer
    */
    final abstract class PERB_DITH4 : Register!(0x6c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Period Buffer Value
        */
        alias PERB = BitField!(23, 4, Mutability.rw);
    }

    /*************************************************************************
     Period Buffer
    */
    final abstract class PERB_DITH5 : Register!(0x6c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Period Buffer Value
        */
        alias PERB = BitField!(23, 5, Mutability.rw);
    }

    /*************************************************************************
     Period Buffer
    */
    final abstract class PERB_DITH6 : Register!(0x6c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Period Buffer Value
        */
        alias PERB = BitField!(23, 6, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB1 : Register!(0x70)
    {
        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB2 : Register!(0x74)
    {
        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB3 : Register!(0x78)
    {
        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 0, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB4 : Register!(0x7c)
    {
        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 0, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB1_DITH4 : Register!(0x70)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB2_DITH4 : Register!(0x74)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB3_DITH4 : Register!(0x78)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 4, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB4_DITH4 : Register!(0x7c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 4, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB1_DITH5 : Register!(0x70)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB2_DITH5 : Register!(0x74)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB3_DITH5 : Register!(0x78)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 5, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB4_DITH5 : Register!(0x7c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(4, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 5, Mutability.rw);
    }

    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB1_DITH6 : Register!(0x70)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB2_DITH6 : Register!(0x74)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB3_DITH6 : Register!(0x78)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 6, Mutability.rw);
    }
    /*************************************************************************
     Compare and Capture Buffer
    */
    final abstract class CCB4_DITH6 : Register!(0x7c)
    {
        /*********************************************************************
         Dithering Buffer Cycle Number
        */
        alias DITHERCYB = BitField!(5, 0, Mutability.rw);

        /*********************************************************************
         Channel Compare/Capture Buffer Value
        */
        alias CCB = BitField!(23, 6, Mutability.rw);
    }
}
