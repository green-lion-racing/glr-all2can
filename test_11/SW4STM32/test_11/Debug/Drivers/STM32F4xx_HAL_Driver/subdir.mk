################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 

OBJS += \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_can.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_cortex.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma_ex.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ex.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ramfunc.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_gpio.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr_ex.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc_ex.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim.o \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim_ex.o 

C_DEPS += \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_can.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_cortex.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma_ex.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ex.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ramfunc.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_gpio.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr_ex.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc_ex.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim.d \
./Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim_ex.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_can.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_cortex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_dma_ex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_flash_ramfunc.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_gpio.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_pwr_ex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_rcc_ex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32F4xx_HAL_Driver/stm32f4xx_hal_tim_ex.o: C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Git/All2Can-STM32F407/test_11/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Git/All2Can-STM32F407/test_11/Drivers/CMSIS/Include" -I"C:/Git/All2Can-STM32F407/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


