module maplemini.usb;

nothrow:
@safe:

import stm32f103xx.rcc;
import stm32f103xx.gpioa;
import stm32f103xx.gpiob;
import stm32f103xx.nvic;
import stm32f103xx.usb;
import stm32f103xx.otg_fs_global;
import maplemini.trace;
import stm32f103xx.mmio;

/*****************************************************************************
 Buffer descriptor table
*/
private final abstract class BTableTemplate(ubyte endPointNumber) 
    : Peripheral!(0x4000_6000 + (endPointNumber * 16))
{
    final abstract class TX_ADDR : Register!(0x00)
    {
        alias ADDR = BitField!(15, 0, Mutability.rw);
    }

    final abstract class TX_COUNT : Register!(0x04)
    {
        alias COUNT = BitField!(9, 0, Mutability.rw);
    }

    final abstract class RX_ADDR : Register!(0x08)
    {
        alias ADDR = BitField!(15, 0, Mutability.rw);
    }

    final abstract class RX_COUNT : Register!(0x0C)
    {
        alias COUNT = BitField!(9, 0, Mutability.rw);
        alias NUM_BLOCK = BitField!(14, 10, Mutability.rw);
        alias BLSIZE = Bit!(15, Mutability.rw);
    }
}

alias EndPoint0BTable = BTableTemplate!0;
alias EndPoint1BTable = BTableTemplate!1;

package void interrupt()
{
    if (USB.ISTR.ERR.value)
    {
        USB.ISTR.ERR = false;
        writeln!"ERR";
    }
    if (USB.ISTR.ESOF.value)
    {
        USB.ISTR.ESOF = false;
        // writeln!"ESOF";
    }
    if (USB.ISTR.SOF.value)
    {
        USB.ISTR.SOF = false;
        // writeln!"SOF";
    }
    if (USB.ISTR.RESET.value)
    {
        USB.ISTR.RESET = false;
        reset();
        // writeln!"RESET";
    }
    if (USB.ISTR.SUSP.value)
    {
        USB.ISTR.SUSP = false;
        suspend();
        // writeln!"SUSP";
    }
    if (USB.ISTR.WKUP.value)
    {
        USB.ISTR.WKUP = false;
        wakeup();
        // writeln!"WKUP";
    }
    
    if (USB.ISTR.PMAOVR.value)
        writeln!"PMAOVR";
    if (USB.ISTR.CTR.value)
        writeln!"CTR";
}

private void suspend()
{
    with (USB.CNTR)
    {
        setValue
        !(
              FSUSP, true
            , LPMODE, true
        );
    }
}

private void wakeup()
{
    // USB.CNTR.LPMODE = false;

    with (USB.CNTR)
    {
        setValue
        !(
              FSUSP, false
            , LPMODE, false
        );
    }
}

// References:
// http://kevincuzner.com/2018/01/29/bare-metal-stm32-writing-a-usb-driver/
// https://github.com/BudzonMichal/minUSBLib

private void reset()
{
    USB.BTABLE.BTABLE = 0;

    EndPoint0BTable.TX_ADDR.ADDR = 0x80;
    EndPoint0BTable.RX_ADDR.ADDR = 0x40;

    with(EndPoint0BTable.RX_COUNT)
    {
        setValue
        !(
              BLSIZE, 1     // block size 32 bytes
            , NUM_BLOCK, 2  // 2 blocks = 64 bytes
        );
    }

    with (USB.EP0R)
    {
        setValue
        !(
              EP_TYPE, 0b01  // control
            , EP_KIND, false  // STATUS_OUT
            , EA,      0b00  // address 0
            , STAT_TX, 0b01  // stall
            , STAT_RX, 0b11  // valid
        );
    }

    // if (USB.EP0R.value != 0b11_0_01_0_0_0_01_0000)
    // {
    //     writeln!"Not right";
    // }

    USB.EP1R.EA = 1;
    USB.EP2R.EA = 2;
    USB.EP3R.EA = 3;
    USB.EP4R.EA = 4;
    USB.EP5R.EA = 5;
    USB.EP6R.EA = 6;
    USB.EP7R.EA = 7;

    with(USB.DADDR)
    {
        setValue
        !(
              EF, true
            , ADD, 0
        );
    }
}

package void init()
{
    RCC.APB2ENR.AFIOEN = true;
    RCC.APB2ENR.IOPBEN = true;

    with(GPIOB.CRH)
    {
        setValue!
        (
              CNF9, 0b00   // push-pull
            , MODE9, 0b01  // output - 50MHz
        );
    }
    GPIOB.ODR.ODR9 = true;
    GPIOB.ODR.ODR9 = false;

    RCC.APB1ENR.USBEN = true;

    // power down and reset
    with(USB.CNTR)
    {
        setValue
        !(
              PDWN, true
            , FRES, true
        );
    }

    // power up
    USB.CNTR.PDWN = false;

    // mask interrupts
    with(USB.CNTR)
    {
        setValue
        !(
              PMAOVRM, false
            , CTRM,    false
            , ERRM,    false
            , WKUPM,   false
            , SUSPM,   false
            , RESETM,  false
            , SOFM,    false
            , ESOFM,   false
        );
    }

    // clear interrupts
    with(USB.ISTR)
    {
        setValue
        !(
              PMAOVR, false
            , CTR,    false
            , ERR,    false
            , WKUP,   false
            , SUSP,   false
            , RESET,  false
            , SOF,    false
            , ESOF,   false
        );
    }

    // unmask interrupts
    with(USB.CNTR)
    {
        setValue
        !(
              PMAOVRM, true
            , CTRM,    true
            , ERRM,    true
            , WKUPM,   true
            , SUSPM,   true
            , RESETM,  true
            , SOFM,    true
            , ESOFM,   true
        );
    }

    // enable interrupts
    NVIC.ISER0.SETENA = (1 << 19) | (1 << 20);
    NVIC.ISER1.SETENA = 0xFFFF_FFFF;

    // Should generate a reset interrupt here
    USB.CNTR.FRES = false;
}