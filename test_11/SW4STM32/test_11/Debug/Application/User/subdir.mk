################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/tmp/1m/test_11/Src/can.c \
C:/tmp/1m/test_11/Src/gpio.c \
C:/tmp/1m/test_11/Src/main.c \
C:/tmp/1m/test_11/Src/stm32f4xx_hal_msp.c \
C:/tmp/1m/test_11/Src/stm32f4xx_it.c 

OBJS += \
./Application/User/can.o \
./Application/User/gpio.o \
./Application/User/main.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_it.o 

C_DEPS += \
./Application/User/can.d \
./Application/User/gpio.d \
./Application/User/main.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/can.o: C:/tmp/1m/test_11/Src/can.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/tmp/1m/test_11/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Include" -I"C:/tmp/1m/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/gpio.o: C:/tmp/1m/test_11/Src/gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/tmp/1m/test_11/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Include" -I"C:/tmp/1m/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/main.o: C:/tmp/1m/test_11/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/tmp/1m/test_11/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Include" -I"C:/tmp/1m/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_msp.o: C:/tmp/1m/test_11/Src/stm32f4xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/tmp/1m/test_11/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Include" -I"C:/tmp/1m/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_it.o: C:/tmp/1m/test_11/Src/stm32f4xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/tmp/1m/test_11/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/tmp/1m/test_11/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/tmp/1m/test_11/Drivers/CMSIS/Include" -I"C:/tmp/1m/test_11/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


