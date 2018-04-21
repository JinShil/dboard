module stm32f103xx.uart4;

import stm32f103xx.mmio;

/*****************************************************************************
 Universal asynchronous receiver transmitter
*/
final abstract class UART4 : Peripheral!(0x40004C00)
{
    /*************************************************************************
     UART4_SR
    */
    final abstract class SR : Register!(00)
    {
        /*********************************************************************
         Parity error
        */
        alias PE = Bit!(0, Mutability.r);

        /*********************************************************************
         Framing error
        */
        alias FE = Bit!(1, Mutability.r);

        /*********************************************************************
         Noise error flag
        */
        alias NE = Bit!(2, Mutability.r);

        /*********************************************************************
         Overrun error
        */
        alias ORE = Bit!(3, Mutability.r);

        /*********************************************************************
         IDLE line detected
        */
        alias IDLE = Bit!(4, Mutability.r);

        /*********************************************************************
         Read data register not empty
        */
        alias RXNE = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transmission complete
        */
        alias TC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Transmit data register empty
        */
        alias TXE = Bit!(7, Mutability.r);

        /*********************************************************************
         LIN break detection flag
        */
        alias LBD = Bit!(8, Mutability.rw);
    }

    /*************************************************************************
     UART4_DR
    */
    final abstract class DR : Register!(0x4)
    {
        /*********************************************************************
         DR
        */
        alias DR = BitField!(8, 0, Mutability.rw);
    }

    /*************************************************************************
     UART4_BRR
    */
    final abstract class BRR : Register!(0x8)
    {
        /*********************************************************************
         DIV_Fraction
        */
        alias DIV_Fraction = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         DIV_Mantissa
        */
        alias DIV_Mantissa = BitField!(15, 4, Mutability.rw);
    }

    /*************************************************************************
     UART4_CR1
    */
    final abstract class CR1 : Register!(0xc)
    {
        /*********************************************************************
         Send break
        */
        alias SBK = Bit!(0, Mutability.rw);

        /*********************************************************************
         Receiver wakeup
        */
        alias RWU = Bit!(1, Mutability.rw);

        /*********************************************************************
         Receiver enable
        */
        alias RE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transmitter enable
        */
        alias TE = Bit!(3, Mutability.rw);

        /*********************************************************************
         IDLE interrupt enable
        */
        alias IDLEIE = Bit!(4, Mutability.rw);

        /*********************************************************************
         RXNE interrupt enable
        */
        alias RXNEIE = Bit!(5, Mutability.rw);

        /*********************************************************************
         Transmission complete interrupt enable
        */
        alias TCIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         TXE interrupt enable
        */
        alias TXEIE = Bit!(7, Mutability.rw);

        /*********************************************************************
         PE interrupt enable
        */
        alias PEIE = Bit!(8, Mutability.rw);

        /*********************************************************************
         Parity selection
        */
        alias PS = Bit!(9, Mutability.rw);

        /*********************************************************************
         Parity control enable
        */
        alias PCE = Bit!(10, Mutability.rw);

        /*********************************************************************
         Wakeup method
        */
        alias WAKE = Bit!(11, Mutability.rw);

        /*********************************************************************
         Word length
        */
        alias M = Bit!(12, Mutability.rw);

        /*********************************************************************
         USART enable
        */
        alias UE = Bit!(13, Mutability.rw);
    }

    /*************************************************************************
     UART4_CR2
    */
    final abstract class CR2 : Register!(0x10)
    {
        /*********************************************************************
         Address of the USART node
        */
        alias ADD = BitField!(3, 0, Mutability.rw);

        /*********************************************************************
         lin break detection length
        */
        alias LBDL = Bit!(5, Mutability.rw);

        /*********************************************************************
         LIN break detection interrupt enable
        */
        alias LBDIE = Bit!(6, Mutability.rw);

        /*********************************************************************
         STOP bits
        */
        alias STOP = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         LIN mode enable
        */
        alias LINEN = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     UART4_CR3
    */
    final abstract class CR3 : Register!(0x14)
    {
        /*********************************************************************
         Error interrupt enable
        */
        alias EIE = Bit!(0, Mutability.rw);

        /*********************************************************************
         IrDA mode enable
        */
        alias IREN = Bit!(1, Mutability.rw);

        /*********************************************************************
         IrDA low-power
        */
        alias IRLP = Bit!(2, Mutability.rw);

        /*********************************************************************
         Half-duplex selection
        */
        alias HDSEL = Bit!(3, Mutability.rw);

        /*********************************************************************
         DMA enable receiver
        */
        alias DMAR = Bit!(6, Mutability.rw);

        /*********************************************************************
         DMA enable transmitter
        */
        alias DMAT = Bit!(7, Mutability.rw);
    }
}
