/**********************************************************************************************************************
 * \file Cpu0_Main.c
 * \copyright Copyright (C) Infineon Technologies AG 2019
 * 
 * Use of this file is subject to the terms of use agreed between (i) you or the company in which ordinary course of 
 * business you are acting and (ii) Infineon Technologies AG or its licensees. If and as long as no such terms of use
 * are agreed, use of this file is subject to following:
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization obtaining a copy of the software and 
 * accompanying documentation covered by this license (the "Software") to use, reproduce, display, distribute, execute,
 * and transmit the Software, and to prepare derivative works of the Software, and to permit third-parties to whom the
 * Software is furnished to do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including the above license grant, this restriction
 * and the following disclaimer, must be included in all copies of the Software, in whole or in part, and all 
 * derivative works of the Software, unless such copies or derivative works are solely in the form of 
 * machine-executable object code generated by a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE 
 * COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN 
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
 * IN THE SOFTWARE.
 *********************************************************************************************************************/
#include "Ifx_Types.h"
#include "IfxCpu.h"
#include "IfxScuWdt.h"

#include "IfxCcu6_reg.h"
#include "IfxGtm_reg.h"

// SCU registers
#define LCK_BIT_LSB_IDX             1
#define ENDINIT_BIT_LSB_IDX         0

// GTM registers
#define DISS_BIT_LSB_IDX            1
#define DISR_BIT_LSB_IDX            0

IfxCpu_syncEvent g_cpuSyncEvent = 0;

void initLED(void);
void initERU(void);
void initCCU60(void);
void initCCU61(void);
void usonicTrigger_1(void);
void usonicTrigger_2(void);
void initUSonic(void);
void initGTM(void);

unsigned int range_1, range_2;
unsigned char range_valid_flag_1 = 0;
unsigned char range_valid_flag_2 = 0;


__interrupt(0x0A) __vector_table(0)
void ERU0_ISR(void)
{
    if( P15_IN.B.P4 != 0x0 )     // rising edge of echo
    {
        //                    _________
        //        echo ______|
        //                   ^
        CCU61_TCTR4.B.T12RS = 0x1;       // start CCU61 T12 counter
    }
    else    // falling edge of echo
    {
        //             ______
        //        echo       |______
        //                   ^
        CCU61_TCTR4.B.T12RR = 0x1;       // stop CCU61 T12 counter

        // (1 / t_freq) * counter * 1000000 / 58  =  centimeter
        range_1 = ((CCU61_T12.B.T12CV * 1000000) / 48828) / 58;
        range_valid_flag_1 = 1;

        CCU61_TCTR4.B.T12RES = 0x1;       // reset CCU61 T12 counter
    }
}

__interrupt(0x0E) __vector_table(0)
void ERU2_ISR(void)
{
    if( P00_IN.B.P4 != 0x0 )     // rising edge of echo
    {
        //                    _________
        //        echo ______|
        //                   ^
        CCU61_TCTR4.B.T13RS = 0x1;       // start CCU61 T13 counter
    }
    else    // falling edge of echo
    {
        //             ______
        //        echo       |______
        //                   ^
        CCU61_TCTR4.B.T13RR = 0x1;       // stop CCU61 T13 counter

        // (1 / t_freq) * counter * 1000000 / 58  =  centimeter
        range_2 = ((CCU61_T13.B.T13CV * 1000000) / 48828) / 58;
        range_valid_flag_2 = 1;

        CCU61_TCTR4.B.T13RES = 0x1;       // reset CCU61 T13 counter
    }
}

__interrupt(0x0B) __vector_table(0)
void CCU60_T12_ISR(void)
{
    // end of 10us Trig
    // GPIO P02.6 --> LOW
    P02_OUT.B.P6 = 0x0;
}

__interrupt(0x0C) __vector_table(0)
void CCU60_T13_ISR(void)
{
    // end of 10us Trig
    // GPIO P02.5 --> LOW
    P02_OUT.B.P5 = 0x0;
}


