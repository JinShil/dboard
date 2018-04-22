module stm32f103xx.usart2;

import stm32f103xx.mmio;

/*****************************************************************************
 
*/
final abstract class USART2 : Peripheral!(0x40004400)
{
    /*************************************************************************
     Status register
    */
    final abstract class SR : Register!(00)
    {
        /*********************************************************************
         CTS flag
        */
        alias CTS = Bit!(9, Mutability.rw);

        /*********************************************************************
         LIN break detection flag
        */
        alias LBD = Bit!(8, Mutability.rw);

        /*********************************************************************
         Transmit data register empty
        */
        alias TXE = Bit!(7, Mutability.r);

        /*********************************************************************
         Transmission complete
        */
        alias TC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Read data register not empty
        */
        alias RXNE = Bit!(5, Mutability.rw);

        /*********************************************************************
         IDLE line detected
        */
        alias IDLE = Bit!(4, Mutability.r);

        /*********************************************************************
         Overrun error
        */
        alias ORE = Bit!(3, Mutability.r);

        /*********************************************************************
         Noise error flag
        */
        alias NE = Bit!(2, Mutability.r);

        /*********************************************************************
         Framing error
        */
        alias FE = Bit!(1, Mutability.r);

        /*********************************************************************
         Parity error
        */
        alias PE = Bit!(0, Mutability.r);
    }

    /*************************************************************************
     Data register
    */
    final abstract class DR : Register!(0x4)
    {
        /*********************************************************************
         Data value
        */
        alias DR = BitField!(8, 0, Mutability.rw);
    }

    /*************************************************************************
     Baud rate register
    */
    final abstract class BRR : Register!(0x8)
    {
        /*********************************************************************
         mantissa of USARTDIV
        */
        alias DIV_Mantissa = BitField!(15, 4, Mutability.rw);

        /*********************************************************************
         fraction of USARTDIV
        */
        alias DIV_Fraction = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     Control register 1
    */
    final abstract class CR1 : Register!(0xc)
    {
        /*********************************************************************
         USART enable
        */
        alias UE = Bit!(13, Mutability.rw);

        /*********************************************************************
         Word length
        */
        alias M = Bit!(12, Mutability.rw);

        /*********************************************************************
         Wakeup method
        */
        alias WAKE = Bit!(11, Mutability.rw);

        /*********************************************************************
         Parity control enable
        */
        alias PCE = Bit!(10, Mutability.rw);

        /*********************************************************************
         Parity selection
        */
        alias PS = Bit!(9, Mutability.rw);

        /*********************************************************************
         PE interrupt enable
        */
        alias PEIE = Bit!(8, Mutability.rw);

        /*********************************************************************
         TXE interrupt enable
        */
        alias TXEIE = Bit!(7, Mutability.rw);

        /*********************************************************************
         Transmission complete interrupt enable
        */
        alias TCIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         RXNE interrupt enable
        */
        alias RXNEIE = Bit!(5, Mutability.rw);

        /*********************************************************************
         IDLE interrupt enable
        */
        alias IDLEIE = Bit!(4, Mutability.rw);

        /*********************************************************************
         Transmitter enable
        */
        alias TE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Receiver enable
        */
        alias RE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Receiver wakeup
        */
        alias RWU = Bit!(1, Mutability.rw);

        /*********************************************************************
         Send break
        */
        alias SBK = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Control register 2
    */
    final abstract class CR2 : Register!(0x10)
    {
        /*********************************************************************
         LIN mode enable
        */
        alias LINEN = Bit!(14, Mutability.rw);

        /*********************************************************************
         STOP bits
        */
        alias STOP = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Clock enable
        */
        alias CLKEN = Bit!(11, Mutability.rw);

        /*********************************************************************
         Clock polarity
        */
        alias CPOL = Bit!(10, Mutability.rw);

        /*********************************************************************
         Clock phase
        */
        alias CPHA = Bit!(9, Mutability.rw);

        /*********************************************************************
         Last bit clock pulse
        */
        alias LBCL = Bit!(8, Mutability.rw);

        /*********************************************************************
         LIN break detection interrupt enable
        */
        alias LBDIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         lin break detection length
        */
        alias LBDL = Bit!(5, Mutability.rw);

        /*********************************************************************
         Address of the USART node
        */
        alias ADD = BitField!(3, 0, Mutability.rw);
    }

    /*************************************************************************
     Control register 3
    */
    final abstract class CR3 : Register!(0x14)
    {
        /*********************************************************************
         CTS interrupt enable
        */
        alias CTSIE = Bit!(10, Mutability.rw);

        /*********************************************************************
         CTS enable
        */
        alias CTSE = Bit!(9, Mutability.rw);

        /*********************************************************************
         RTS enable
        */
        alias RTSE = Bit!(8, Mutability.rw);

        /*********************************************************************
         DMA enable transmitter
        */
        alias DMAT = Bit!(7, Mutability.rw);

        /*********************************************************************
         DMA enable receiver
        */
        alias DMAR = Bit!(6, Mutability.rw);

        /*********************************************************************
         Smartcard mode enable
        */
        alias SCEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         Smartcard NACK enable
        */
        alias NACK = Bit!(4, Mutability.rw);

        /*********************************************************************
         Half-duplex selection
        */
        alias HDSEL = Bit!(3, Mutability.rw);

        /*********************************************************************
         IrDA low-power
        */
        alias IRLP = Bit!(2, Mutability.rw);

        /*********************************************************************
         IrDA mode enable
        */
        alias IREN = Bit!(1, Mutability.rw);

        /*********************************************************************
         Error interrupt enable
        */
        alias EIE = Bit!(0, Mutability.rw);
    }

    /*************************************************************************
     Guard time and prescaler register
    */
    final abstract class GTPR : Register!(0x18)
    {
        /*********************************************************************
         Guard time value
        */
        alias GT = BitField!(15, 8, Mutability.rw);

        /*********************************************************************
         Prescaler value
        */
        alias PSC = BitField!(7, 0, Mutability.rw);
    }
}
