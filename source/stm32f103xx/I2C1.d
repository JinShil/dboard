module stm32f103xx.i2c1;

import stm32f103xx.mmio;

/*****************************************************************************
 Inter integrated circuit
*/
final abstract class I2C1 : Peripheral!(0x40005400)
{
    /*************************************************************************
     Control register 1
    */
    final abstract class CR1 : Register!(00)
    {
        /*********************************************************************
         Software reset
        */
        alias SWRST = Bit!(15, Mutability.rw);

        /*********************************************************************
         SMBus alert
        */
        alias ALERT = Bit!(13, Mutability.rw);

        /*********************************************************************
         Packet error checking
        */
        alias PEC = Bit!(12, Mutability.rw);

        /*********************************************************************
         Acknowledge/PEC Position (for data reception)
        */
        alias POS = Bit!(11, Mutability.rw);

        /*********************************************************************
         Acknowledge enable
        */
        alias ACK = Bit!(10, Mutability.rw);

        /*********************************************************************
         Stop generation
        */
        alias STOP = Bit!(9, Mutability.rw);

        /*********************************************************************
         Start generation
        */
        alias START = Bit!(8, Mutability.rw);

        /*********************************************************************
         Clock stretching disable (Slave mode)
        */
        alias NOSTRETCH = Bit!(7, Mutability.rw);

        /*********************************************************************
         General call enable
        */
        alias ENGC = Bit!(6, Mutability.rw);

        /*********************************************************************
         PEC enable
        */
        alias ENPEC = Bit!(5, Mutability.rw);

        /*********************************************************************
         ARP enable
        */
        alias ENARP = Bit!(4, Mutability.rw);

        /*********************************************************************
         SMBus type
        */
        alias SMBTYPE = Bit!(3, Mutability.rw);

        /*********************************************************************
         SMBus mode
        */
        alias SMBUS = Bit!(1, Mutability.rw);

        /*********************************************************************
         Peripheral enable
        */
        alias PE = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Control register 2
    */
    final abstract class CR2 : Register!(0x4)
    {
        /*********************************************************************
         DMA last transfer
        */
        alias LAST = Bit!(12, Mutability.rw);

        /*********************************************************************
         DMA requests enable
        */
        alias DMAEN = Bit!(11, Mutability.rw);

        /*********************************************************************
         Buffer interrupt enable
        */
        alias ITBUFEN = Bit!(10, Mutability.rw);

        /*********************************************************************
         Event interrupt enable
        */
        alias ITEVTEN = Bit!(9, Mutability.rw);

        /*********************************************************************
         Error interrupt enable
        */
        alias ITERREN = Bit!(8, Mutability.rw);

        /*********************************************************************
         Peripheral clock frequency
        */
        alias FREQ = BitField!(5, 0, Mutability.rw);
    }

    /*************************************************************************
     Own address register 1
    */
    final abstract class OAR1 : Register!(0x8)
    {
        /*********************************************************************
         Addressing mode (slave mode)
        */
        alias ADDMODE = Bit!(15, Mutability.rw);

        /*********************************************************************
         Interface address
        */
        alias ADD10 = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Interface address
        */
        alias ADD7 = BitField!(7, 1, Mutability.rw);

        /*********************************************************************
         Interface address
        */
        alias ADD0 = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Own address register 2
    */
    final abstract class OAR2 : Register!(0xc)
    {
        /*********************************************************************
         Interface address
        */
        alias ADD2 = BitField!(7, 1, Mutability.rw);

        /*********************************************************************
         Dual addressing mode enable
        */
        alias ENDUAL = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Data register
    */
    final abstract class DR : Register!(0x10)
    {
        /*********************************************************************
         8-bit data register
        */
        alias DR = BitField!(7, 0, Mutability.rw);
    }

    /*************************************************************************
     Status register 1
    */
    final abstract class SR1 : Register!(0x14)
    {
        /*********************************************************************
         SMBus alert
        */
        alias SMBALERT = Bit!(15, Mutability.rw);

        /*********************************************************************
         Timeout or Tlow error
        */
        alias TIMEOUT = Bit!(14, Mutability.rw);

        /*********************************************************************
         PEC Error in reception
        */
        alias PECERR = Bit!(12, Mutability.rw);

        /*********************************************************************
         Overrun/Underrun
        */
        alias OVR = Bit!(11, Mutability.rw);

        /*********************************************************************
         Acknowledge failure
        */
        alias AF = Bit!(10, Mutability.rw);

        /*********************************************************************
         Arbitration lost (master mode)
        */
        alias ARLO = Bit!(9, Mutability.rw);

        /*********************************************************************
         Bus error
        */
        alias BERR = Bit!(8, Mutability.rw);

        /*********************************************************************
         Data register empty (transmitters)
        */
        alias TxE = Bit!(7, Mutability.r);

        /*********************************************************************
         Data register not empty (receivers)
        */
        alias RxNE = Bit!(6, Mutability.r);

        /*********************************************************************
         Stop detection (slave mode)
        */
        alias STOPF = Bit!(4, Mutability.r);

        /*********************************************************************
         10-bit header sent (Master mode)
        */
        alias ADD10 = Bit!(3, Mutability.r);

        /*********************************************************************
         Byte transfer finished
        */
        alias BTF = Bit!(2, Mutability.r);

        /*********************************************************************
         Address sent (master mode)/matched (slave mode)
        */
        alias ADDR = Bit!(1, Mutability.r);

        /*********************************************************************
         Start bit (Master mode)
        */
        alias SB = Bit!(0, Mutability.r);
    }

    /*************************************************************************
     Status register 2
    */
    final abstract class SR2 : Register!(0x18)
    {
        /*********************************************************************
         acket error checking register
        */
        alias PEC = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         Dual flag (Slave mode)
        */
        alias DUALF = Bit!(7, Mutability.rw);

        /*********************************************************************
         SMBus host header (Slave mode)
        */
        alias SMBHOST = Bit!(6, Mutability.rw);

        /*********************************************************************
         SMBus device default address (Slave mode)
        */
        alias SMBDEFAULT = Bit!(5, Mutability.rw);

        /*********************************************************************
         General call address (Slave mode)
        */
        alias GENCALL = Bit!(4, Mutability.rw);

        /*********************************************************************
         Transmitter/receiver
        */
        alias TRA = Bit!(2, Mutability.rw);

        /*********************************************************************
         Bus busy
        */
        alias BUSY = Bit!(1, Mutability.rw);

        /*********************************************************************
         Master/slave
        */
        alias MSL = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Clock control register
    */
    final abstract class CCR : Register!(0x1c)
    {
        /*********************************************************************
         I2C master mode selection
        */
        alias F_S = Bit!(15, Mutability.rw);

        /*********************************************************************
         Fast mode duty cycle
        */
        alias DUTY = Bit!(14, Mutability.rw);

        /*********************************************************************
         Clock control register in Fast/Standard mode (Master mode)
        */
        alias CCR = BitField!(11, 0, Mutability.rw);
    }

    /*************************************************************************
     TRISE register
    */
    final abstract class TRISE : Register!(0x20)
    {
        /*********************************************************************
         Maximum rise time in Fast/Standard mode (Master mode)
        */
        alias TRISE = BitField!(5, 0, Mutability.rw);
    }
}