int core0_main(void)
{
    IfxCpu_enableInterrupts();
    
    /* !!WATCHDOG0 AND SAFETY WATCHDOG ARE DISABLED HERE!!
     * Enable the watchdogs and service them periodically if it is required
     */
    IfxScuWdt_disableCpuWatchdog(IfxScuWdt_getCpuWatchdogPassword());
    IfxScuWdt_disableSafetyWatchdog(IfxScuWdt_getSafetyWatchdogPassword());
    
    /* Wait for CPU sync event */
    IfxCpu_emitEvent(&g_cpuSyncEvent);
    IfxCpu_waitEvent(&g_cpuSyncEvent, 1);
    
    initGTM();
    initERU();
    initCCU60();
    initCCU61();
    initLED();
    initUSonic();

    while(1)
    {
        for(unsigned int i = 0; i < 10000000; i++);

        usonicTrigger_1();
        while( range_valid_flag_1 == 0  );
        for(unsigned int i = 0; i < 12500; i++) {
            GTM_TOM0_CH1_SR1.U = i;
            for(unsigned int j = 0; j < 2000; j++);
        }
        for(unsigned int i = 0; i < 5000; i++);
        for(unsigned int i = 12500; i > 0; i--) {
            GTM_TOM0_CH1_SR1.U = i;
            for(unsigned int j = 0; j < 2000; j++);
        }
        for(unsigned int i = 0; i < (range_1 * 500000); i++);


        usonicTrigger_2();
        while( range_valid_flag_2 == 0  );
        for(unsigned int i = 0; i < 12500; i++) {
            GTM_TOM0_CH2_SR1.U = i;
            for(unsigned int j = 0; j < 2000; j++);
        }
        for(unsigned int i = 0; i < 5000; i++);
        for(unsigned int i = 12500; i > 0; i--) {
            GTM_TOM0_CH2_SR1.U = i;
            for(unsigned int j = 0; j < 2000; j++);
        }
        for(unsigned int i = 0; i < (range_2 * 500000); i++);

    }
    return (1);
}

void initLED(void)
{
    P10_IOCR0.B.PC1 = 0x11;     // set P10.1 GTM PWM output
    P10_IOCR0.B.PC2 = 0x11;     // set P10.2 GTM PWM output
}

void initERU(void)
{
    // Ultrasonic 1 Echo
    SCU_EICR0.B.EXIS0 = 0x0;    // ERS0 - In00
    SCU_EICR0.B.FEN0  = 0x1;    // falling edge
    SCU_EICR0.B.REN0  = 0x1;    // rising edge
    SCU_EICR0.B.EIEN0 = 0x1;
    SCU_EICR0.B.INP0  = 0x0;
    SCU_IGCR0.B.IGP0  = 0x1;

    // SRC Interrupt setting
    SRC_SCU_SCU_ERU0.B.SRPN = 0x0A;
    SRC_SCU_SCU_ERU0.B.TOS  = 0x00;
    SRC_SCU_SCU_ERU0.B.SRE  = 0x01;

    // Ultrasonic 2 Echo
    SCU_EICR1.B.EXIS0 = 0x2;    // ERS2 - Input 2 (P00.4)
    SCU_EICR1.B.FEN0  = 0x1;    // falling edge
    SCU_EICR1.B.REN0  = 0x1;
    SCU_EICR1.B.EIEN0 = 0x1;
    SCU_EICR1.B.INP0  = 0x1;    // OGU0
    SCU_IGCR0.B.IGP1  = 0x1;

    // SRC Interrupt setting
    SRC_SCU_SCU_ERU1.B.SRPN = 0x0E;
    SRC_SCU_SCU_ERU1.B.TOS  = 0x0;
    SRC_SCU_SCU_ERU1.B.SRE  = 0x1;
}

