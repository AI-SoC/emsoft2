
#include "Ifx_Types.h"
#include "IfxCpu.h"
#include "IfxScuWdt.h"

// Port registers
#define PC1_BIT_LSB_IDX             11
#define PC2_BIT_LSB_IDX             19
#define P1_BIT_LSB_IDX              1
#define P2_BIT_LSB_IDX              2


void initLED(void);



IfxCpu_syncEvent g_cpuSyncEvent = 0;




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

    /* 
     do yourself here
    */
    while(1) {
        // 1. GPIO OUT
        for(uint32 i = 0; i < 10000000; i++);   // delay
        P10_OUT.U ^= 0x1 << P1_BIT_LSB_IDX;                  // toggle P10.1 (LED D12 RED)

        for(uint32 i = 0; i < 10000000; i++);   // delay
        P10_OUT.U ^= 0x1 << P2_BIT_LSB_IDX;;                 // toggle P10.2 (LED D13 BLUE)
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
