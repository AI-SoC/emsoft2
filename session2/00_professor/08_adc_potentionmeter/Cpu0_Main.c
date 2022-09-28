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
#include "IfxVadc_reg.h"

// Port registers
#define PC1_BIT_LSB_IDX             11
#define PC2_BIT_LSB_IDX             19
#define PC3_BIT_LSB_IDX             27
#define PC5_BIT_LSB_IDX             11
#define PC7_BIT_LSB_IDX             27
#define P1_BIT_LSB_IDX              1
#define P2_BIT_LSB_IDX              2
#define P3_BIT_LSB_IDX              3
#define P5_BIT_LSB_IDX              5
#define P7_BIT_LSB_IDX              7

// SCU registers
#define LCK_BIT_LSB_IDX             1
#define ENDINIT_BIT_LSB_IDX         0
#define EXIS0_BIT_LSB_IDX           4
#define FEN0_BIT_LSB_IDX            8
#define EIEN0_BIT_LSB_IDX           11
#define INP0_BIT_LSB_IDX            12
#define IGP0_BIT_LSB_IDX            14

// SRC registers
#define SRPN_BIT_LSB_IDX            0
#define TOS_BIT_LSB_IDX             11
#define SRE_BIT_LSB_IDX             10

// CCU60 registers
#define DISS_BIT_LSB_IDX            1
#define DISR_BIT_LSB_IDX            0
#define CTM_BIT_LSB_IDX             7
#define T12PRE_BIT_LSB_IDX          3
#define T12CLK_BIT_LSB_IDX          0
#define T12STR_BIT_LSB_IDX          6
#define T12RS_BIT_LSB_IDX           1
#define INPT12_BIT_LSB_IDX          10
#define ENT12PM_BIT_LSB_IDX         7

// VADC registers
#define DISS_BIT_LSB_IDX            1
#define DISR_BIT_LSB_IDX            0
#define ANONC_BIT_LSB_IDX           0
#define ASEN0_BIT_LSB_IDX           24
#define CSM0_BIT_LSB_IDX            3
#define PRIO0_BIT_LSB_IDX           0
#define CMS_BIT_LSB_IDX             8
#define FLUSH_BIT_LSB_IDX           10
#define TREV_BIT_LSB_IDX            9
#define ENGT_BIT_LSB_IDX            0
#define RESPOS_BIT_LSB_IDX          21
#define RESREG_BIT_LSB_IDX          16
#define ICLSEL_BIT_LSB_IDX          0
#define VF_BIT_LSB_IDX              31
#define RESULT_BIT_LSB_IDX          0
#define ASSCH7_BIT_LSB_IDX          7



IfxCpu_syncEvent g_cpuSyncEvent = 0;

void initLED(void);
void initButton(void);
void initERU(void);
void initCCU60(void);
void initRGBLED(void);
void initVADC(void);
void VADC_startConversion(void);
unsigned int VADC_readResult(void);


//__interrupt(0x0A) __vector_table(0)
//void ERU0_ISR(void)
//{
//    P10_OUT.U ^= 0x1 << P1_BIT_LSB_IDX;  // toggle P10.1 (LED D12 RED)
//}

__interrupt(0x0B) __vector_table(0)
void CCU60_T12_ISR(void)
{
    P10_OUT.U ^= 0x1 << P2_BIT_LSB_IDX;  // toggle P10.2 (LED D13 BLUE)
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
    
    //initERU();
    //initCCU60();
    initLED();
    initRGBLED();
    initVADC();
    //initButton();

    unsigned int adcResult;

    while(1)
    {
        VADC_startConversion();
        adcResult = VADC_readResult();

        if( adcResult >= 3096 )
        {
            P02_OUT.U |= 0x1 << P7_BIT_LSB_IDX;
            P10_OUT.U &= ~(0x1 << P5_BIT_LSB_IDX);
            P10_OUT.U &= ~(0x1 << P3_BIT_LSB_IDX);
        }
        else if( adcResult >= 2048 )
        {
            P02_OUT.U &= ~(0x1 << P7_BIT_LSB_IDX);
            P10_OUT.U |= 0x1 << P5_BIT_LSB_IDX;
            P10_OUT.U &= ~(0x1 << P3_BIT_LSB_IDX);
        }
        else if( adcResult >= 1024 )
        {
            P02_OUT.U &= ~(0x1 << P7_BIT_LSB_IDX);
            P10_OUT.U &= ~(0x1 << P5_BIT_LSB_IDX);
            P10_OUT.U |= 0x1 << P3_BIT_LSB_IDX;
        }
        else
        {
            P02_OUT.U |= 0x1 << P7_BIT_LSB_IDX;
            P10_OUT.U |= 0x1 << P5_BIT_LSB_IDX;
            P10_OUT.U |= 0x1 << P3_BIT_LSB_IDX;
        }

    }
    return (1);
}

