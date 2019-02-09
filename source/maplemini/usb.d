module maplemini.usb;

nothrow:
@safe:

import stm32f103xx.rcc;
import stm32f103xx.gpioa;
import stm32f103xx.nvic;
import stm32f103xx.usb;
import stm32f103xx.otg_fs_global;
import maplemini.trace;

package void interrupt()
{
    writeln!"Interrupt";
}

package void init()
{
    // From the Reference Manual:
    // For bidirectional Alternate Functions, the port bit must be configured in Alternate
    // Function Output mode (Push-Pull or Open-Drain). In this case the input driver is
    // configured in input floating mode

    // RCC.APB2ENR.AFIOEN = true;
    RCC.APB2ENR.IOPAEN = true;
    with(GPIOA.CRH)
    {
        setValue!
        (
              CNF11, 0b10   // Alternate function, push-pull
            , MODE11, 0b11  // full speed 50MHz
            , CNF12, 0b10   // Alternate function, push-pull
            , MODE12, 0b11  // full speed 50MHz
        );
    }

    RCC.APB1ENR.USBEN = true;

    USB.CNTR.PMAOVRM = true;
    USB.CNTR.CTRM = true;
    USB.CNTR.ERRM = true;
    USB.CNTR.WKUPM = true;
    USB.CNTR.SUSPM = true;
    USB.CNTR.RESETM = true;
    USB.CNTR.SOFM = true;
    USB.CNTR.ESOFM = true;

    // USB.CNTR.FRES = true;
    // USB.CNTR.PDWN = true;
    // writeln!"USB Reset";
    USB.CNTR.FRES = false;
    USB.CNTR.PDWN = false;

    // OTG_FS_GLOBAL.FS_GAHBCFG.GINT = true;

    NVIC.ISER0.SETENA = (1 << 19) | (1 << 20);
    NVIC.ISER1.SETENA = 0xFFFF_FFFF;
}