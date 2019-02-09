module maplemini.led;

nothrow:
@safe:

import stm32f103xx.rcc;
import stm32f103xx.gpiob;

package void init()
{
    RCC.APB2ENR.IOPBEN = true;
    with(GPIOB.CRL)
    {
        setValue!
        (
              CNF1, 0b00   // push-pull
            , MODE1, 0b11  // full speed 50MHz
        );
    }
}

public @inline pragma(inline, true) void on()
{
    GPIOB.ODR.ODR1 = true;
}

public @inline pragma(inline, true) void off()
{
    GPIOB.ODR.ODR1 = false;
}

public @inline pragma(inline, true) void toggle()
{
    GPIOB.ODR.ODR1 = !GPIOB.ODR.ODR1;
}