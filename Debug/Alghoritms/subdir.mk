################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Alghoritms/spo2_algorithm.c 

OBJS += \
./Alghoritms/spo2_algorithm.o 

C_DEPS += \
./Alghoritms/spo2_algorithm.d 


# Each subdirectory must supply rules for building sources it contributes
Alghoritms/%.o Alghoritms/%.su Alghoritms/%.cyclo: ../Alghoritms/%.c Alghoritms/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Drivers/W25Q" -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Drivers/MAX30102" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Alghoritms" -I../Drivers/W25Q -I"C:/Users/Admin/Documents/GitHub/pulse_oximeter/Libraries/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Alghoritms

clean-Alghoritms:
	-$(RM) ./Alghoritms/spo2_algorithm.cyclo ./Alghoritms/spo2_algorithm.d ./Alghoritms/spo2_algorithm.o ./Alghoritms/spo2_algorithm.su

.PHONY: clean-Alghoritms