void initCCU60(void)
{
    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked
    // Modify Access to clear ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) & ~(1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked
    CCU60_CLC.U &= ~(1 << DISR_BIT_LSB_IDX);    // enable CCU
    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked
    // Modify Access to set ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked
    // CCU60 T12 configurations
    while((CCU60_CLC.U & (1 << DISS_BIT_LSB_IDX)) != 0);// wait until CCU60 module enabled

    // T12 configurations
    CCU60_TCTR0.B.T12CLK = 0x2;                     // f_CCU6 = 50 MHz, prescaler = 4
//    CCU60_TCTR0.U |= 0x1 << T12PRE_BIT_LSB_IDX;   // f_T12 --> 12.5 MHz
    CCU60_TCTR0.B.CTM = 0x0;                        // T12 auto reset when period match (PM) occur
    CCU60_T12PR.B.T12PV = 125 - 1;                  // PM interrupt freq. = f_T12 / (T12PR + 1)
    CCU60_TCTR4.B.T12STR = 0x1;                     // load T12PR from shadow register
    CCU60_TCTR2.B.T12SSC = 0x1;                     // Single Shot Control
    CCU60_T12.B.T12CV = 0x0;                        // clear T12 counter register
    CCU60_INP.B.INPT12 = 0x0;                       // service request output SR0 selected
    CCU60_IEN.B.ENT12PM = 0x1;                      // enable T12 PM interrupt
    SRC_CCU6_CCU60_SR0.B.SRPN = 0x0B;               // set priority 0x0B
    SRC_CCU6_CCU60_SR0.B.TOS = 0x0;                 // CPU0 service T12 PM interrupt
    SRC_CCU6_CCU60_SR0.B.SRE = 0x1;                 // SR0 enabled

    // T13 configurations
    CCU60_TCTR0.B.T13CLK = 0x2;                     // f_CCU6 = 50 MHz, prescaler = 4
//    CCU60_TCTR0.B.T13PRE = 0x1;                   // f_T13 --> 12.5 MHz
    CCU60_TCTR0.B.CTM = 0x0;                        // T13 auto reset when period match (PM) occur
    CCU60_T13PR.B.T13PV = 125 - 1;
    CCU60_TCTR4.B.T13STR = 0x1;
    CCU60_TCTR2.B.T13SSC = 0x1;                     // Single Shot Control
    CCU60_T13.B.T13CV = 0x0;
    CCU60_IEN.B.ENT13PM = 0x1;
    CCU60_INP.B.INPT13 = 0x1;
    SRC_CCU6_CCU60_SR1.B.SRPN = 0x0C;
    SRC_CCU6_CCU60_SR1.B.TOS = 0x0;
    SRC_CCU6_CCU60_SR1.B.SRE = 0x1;
}

void initGTM(void)
{
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0XFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);

    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0XFC) | (1 << LCK_BIT_LSB_IDX)) & ~(1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);

    GTM_CLC.U &= ~(1 << DISR_BIT_LSB_IDX); // enable VADC

    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);

    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);

    while((GTM_CLC.U & (1 << DISS_BIT_LSB_IDX)) != 0);

    GTM_CMU_CLK_EN.B.EN_FXCLK = 0x2;

    // P10.1 -> TOM0_1 -> TOUT103
    GTM_TOM0_TGC0_GLB_CTRL.B.UPEN_CTRL1 = 0x2;
    GTM_TOM0_TGC0_ENDIS_CTRL.B.ENDIS_CTRL1 = 0x2;
    GTM_TOM0_TGC0_OUTEN_CTRL.B.OUTEN_CTRL1 = 0x2;
    GTM_TOM0_CH1_CTRL.B.SL = 0x1;
    GTM_TOM0_CH1_CTRL.B.CLK_SRC_SR = 0x1;
    GTM_TOM0_CH1_SR0.B.SR0 = 12500 - 1;
    GTM_TOM0_CH1_SR1.B.SR1 = 12500 - 1;
    GTM_TOUTSEL6.B.SEL15 = 0x0;

    // P10.2 -> TOM0_2 -> TOUT104
    GTM_TOM0_TGC0_GLB_CTRL.B.UPEN_CTRL2 = 0x2;
    GTM_TOM0_TGC0_ENDIS_CTRL.B.ENDIS_CTRL2 = 0x2;
    GTM_TOM0_TGC0_OUTEN_CTRL.B.OUTEN_CTRL2 = 0x2;
    GTM_TOM0_CH2_CTRL.B.SL = 0x1;
    GTM_TOM0_CH2_CTRL.B.CLK_SRC_SR = 0x1;
    GTM_TOM0_CH2_SR0.B.SR0 = 12500 - 1;
    GTM_TOM0_CH2_SR1.B.SR1 = 12500 - 1;
    GTM_TOUTSEL7.B.SEL0 = 0x0;

    GTM_TOM0_TGC0_GLB_CTRL.B.HOST_TRIG = 0x1;
}

