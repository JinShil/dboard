module stm32f103xx.dma1;

import stm32f103xx.mmio;

/*****************************************************************************
 DMA controller
*/
final abstract class DMA1 : Peripheral!(0x40020000)
{
    /*************************************************************************
     DMA interrupt status register (DMA_ISR)
    */
    final abstract class ISR : Register!(00)
    {
        /*********************************************************************
         Channel 1 Global interrupt flag
        */
        alias GIF1 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel 1 Transfer Complete flag
        */
        alias TCIF1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Channel 1 Half Transfer Complete flag
        */
        alias HTIF1 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Channel 1 Transfer Error flag
        */
        alias TEIF1 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Channel 2 Global interrupt flag
        */
        alias GIF2 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Channel 2 Transfer Complete flag
        */
        alias TCIF2 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Channel 2 Half Transfer Complete flag
        */
        alias HTIF2 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Channel 2 Transfer Error flag
        */
        alias TEIF2 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Channel 3 Global interrupt flag
        */
        alias GIF3 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Channel 3 Transfer Complete flag
        */
        alias TCIF3 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Channel 3 Half Transfer Complete flag
        */
        alias HTIF3 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Channel 3 Transfer Error flag
        */
        alias TEIF3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Channel 4 Global interrupt flag
        */
        alias GIF4 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Channel 4 Transfer Complete flag
        */
        alias TCIF4 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Channel 4 Half Transfer Complete flag
        */
        alias HTIF4 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Channel 4 Transfer Error flag
        */
        alias TEIF4 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Channel 5 Global interrupt flag
        */
        alias GIF5 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Channel 5 Transfer Complete flag
        */
        alias TCIF5 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Channel 5 Half Transfer Complete flag
        */
        alias HTIF5 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Channel 5 Transfer Error flag
        */
        alias TEIF5 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Channel 6 Global interrupt flag
        */
        alias GIF6 = Bit!(20, Mutability.rw);

        /*********************************************************************
         Channel 6 Transfer Complete flag
        */
        alias TCIF6 = Bit!(21, Mutability.rw);

        /*********************************************************************
         Channel 6 Half Transfer Complete flag
        */
        alias HTIF6 = Bit!(22, Mutability.rw);

        /*********************************************************************
         Channel 6 Transfer Error flag
        */
        alias TEIF6 = Bit!(23, Mutability.rw);

        /*********************************************************************
         Channel 7 Global interrupt flag
        */
        alias GIF7 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Channel 7 Transfer Complete flag
        */
        alias TCIF7 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Channel 7 Half Transfer Complete flag
        */
        alias HTIF7 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Channel 7 Transfer Error flag
        */
        alias TEIF7 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     DMA interrupt flag clear register (DMA_IFCR)
    */
    final abstract class IFCR : Register!(0x4)
    {
        /*********************************************************************
         Channel 1 Global interrupt clear
        */
        alias CGIF1 = Bit!(0, Mutability.rw);

        /*********************************************************************
         Channel 2 Global interrupt clear
        */
        alias CGIF2 = Bit!(4, Mutability.rw);

        /*********************************************************************
         Channel 3 Global interrupt clear
        */
        alias CGIF3 = Bit!(8, Mutability.rw);

        /*********************************************************************
         Channel 4 Global interrupt clear
        */
        alias CGIF4 = Bit!(12, Mutability.rw);

        /*********************************************************************
         Channel 5 Global interrupt clear
        */
        alias CGIF5 = Bit!(16, Mutability.rw);

        /*********************************************************************
         Channel 6 Global interrupt clear
        */
        alias CGIF6 = Bit!(20, Mutability.rw);

        /*********************************************************************
         Channel 7 Global interrupt clear
        */
        alias CGIF7 = Bit!(24, Mutability.rw);

        /*********************************************************************
         Channel 1 Transfer Complete clear
        */
        alias CTCIF1 = Bit!(1, Mutability.rw);

        /*********************************************************************
         Channel 2 Transfer Complete clear
        */
        alias CTCIF2 = Bit!(5, Mutability.rw);

        /*********************************************************************
         Channel 3 Transfer Complete clear
        */
        alias CTCIF3 = Bit!(9, Mutability.rw);

        /*********************************************************************
         Channel 4 Transfer Complete clear
        */
        alias CTCIF4 = Bit!(13, Mutability.rw);

        /*********************************************************************
         Channel 5 Transfer Complete clear
        */
        alias CTCIF5 = Bit!(17, Mutability.rw);

        /*********************************************************************
         Channel 6 Transfer Complete clear
        */
        alias CTCIF6 = Bit!(21, Mutability.rw);

        /*********************************************************************
         Channel 7 Transfer Complete clear
        */
        alias CTCIF7 = Bit!(25, Mutability.rw);

        /*********************************************************************
         Channel 1 Half Transfer clear
        */
        alias CHTIF1 = Bit!(2, Mutability.rw);

        /*********************************************************************
         Channel 2 Half Transfer clear
        */
        alias CHTIF2 = Bit!(6, Mutability.rw);

        /*********************************************************************
         Channel 3 Half Transfer clear
        */
        alias CHTIF3 = Bit!(10, Mutability.rw);

        /*********************************************************************
         Channel 4 Half Transfer clear
        */
        alias CHTIF4 = Bit!(14, Mutability.rw);

