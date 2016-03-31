################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/acmp_15xx.c \
../src/adc_15xx.c \
../src/chip_15xx.c \
../src/clock_15xx.c \
../src/crc_15xx.c \
../src/dac_15xx.c \
../src/dma_15xx.c \
../src/eeprom.c \
../src/gpio_15xx.c \
../src/i2c_common_15xx.c \
../src/i2cm_15xx.c \
../src/i2cs_15xx.c \
../src/iap.c \
../src/iocon_15xx.c \
../src/pinint_15xx.c \
../src/pmu_15xx.c \
../src/ring_buffer.c \
../src/ritimer_15xx.c \
../src/rtc_15xx.c \
../src/sct_15xx.c \
../src/sct_pwm_15xx.c \
../src/sctipu_15xx.c \
../src/spi_15xx.c \
../src/stopwatch_15xx.c \
../src/swm_15xx.c \
../src/sysctl_15xx.c \
../src/sysinit_15xx.c \
../src/uart_15xx.c \
../src/wwdt_15xx.c 

OBJS += \
./src/acmp_15xx.o \
./src/adc_15xx.o \
./src/chip_15xx.o \
./src/clock_15xx.o \
./src/crc_15xx.o \
./src/dac_15xx.o \
./src/dma_15xx.o \
./src/eeprom.o \
./src/gpio_15xx.o \
./src/i2c_common_15xx.o \
./src/i2cm_15xx.o \
./src/i2cs_15xx.o \
./src/iap.o \
./src/iocon_15xx.o \
./src/pinint_15xx.o \
./src/pmu_15xx.o \
./src/ring_buffer.o \
./src/ritimer_15xx.o \
./src/rtc_15xx.o \
./src/sct_15xx.o \
./src/sct_pwm_15xx.o \
./src/sctipu_15xx.o \
./src/spi_15xx.o \
./src/stopwatch_15xx.o \
./src/swm_15xx.o \
./src/sysctl_15xx.o \
./src/sysinit_15xx.o \
./src/uart_15xx.o \
./src/wwdt_15xx.o 

C_DEPS += \
./src/acmp_15xx.d \
./src/adc_15xx.d \
./src/chip_15xx.d \
./src/clock_15xx.d \
./src/crc_15xx.d \
./src/dac_15xx.d \
./src/dma_15xx.d \
./src/eeprom.d \
./src/gpio_15xx.d \
./src/i2c_common_15xx.d \
./src/i2cm_15xx.d \
./src/i2cs_15xx.d \
./src/iap.d \
./src/iocon_15xx.d \
./src/pinint_15xx.d \
./src/pmu_15xx.d \
./src/ring_buffer.d \
./src/ritimer_15xx.d \
./src/rtc_15xx.d \
./src/sct_15xx.d \
./src/sct_pwm_15xx.d \
./src/sctipu_15xx.d \
./src/spi_15xx.d \
./src/stopwatch_15xx.d \
./src/swm_15xx.d \
./src/sysctl_15xx.d \
./src/sysinit_15xx.d \
./src/uart_15xx.d \
./src/wwdt_15xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DDEBUG -D__CODE_RED -D__USE_LPCOPEN -DCORE_M3 -I"C:\Users\Daniel\Desktop\lpc1517\LPC1517-QEI\code\workspace\lpc_chip_15xx\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


