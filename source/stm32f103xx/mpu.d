module stm32f103xx.mpu;

import stm32f103xx.mmio;

/*****************************************************************************
 Memory protection unit
*/
final abstract class MPU : Peripheral!(0xE000ED90)
{
    /*************************************************************************
     MPU type register
    */
    final abstract class MPU_TYPER : Register!(00)
    {
        /*********************************************************************
         Separate flag
        */
        alias SEPARATE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Number of MPU data regions
        */
        alias DREGION = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         Number of MPU instruction regions
        */
        alias IREGION = BitField!(23, 16, Mutability.rw);
    }

    /*************************************************************************
     MPU control register
    */
    final abstract class MPU_CTRL : Register!(0x4)
    {
        /*********************************************************************
         Enables the MPU
        */
        alias ENABLE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Enables the operation of MPU during hard fault
        */
        alias HFNMIENA = Bit!(1, Mutability.rw);

        /*********************************************************************
         Enable priviliged software access to default memory map
        */
        alias PRIVDEFENA = Bit!(2, Mutability.rw);
    }

    /*************************************************************************
     MPU region number register
    */
    final abstract class MPU_RNR : Register!(0x8)
    {
        /*********************************************************************
         MPU region
        */
        alias REGION = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     MPU region base address register
    */
    final abstract class MPU_RBAR : Register!(0xc)
    {
        /*********************************************************************
         MPU region field
        */
        alias REGION = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         MPU region number valid
        */
        alias VALID = Bit!(4, Mutability.rw);

        /*********************************************************************
         Region base address field
        */
        alias ADDR = BitField!(31, 5, Mutability.rw);
    }

    /*************************************************************************
     MPU region attribute and size register
    */
    final abstract class MPU_RASR : Register!(0x10)
    {
        /*********************************************************************
         Region enable bit.
        */
        alias ENABLE = Bit!(0, Mutability.rw);

        /*********************************************************************
         Size of the MPU protection region
        */
        alias SIZE = BitField!(5, 1, Mutability.rw);

        /*********************************************************************
         Subregion disable bits
        */
        alias SRD = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         memory attribute
        */
        alias B = Bit!(16, Mutability.rw);

        /*********************************************************************
         memory attribute
        */
        alias C = Bit!(17, Mutability.rw);

        /*********************************************************************
         Shareable memory attribute
        */
        alias S = Bit!(18, Mutability.rw);

        /*********************************************************************
         memory attribute
        */
        alias TEX = BitField!(21, 19, Mutability.rw);

        /*********************************************************************
         Access permission
        */
        alias AP = BitField!(26, 24, Mutability.rw);

        /*********************************************************************
         Instruction access disable bit
        */
        alias XN = Bit!(28, Mutability.rw);
    }
}
