################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/MAX30102/max30102_for_stm32_hal.c 

OBJS += \
./Drivers/MAX30102/max30102_for_stm32_hal.o 

C_DEPS += \
./Drivers/MAX30102/max30102_for_stm32_hal.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/MAX30102/%.o Drivers/MAX30102/%.su Drivers/MAX30102/%.cyclo: ../Drivers/MAX30102/%.c Drivers/MAX30102/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Drivers/W25Q" -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Drivers/MAX30102" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Alghoritms" -I../Drivers/W25Q -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Libraries/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-MAX30102

clean-Drivers-2f-MAX30102:
	-$(RM) ./Drivers/MAX30102/max30102_for_stm32_hal.cyclo ./Drivers/MAX30102/max30102_for_stm32_hal.d ./Drivers/MAX30102/max30102_for_stm32_hal.o ./Drivers/MAX30102/max30102_for_stm32_hal.su

.PHONY: clean-Drivers-2f-MAX30102

