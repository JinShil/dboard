module stm32f103xx.dbg;

import stm32f103xx.mmio;

/*****************************************************************************
 Debug support
*/
final abstract class DBG : Peripheral!(0xE0042000)
{
    /*************************************************************************
     DBGMCU_IDCODE
    */
    final abstract class IDCODE : Register!(00)
    {
        /*********************************************************************
         DEV_ID
        */
        alias DEV_ID = BitField!(11, 0, Mutability.rw);

        /*********************************************************************
         REV_ID
        */
        alias REV_ID = BitField!(31, 16, Mutability.rw);
    }

    /*************************************************************************
     DBGMCU_CR
    */
    final abstract class CR : Register!(0x4)
    {
        /*********************************************************************
         DBG_SLEEP
        */
        alias DBG_SLEEP = Bit!(0, Mutability.rw);

        /*********************************************************************
         DBG_STOP
        */
        alias DBG_STOP = Bit!(1, Mutability.rw);

        /*********************************************************************
         DBG_STANDBY
        */
        alias DBG_STANDBY = Bit!(2, Mutability.rw);

        /*********************************************************************
         TRACE_IOEN
        */
        alias TRACE_IOEN = Bit!(5, Mutability.rw);

        /*********************************************************************
         TRACE_MODE
        */
        alias TRACE_MODE = BitField!(7, 6, Mutability.rw);

        /*********************************************************************
         DBG_IWDG_STOP
        */
        alias DBG_IWDG_STOP = Bit!(8, Mutability.rw);

        /*********************************************************************
         DBG_WWDG_STOP
        */
        alias DBG_WWDG_STOP = Bit!(9, Mutability.rw);

        /*********************************************************************
         DBG_TIM1_STOP
        */
        alias DBG_TIM1_STOP = Bit!(10, Mutability.rw);

        /*********************************************************************
         DBG_TIM2_STOP
        */
        alias DBG_TIM2_STOP = Bit!(11, Mutability.rw);

        /*********************************************************************
         DBG_TIM3_STOP
        */
        alias DBG_TIM3_STOP = Bit!(12, Mutability.rw);

        /*********************************************************************
         DBG_TIM4_STOP
        */
        alias DBG_TIM4_STOP = Bit!(13, Mutability.rw);

        /*********************************************************************
         DBG_CAN1_STOP
        */
        alias DBG_CAN1_STOP = Bit!(14, Mutability.rw);

        /*********************************************************************
         DBG_I2C1_SMBUS_TIMEOUT
        */
        alias DBG_I2C1_SMBUS_TIMEOUT = Bit!(15, Mutability.rw);

        /*********************************************************************
         DBG_I2C2_SMBUS_TIMEOUT
        */
        alias DBG_I2C2_SMBUS_TIMEOUT = Bit!(16, Mutability.rw);

        /*********************************************************************
         DBG_TIM8_STOP
        */
        alias DBG_TIM8_STOP = Bit!(17, Mutability.rw);

        /*********************************************************************
         DBG_TIM5_STOP
        */
        alias DBG_TIM5_STOP = Bit!(18, Mutability.rw);

        /*********************************************************************
         DBG_TIM6_STOP
        */
        alias DBG_TIM6_STOP = Bit!(19, Mutability.rw);

        /*********************************************************************
         DBG_TIM7_STOP
        */
        alias DBG_TIM7_STOP = Bit!(20, Mutability.rw);

        /*********************************************************************
         DBG_CAN2_STOP
        */
        alias DBG_CAN2_STOP = Bit!(21, Mutability.rw);
    }
}
