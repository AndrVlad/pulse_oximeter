/*
 * sensor_utils.c
 *
 *  Created on: 20 мар. 2026 г.
 *      Author: AVA
 */

#include "sensor_utils.h"
#include "main.h"
#include "../Drivers/W25Q/w25q_spi.h"
#include "protocol_parser.h"
#include "SPI_Connection.h"
#include "Common.h"
//#include "max30102_for_stm32_hal.h"
#include <stdbool.h>
#include <stdint.h>

bool need_selfcheck = 0;
//max30102_t max30102;

/* Выполняет проверку работоспособности датчика
 * Возврат: 1 - датчик работоспособен
 * 			0 - датчик не работоспособен */
bool sensorSelfCheck() {

#ifdef TEST_VERSION
	return true;
#endif

	return max30102_check(&max30102);

}

void sensorChipInit() {

	// Инициализация микросхемы
	max30102_init(&max30102, &hi2c1);
	max30102_reset(&max30102);
	max30102_clear_fifo(&max30102);
	max30102_set_fifo_config(&max30102, max30102_smp_ave_1, 1, 3);
	max30102_shutdown(&max30102, 1);

	// Настройка микросхемы
	max30102_set_led_pulse_width(&max30102, max30102_pw_18_bit);
	max30102_set_adc_resolution(&max30102, max30102_adc_4096);
	max30102_set_sampling_rate(&max30102, max30102_sr_100);
	max30102_set_led_current_1(&max30102, 6.2);
	max30102_set_led_current_2(&max30102, 6.2);

	// Настройка режима SpO2
	max30102_set_mode(&max30102, max30102_spo2);
	max30102_set_a_full(&max30102, 1);
	max30102_set_alc_ovf(&max30102, 1);

	// Включение измерения температуры
	max30102_set_die_temp_en(&max30102, 1);
	max30102_set_die_temp_rdy(&max30102, 1);

	return;
}

void resetSensorChip() {

	// остановка и сброс таймера опроса регистров прерываний микросхемы
	HAL_TIM_Base_Stop_IT(&htim4);
	__HAL_TIM_SET_COUNTER(&htim4, 0);

	// инициализация микросхемы
	sensorChipInit();
	return;
}

void stopSensorChip() {

	// выключение микросхемы
	max30102_shutdown(&max30102, 1);
	return;
}

void enableSensorChip() {

	// включение микросхемы
	max30102_shutdown(&max30102, 0);

	// очистка буфера FIFO микросхемы и сброс ее внутренних указателей
	max30102_clear_fifo(&max30102);
	return;
}

/* Выполняет сброс датчика */
void resetSensor() {

	stopMeasurement();

    // сброс cостояния протокола
    resetFSMProtocol();

    // сброс переменных
    page_pos_ptr = 0;
    page_ptr = 0;

    // сброс микросхемы датчика
    resetSensorChip();

	// очистка флеш-памяти
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_2, GPIO_PIN_SET);
    W25_Erase_Chip();

    reset_ready = true;

	return;
}
/* Запуск измерения */
void startMeasurement() {

	// включение микросхемы
	enableSensorChip();
	// запуск таймера таймера опроса регистров прерываний микросхемы
	HAL_TIM_Base_Start_IT(&htim4);
	return;
}

/* Остановка измерения */
void stopMeasurement() {

	// остановка и сброс таймера опроса регистров прерываний микросхемы
	HAL_TIM_Base_Stop_IT(&htim4);
	__HAL_TIM_SET_COUNTER(&htim4, 0);

	stopSensorChip();
	return;
}



