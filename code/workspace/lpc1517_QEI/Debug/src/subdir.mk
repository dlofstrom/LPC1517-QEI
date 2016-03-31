################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc15xx.c \
../src/crp.c \
../src/lpc1517_QEI.c \
../src/sysinit.c 

OBJS += \
./src/cr_startup_lpc15xx.o \
./src/crp.o \
./src/lpc1517_QEI.o \
./src/sysinit.o 

C_DEPS += \
./src/cr_startup_lpc15xx.d \
./src/crp.d \
./src/lpc1517_QEI.d \
./src/sysinit.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DCORE_M3 -D__USE_LPCOPEN -DNO_BOARD_LIB -D__USE_CMSIS_DSPLIB=CMSIS_DSPLIB_CM3 -D__LPC15XX__ -D__REDLIB__ -I"C:\Users\Daniel\Desktop\lpc1517\LPC1517-QEI\code\workspace\lpc_chip_15xx\inc" -I"C:\Users\Daniel\Desktop\lpc1517\LPC1517-QEI\code\workspace\CMSIS_DSPLIB_CM3\inc" -O0 -fno-common -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