void initLED(void)
{
    P10_IOCR0.U &= ~(0x1F << PC1_BIT_LSB_IDX);     // reset P10_IOCR0 PC1
    P10_IOCR0.U &= ~(0x1F << PC2_BIT_LSB_IDX);     // reset P10_IOCR0 PC2

    P10_IOCR0.U |= 0x10 << PC1_BIT_LSB_IDX;        // set P10.1 push-pull general output
    P10_IOCR0.U |= 0x10 << PC2_BIT_LSB_IDX;        // set P10.2 push-pull general output
}

void initButton(void)
{
    P02_IOCR0.U &= ~(0x1F << PC1_BIT_LSB_IDX);       // reset P02_IOCR0 PC1

    P02_IOCR0.U |= 0x02 << PC1_BIT_LSB_IDX;          // set P02.1 general input (pull-up connected)
}

void initERU(void)
{
    // ERU setting
    SCU_EICR1.U &= ~(0x7 << EXIS0_BIT_LSB_IDX);
    SCU_EICR1.U |= (0x1  << EXIS0_BIT_LSB_IDX);

    SCU_EICR1.U |= 0x1   << FEN0_BIT_LSB_IDX;

    SCU_EICR1.U |= 0x1   << EIEN0_BIT_LSB_IDX;

    SCU_EICR1.U &= ~(0x7 << INP0_BIT_LSB_IDX);

    SCU_IGCR0.U &= ~(0x3 << IGP0_BIT_LSB_IDX);
    SCU_IGCR0.U |= 0x1   << IGP0_BIT_LSB_IDX;

    // SRC Interrupt setting
    SRC_SCU_SCU_ERU0.U &= ~(0xFF << SRPN_BIT_LSB_IDX);
    SRC_SCU_SCU_ERU0.U |= 0x0A   << SRPN_BIT_LSB_IDX;

    SRC_SCU_SCU_ERU0.U &= ~(0x3  << TOS_BIT_LSB_IDX);

    SRC_SCU_SCU_ERU0.U |= 1      << SRE_BIT_LSB_IDX;
}

void initCCU60(void)
{
    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to clear ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) & ~(1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked

    CCU60_CLC.U &= ~(1 << DISR_BIT_LSB_IDX);    // enable CCY

    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to set ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked


    // CCU60 T12 configurations
    while((CCU60_CLC.U & (1 << DISS_BIT_LSB_IDX)) != 0);// wait until CCU60 module enabled

    CCU60_TCTR0.U &= ~(0x7 << T12CLK_BIT_LSB_IDX);      // f_T12 = f_CCU6 / prescaler
    CCU60_TCTR0.U |= 0x2 << T12CLK_BIT_LSB_IDX;         // f_CCU6 = 50 MHz, prescaler = 1024
    CCU60_TCTR0.U |= 0x1 << T12PRE_BIT_LSB_IDX;         // f_T12 = 48,828 Hz

    CCU60_TCTR0.U &= ~(0x1 << CTM_BIT_LSB_IDX);         // T12 auto reset when period match (PM) occur


    CCU60_T12PR.U = 24414 -1;                       // PM interrupt freq. = f_T12 / (T12PR + 1)
    CCU60_TCTR4.U |= 0x1 << T12STR_BIT_LSB_IDX;         // load T12PR from shadow register

    CCU60_T12.U = 0;                                // clear T12 counter register


    // CCU60 T12 PM interrupt setting
    CCU60_INP.U &= ~(0x3 << INPT12_BIT_LSB_IDX);        // service request output SR0 selected
    CCU60_IEN.U |= 0x1 << ENT12PM_BIT_LSB_IDX;          // enable T12 PM interrupt


    // SRC setting for CCU60
    SRC_CCU6_CCU60_SR0.U &= ~(0xFF << SRPN_BIT_LSB_IDX);
    SRC_CCU6_CCU60_SR0.U |= 0x0B << SRPN_BIT_LSB_IDX;   // set priority 0x0B

    SRC_CCU6_CCU60_SR0.U &= ~(0x3 << TOS_BIT_LSB_IDX);  // CPU0 service T12 PM interrupt

    SRC_CCU6_CCU60_SR0.U |= 0x1 << SRE_BIT_LSB_IDX;     // SR0 enabled


    // CCU60 T12 counting start
    CCU60_TCTR4.U = 0x1 << T12RS_BIT_LSB_IDX;           // T12 start counting
}