        /*********************************************************************
         Channel 5 Half Transfer clear
        */
        alias CHTIF5 = Bit!(18, Mutability.rw);

        /*********************************************************************
         Channel 6 Half Transfer clear
        */
        alias CHTIF6 = Bit!(22, Mutability.rw);

        /*********************************************************************
         Channel 7 Half Transfer clear
        */
        alias CHTIF7 = Bit!(26, Mutability.rw);

        /*********************************************************************
         Channel 1 Transfer Error clear
        */
        alias CTEIF1 = Bit!(3, Mutability.rw);

        /*********************************************************************
         Channel 2 Transfer Error clear
        */
        alias CTEIF2 = Bit!(7, Mutability.rw);

        /*********************************************************************
         Channel 3 Transfer Error clear
        */
        alias CTEIF3 = Bit!(11, Mutability.rw);

        /*********************************************************************
         Channel 4 Transfer Error clear
        */
        alias CTEIF4 = Bit!(15, Mutability.rw);

        /*********************************************************************
         Channel 5 Transfer Error clear
        */
        alias CTEIF5 = Bit!(19, Mutability.rw);

        /*********************************************************************
         Channel 6 Transfer Error clear
        */
        alias CTEIF6 = Bit!(23, Mutability.rw);

        /*********************************************************************
         Channel 7 Transfer Error clear
        */
        alias CTEIF7 = Bit!(27, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR1 : Register!(0x8)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 1 number of data register
    */
    final abstract class CNDTR1 : Register!(0xc)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 1 peripheral address register
    */
    final abstract class CPAR1 : Register!(0x10)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 1 memory address register
    */
    final abstract class CMAR1 : Register!(0x14)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR2 : Register!(0x1c)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 2 number of data register
    */
    final abstract class CNDTR2 : Register!(0x20)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 2 peripheral address register
    */
    final abstract class CPAR2 : Register!(0x24)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 2 memory address register
    */
    final abstract class CMAR2 : Register!(0x28)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR3 : Register!(0x30)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 3 number of data register
    */
    final abstract class CNDTR3 : Register!(0x34)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 3 peripheral address register
    */
    final abstract class CPAR3 : Register!(0x38)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 3 memory address register
    */
    final abstract class CMAR3 : Register!(0x3c)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR4 : Register!(0x44)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 4 number of data register
    */
    final abstract class CNDTR4 : Register!(0x48)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 4 peripheral address register
    */
    final abstract class CPAR4 : Register!(0x4c)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 4 memory address register
    */
    final abstract class CMAR4 : Register!(0x50)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR5 : Register!(0x58)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 5 number of data register
    */
    final abstract class CNDTR5 : Register!(0x5c)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 5 peripheral address register
    */
    final abstract class CPAR5 : Register!(0x60)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 5 memory address register
    */
    final abstract class CMAR5 : Register!(0x64)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR6 : Register!(0x6c)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 6 number of data register
    */
    final abstract class CNDTR6 : Register!(0x70)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 6 peripheral address register
    */
    final abstract class CPAR6 : Register!(0x74)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 6 memory address register
    */
    final abstract class CMAR6 : Register!(0x78)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel configuration register (DMA_CCR)
    */
    final abstract class CCR7 : Register!(0x80)
    {
        /*********************************************************************
         Channel enable
        */
        alias EN = Bit!(0, Mutability.rw);

        /*********************************************************************
         Transfer complete interrupt enable
        */
        alias TCIE = Bit!(1, Mutability.rw);

        /*********************************************************************
         Half Transfer interrupt enable
        */
        alias HTIE = Bit!(2, Mutability.rw);

        /*********************************************************************
         Transfer error interrupt enable
        */
        alias TEIE = Bit!(3, Mutability.rw);

        /*********************************************************************
         Data transfer direction
        */
        alias DIR = Bit!(4, Mutability.rw);

        /*********************************************************************
         Circular mode
        */
        alias CIRC = Bit!(5, Mutability.rw);

        /*********************************************************************
         Peripheral increment mode
        */
        alias PINC = Bit!(6, Mutability.rw);

        /*********************************************************************
         Memory increment mode
        */
        alias MINC = Bit!(7, Mutability.rw);

        /*********************************************************************
         Peripheral size
        */
        alias PSIZE = BitField!(9, 8, Mutability.rw);

        /*********************************************************************
         Memory size
        */
        alias MSIZE = BitField!(11, 10, Mutability.rw);

        /*********************************************************************
         Channel Priority level
        */
        alias PL = BitField!(13, 12, Mutability.rw);

        /*********************************************************************
         Memory to memory mode
        */
        alias MEM2MEM = Bit!(14, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 7 number of data register
    */
    final abstract class CNDTR7 : Register!(0x84)
    {
        /*********************************************************************
         Number of data to transfer
        */
        alias NDT = BitField!(15, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 7 peripheral address register
    */
    final abstract class CPAR7 : Register!(0x88)
    {
        /*********************************************************************
         Peripheral address
        */
        alias PA = BitField!(31, 0, Mutability.rw);
    }

    /*************************************************************************
     DMA channel 7 memory address register
    */
    final abstract class CMAR7 : Register!(0x8c)
    {
        /*********************************************************************
         Memory address
        */
        alias MA = BitField!(31, 0, Mutability.rw);
    }
}
