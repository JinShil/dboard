module stm32f103xx.crc;

import stm32f103xx.mmio;

/*****************************************************************************
 CRC calculation unit
*/
final abstract class CRC : Peripheral!(0x40023000)
{
    /*************************************************************************
     Data register
    */
    final abstract class DR : Register!(00)
    {
        /*********************************************************************
         Data Register
        */
        alias DR = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     Independent Data register
    */
    final abstract class IDR : Register!(0x4)
    {
        /*********************************************************************
         Independent Data register
        */
        alias IDR = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Control register
    */
    final abstract class CR : Register!(0x8)
    {
        /*********************************************************************
         Reset bit
        */
        alias RESET = Bit!(0, Mutability.rw);
    }
}