void initRGBLED(void)
{
    // reset Port IOCR register
    P02_IOCR4.U &= ~(0x1F << PC7_BIT_LSB_IDX);
    P10_IOCR4.U &= ~(0x1F << PC5_BIT_LSB_IDX);
    P10_IOCR0.U &= ~(0x1F << PC3_BIT_LSB_IDX);

    // set Port as general purpose output (push-pull)
    P02_IOCR4.U |= 0x10 << PC7_BIT_LSB_IDX;
    P10_IOCR4.U |= 0x10 << PC5_BIT_LSB_IDX;
    P10_IOCR0.U |= 0x10 << PC3_BIT_LSB_IDX;
}

void initVADC(void)
{
    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to clear ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) & ~(1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);    // wait until locked

    VADC_CLC.U &= ~(1 << DISR_BIT_LSB_IDX);    // enable VADC

    // Password Access to unlock SCU_WDTSCON0
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) & ~(1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) != 0);    // wait until unlocked

    // Modify Access to set ENDINIT
    SCU_WDTCPU0_CON0.U = ((SCU_WDTCPU0_CON0.U ^ 0xFC) | (1 << LCK_BIT_LSB_IDX)) | (1 << ENDINIT_BIT_LSB_IDX);
    while((SCU_WDTCPU0_CON0.U & (1 << LCK_BIT_LSB_IDX)) == 0);


    // VADC configurations
    while((VADC_CLC.U & (1 << DISS_BIT_LSB_IDX)) != 0); // wait until VADC module enabled

    VADC_G4_ARBPR.U |= 0x3 << PRIO0_BIT_LSB_IDX;         // highest priority for Request Source 0
    VADC_G4_ARBPR.U &= ~(0x1 << CSM0_BIT_LSB_IDX);       // Wait-for-Start Mode
    VADC_G4_ARBPR.U |= 0x1 << ASEN0_BIT_LSB_IDX;         // Arbitration Source Input 0 Enable

    VADC_G4_QMR0.U &= ~(0x3 << ENGT_BIT_LSB_IDX);
    VADC_G4_QMR0.U |= 0x1 << ENGT_BIT_LSB_IDX;          // enable conversion request
    VADC_G4_QMR0.U |= 0x1 << FLUSH_BIT_LSB_IDX;         // clear ADC queue

    VADC_G4_ARBCFG.U |= 0x3 << ANONC_BIT_LSB_IDX;       // ADC normal operation

    VADC_G4_ICLASS0.U &= ~(0x7 << CMS_BIT_LSB_IDX);     // Class 0 Standard Conversion (12-bit)


    // VADC Group 4 Channel 7 configuration
    VADC_G4_CHCTR7.U |= 0x1 << RESPOS_BIT_LSB_IDX;      // result right-aligned
    VADC_G4_CHCTR7.U &= ~(0xF << RESREG_BIT_LSB_IDX);   // store result @ Result Register G4RES0
    VADC_G4_CHCTR7.U &= ~(0x3 << ICLSEL_BIT_LSB_IDX);   // Class 0

    VADC_G4_CHASS.U |= 0x1 << ASSCH7_BIT_LSB_IDX;
}

void VADC_startConversion(void)
{
    VADC_G4_QINR0.U |= 0x07;                    // no. of Request Channel = 7

    VADC_G4_QMR0.U |= 0x1 << TREV_BIT_LSB_IDX;  // Generate Conversion Start Trigger Event
}

unsigned int VADC_readResult(void)
{
    unsigned int result;

    while( (VADC_G4_RES0.U & (0x1 << VF_BIT_LSB_IDX)) == 0 );   // wait until read available
    result = VADC_G4_RES0.U & (0xFFF << RESULT_BIT_LSB_IDX);    // read ADC value

    return result;
}