void initCCU61(void)
{
    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to clear ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) & ~(1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked

    CCU61_CLC.U &= ~(1 << DISR_BIT_LSB_IDX);    // enable CCU

    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to set ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked

    // CCU60 T12 configurations
    while((CCU61_CLC.U & (1 << DISS_BIT_LSB_IDX)) != 0);// wait until CCU60 module enabled

    // f_T12 = f_CCU6 / prescaler = 12.5 MHz
    CCU61_TCTR0.B.T12CLK = 0x2;         // f_CCU6 = 50 MHz, prescaler = 4
    CCU61_TCTR0.B.T12PRE = 0x1;         // f_T12 = f_CCU6 / 256 = 48,828 Hz
    CCU61_T12PR.B.T12PV = 100000 -1;    // PM interrupt freq. = f_T12 / (T12PR + 1)
    CCU61_TCTR4.B.T12STR = 0x1;         // load T12PR from shadow register
    CCU61_T12.B.T12CV = 0x0;            // clear T12 counter register

    CCU61_TCTR0.B.T13CLK = 0x2;         // f_CCU6 = 50 MHz, prescaler = 4
    CCU61_TCTR0.B.T13PRE = 0x1;         // f_T13 = f_CCU6 / 256 = 48,828 Hz
    CCU61_T13PR.B.T13PV = 100000 -1;    // PM interrupt freq. = f_T13 / (T13PR + 1)
    CCU61_TCTR4.B.T13STR = 0x1;         // load T13PR from shadow register
    CCU61_T13.B.T13CV = 0x0;            // clear T13 counter register
}

void initUSonic(void)
{
    // USonic 1
    P15_IOCR4.B.PC4 = 0x01;        // set P15.4 general input (pull-down connected) [Echo]
    P02_IOCR4.B.PC6 = 0x10;        // set P02.6 push-pull general output            [Trig]
    P02_OUT.B.P6 = 0x0;

    // Usonic 2
    P00_IOCR4.B.PC4 = 0x01;        // set P00.4 general input (pull-down connected) [Echo]
    P02_IOCR4.B.PC5 = 0x10;        // set P02.5 push-pull general output            [Trig]
    P02_OUT.B.P5 = 0x0;
}

void usonicTrigger_1(void)
{
    // start of 10us Trigger Pulse
    // GPIO P02.6 --> HIGH
    P02_OUT.B.P6 = 0x1;
    range_valid_flag_1 = 0;
    CCU60_TCTR4.B.T12RS = 0x1;           // T12 start counting
}

void usonicTrigger_2(void)
{
    // start of 10us Trigger Pulse
    // GPIO P02.5 --> HIGH
    P02_OUT.B.P5 = 0x1;
    range_valid_flag_2 = 0;
    CCU60_TCTR4.B.T13RS = 0x1;           // T13 start counting
}
