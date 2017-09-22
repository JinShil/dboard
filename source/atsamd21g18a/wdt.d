// module source.atsamd21g18a.wdt;

// import mvf.mmio;

// /*****************************************************************************
//  Watchdog Timer
// */
// final abstract class WDT : Peripheral!(0x40001000)
// {
//     /*************************************************************************
//      Control
//     */
//     final abstract class CTRL : Register!(00)
//     {
//         /*********************************************************************
//          Enable
//         */
//         alias ENABLE = Bit!(1, Mutability.rw);

//         /*********************************************************************
//          Watchdog Timer Window Mode Enable
//         */
//         alias WEN = Bit!(2, Mutability.rw);

//         /*********************************************************************
//          Always-On
//         */
//         alias ALWAYSON = Bit!(7, Mutability.rw);
//     }

//     /*************************************************************************
//      Configuration
//     */
//     final abstract class CONFIG : Register!(0x1)
//     {
//         /*****************************************************************
//          PER's possible values
//         */
//         enum PERValues
//         {
//             /*************************************************************
//              8 clock cycles
//             */
//             _8 = 0x0,

//             /*************************************************************
//              16 clock cycles
//             */
//             _16 = 0x1,

//             /*************************************************************
//              32 clock cycles
//             */
//             _32 = 0x2,

//             /*************************************************************
//              64 clock cycles
//             */
//             _64 = 0x3,

//             /*************************************************************
//              128 clock cycles
//             */
//             _128 = 0x4,

//             /*************************************************************
//              256 clock cycles
//             */
//             _256 = 0x5,

//             /*************************************************************
//              512 clock cycles
//             */
//             _512 = 0x6,

//             /*************************************************************
//              1024 clock cycles
//             */
//             _1K = 0x7,

//             /*************************************************************
//              2048 clock cycles
//             */
//             _2K = 0x8,

//             /*************************************************************
//              4096 clock cycles
//             */
//             _4K = 0x9,

//             /*************************************************************
//              8192 clock cycles
//             */
//             _8K = 0xa,

//             /*************************************************************
//              16384 clock cycles
//             */
//             _16K = 0xb,
//         }

//         /*********************************************************************
//          Time-Out Period
//         */
//         alias PER = BitField!(3, 0, Mutability.rw, PERValues);

//         /*****************************************************************
//          WINDOW's possible values
//         */
//         enum WINDOWValues
//         {
//             /*************************************************************
//              8 clock cycles
//             */
//             _8 = 0x0,

//             /*************************************************************
//              16 clock cycles
//             */
//             _16 = 0x1,

//             /*************************************************************
//              32 clock cycles
//             */
//             _32 = 0x2,

//             /*************************************************************
//              64 clock cycles
//             */
//             _64 = 0x3,

//             /*************************************************************
//              128 clock cycles
//             */
//             _128 = 0x4,

//             /*************************************************************
//              256 clock cycles
//             */
//             _256 = 0x5,

//             /*************************************************************
//              512 clock cycles
//             */
//             _512 = 0x6,

//             /*************************************************************
//              1024 clock cycles
//             */
//             _1K = 0x7,

//             /*************************************************************
//              2048 clock cycles
//             */
//             _2K = 0x8,

//             /*************************************************************
//              4096 clock cycles
//             */
//             _4K = 0x9,

//             /*************************************************************
//              8192 clock cycles
//             */
//             _8K = 0xa,

//             /*************************************************************
//              16384 clock cycles
//             */
//             _16K = 0xb,
//         }

//         /*********************************************************************
//          Window Mode Time-Out Period
//         */
//         alias WINDOW = BitField!(7, 4, Mutability.rw, WINDOWValues);
//     }

//     /*************************************************************************
//      Early Warning Interrupt Control
//     */
//     final abstract class EWCTRL : Register!(0x2)
//     {
//         /*****************************************************************
//          EWOFFSET's possible values
//         */
//         enum EWOFFSETValues
//         {
//             /*************************************************************
//              8 clock cycles
//             */
//             _8 = 0x0,

//             /*************************************************************
//              16 clock cycles
//             */
//             _16 = 0x1,

//             /*************************************************************
//              32 clock cycles
//             */
//             _32 = 0x2,

//             /*************************************************************
//              64 clock cycles
//             */
//             _64 = 0x3,

//             /*************************************************************
//              128 clock cycles
//             */
//             _128 = 0x4,

//             /*************************************************************
//              256 clock cycles
//             */
//             _256 = 0x5,

//             /*************************************************************
//              512 clock cycles
//             */
//             _512 = 0x6,

//             /*************************************************************
//              1024 clock cycles
//             */
//             _1K = 0x7,

//             /*************************************************************
//              2048 clock cycles
//             */
//             _2K = 0x8,

//             /*************************************************************
//              4096 clock cycles
//             */
//             _4K = 0x9,

//             /*************************************************************
//              8192 clock cycles
//             */
//             _8K = 0xa,

//             /*************************************************************
//              16384 clock cycles
//             */
//             _16K = 0xb,
//         }

//         /*********************************************************************
//          Early Warning Interrupt Time Offset
//         */
//         alias EWOFFSET = BitField!(3, 0, Mutability.rw, EWOFFSETValues);
//     }

//     /*************************************************************************
//      Interrupt Enable Clear
//     */
//     final abstract class INTENCLR : Register!(0x4)
//     {
//         /*********************************************************************
//          Early Warning Interrupt Enable
//         */
//         alias EW = Bit!(0, Mutability.rw);
//     }

//     /*************************************************************************
//      Interrupt Enable Set
//     */
//     final abstract class INTENSET : Register!(0x5)
//     {
//         /*********************************************************************
//          Early Warning Interrupt Enable
//         */
//         alias EW = Bit!(0, Mutability.rw);
//     }

//     /*************************************************************************
//      Interrupt Flag Status and Clear
//     */
//     final abstract class INTFLAG : Register!(0x6)
//     {
//         /*********************************************************************
//          Early Warning
//         */
//         alias EW = Bit!(0, Mutability.rw);
//     }

//     /*************************************************************************
//      Status
//     */
//     final abstract class STATUS : Register!(0x7)
//     {
//         /*********************************************************************
//          Synchronization Busy
//         */
//         alias SYNCBUSY = Bit!(7, Mutability.r);
//     }

//     /*************************************************************************
//      Clear
//     */
//     final abstract class CLEAR : Register!(0x8)
//     {
//         /*****************************************************************
//          CLEAR's possible values
//         */
//         enum CLEARValues
//         {
//             /*************************************************************
//              Clear Key
//             */
//             KEY = 0xa5,
//         }

//         /*********************************************************************
//          Watchdog Clear
//         */
//         alias CLEAR = BitField!(7, 0, Mutability.w, CLEARValues);
//     }
// }