/*
===============================================================================
 Name        : lpc1517_QEI.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/

#if defined (__USE_LPCOPEN)
#if defined(NO_BOARD_LIB)
#include "chip.h"
#else
#include "board.h"
#endif
#endif

#include <cr_section_macros.h>

// TODO: insert other include files here
// TODO: insert other definitions and declarations here

//Uart ring buffers
STATIC RINGBUFF_T txring, rxring;
#define UART_SRB_SIZE 128
#define UART_RRB_SIZE 32
static uint8_t rxbuff[UART_RRB_SIZE], txbuff[UART_SRB_SIZE];

const char inst1[] = "LPC1517 UART test\r\n";
const char inst2[] = "Keys are echoed back and ESC quits\r\n";

//Uart interrupt handler
void UART0_IRQHandler(void)
{
	//LED_Toggle();
	//Use default ringbuffer
	Chip_UART_IRQRBHandler(LPC_USART0, &rxring, &txring);
}



//QEI
#define LPC_QEI ((LPC_QEI_T*) LPC_QEI_BASE)

//QEI block structure
typedef struct {				//QEI Structure
	__O  uint32_t  CON;			//Control register
	__I  uint32_t  STAT;		//Encoder status register
	__IO uint32_t  CONF;		//Configuration register
	__I  uint32_t  POS;			//Position register
	__IO uint32_t  MAXPOS;		//Maximum position register
	__IO uint32_t  CMPOS0;		//position compare register 0
	__IO uint32_t  CMPOS1;		//position compare register 1
	__IO uint32_t  CMPOS2;		//position compare register 2
	__I  uint32_t  INXCNT;		//Index count register
	__IO uint32_t  INXCMP0;		//Index compare register 0
	__IO uint32_t  LOAD;		//Velocity timer reload register
	__I  uint32_t  TIME;		//Velocity timer register
	__I  uint32_t  VEL;			//Velocity counter register
	__I  uint32_t  CAP;			//Velocity capture register
	__IO uint32_t  VELCOMP;		//Velocity compare register
	__IO uint32_t  FILTERPHA;	//Digital filter register on input phase A (QEI_A)
	__IO uint32_t  FILTERPHB;	//Digital filter register on input phase B (QEI_B)
	__IO uint32_t  FILTERINX;	//Digital filter register on input index (QEI_IDX)
	__IO uint32_t  WINDOW;		//Index acceptance window register
	__IO uint32_t  INXCMP1;		//Index compare register 1
	__IO uint32_t  INXCMP2;		//Index compare register 2
	__I  uint32_t  RESERVED0[0x3E1];//933 gap
	__O  uint32_t  IEC;			//Interrupt enable clear register
	__O  uint32_t  IES;			//Interrupt enable set register
	__I  uint32_t  INTSTAT;		//Interrupt status register
	__I  uint32_t  IE;			//Interrupt enable register
	__O  uint32_t  CLR;			//Interrupt status clear register
	__O  uint32_t  SET;			//Interrupt status set register
} LPC_QEI_T;




int main(void) {

#if defined (__USE_LPCOPEN)
    // Read clock settings and update SystemCoreClock variable
    SystemCoreClockUpdate();
#if !defined(NO_BOARD_LIB)
    // Set up and initialize all required blocks and
    // functions related to the board hardware
    Board_Init();
    // Set the LED to the state of "On"
    Board_LED_Set(0, true);
#endif
#endif

    // TODO: insert code here

    //Init chip GPIO
    Chip_GPIO_Init(LPC_GPIO);

    //Uart pins
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 15, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 14, (IOCON_FUNC0 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));
	Chip_SWM_Init();
	Chip_SWM_DisableFixedPin(SWM_FIXED_ADC1_8); //Disable fixed pin on 23 for TX
	Chip_SWM_MovablePortPinAssign(SWM_UART0_TXD_O, 0, 15); //PINASSIGN0 bit 7:0 PIO0_0
	Chip_SWM_DisableFixedPin(SWM_FIXED_ADC1_7); //Disable fixed pin on 22 for RX
	Chip_SWM_MovablePortPinAssign(SWM_UART0_RXD_I, 0, 14); //PINASSIGN0 bit 7:0 PIO0_1

	//Uart clock
	//Chip_Clock_SetUARTBaseClockRate(Chip_Clock_GetMainClockRate(), false);
	Chip_Clock_SetUARTBaseClockRate((9600 * 128), true);
	Chip_UART_Init(LPC_USART0);
	Chip_UART_ConfigData(LPC_USART0, UART_CFG_DATALEN_8 | UART_CFG_PARITY_NONE | UART_CFG_STOPLEN_1);
	Chip_UART_SetBaud(LPC_USART0, 9600);
	Chip_UART_Enable(LPC_USART0);
	Chip_UART_TXEnable(LPC_USART0);

	//Init ring buffers
	RingBuffer_Init(&rxring, rxbuff, 1, UART_RRB_SIZE);
	RingBuffer_Init(&txring, txbuff, 1, UART_SRB_SIZE);

	//Enable interrupt
	Chip_UART_IntEnable(LPC_USART0, UART_INTEN_RXRDY);
	Chip_UART_IntDisable(LPC_USART0, UART_INTEN_TXRDY);
	//NVIC_SetPriority(UART0_IRQn, 1);
	NVIC_EnableIRQ(UART0_IRQn);


	//Write Uart string
	Chip_UART_SendBlocking(LPC_USART0, inst1, sizeof(inst1) - 1);


	//Set LED
	Chip_GPIO_SetPinDIROutput(LPC_GPIO, 2, 13);
	Chip_GPIO_WritePortBit(LPC_GPIO, 2, 13, true);


	// Enter an infinite loop
	uint8_t key = 0;
	int bytes;

	while (key != 27) {
		bytes = Chip_UART_ReadRB(LPC_USART0, &rxring, &key, 1);
		if (bytes > 0) {
			/* Wrap value back around */
			if (Chip_UART_SendRB(LPC_USART0, &txring, (const uint8_t *) &key, 1) != 1) {
				/* Toggle LED if the TX FIFO is full */
			}
		}
	}


    //DeInit Uart
    NVIC_DisableIRQ(UART0_IRQn);
    Chip_UART_DeInit(LPC_USART0);

    return 0 ;
}
