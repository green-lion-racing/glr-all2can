/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f3xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define LED_Y_Pin GPIO_PIN_0
#define LED_Y_GPIO_Port GPIOF
#define LED_G_Pin GPIO_PIN_1
#define LED_G_GPIO_Port GPIOF
#define DI0_Pin GPIO_PIN_0
#define DI0_GPIO_Port GPIOA
#define DI1_Pin GPIO_PIN_1
#define DI1_GPIO_Port GPIOA
#define DI2_Pin GPIO_PIN_2
#define DI2_GPIO_Port GPIOA
#define DI3_Pin GPIO_PIN_3
#define DI3_GPIO_Port GPIOA
#define DI4_Pin GPIO_PIN_4
#define DI4_GPIO_Port GPIOA
#define DI5_Pin GPIO_PIN_5
#define DI5_GPIO_Port GPIOA
#define DI6_Pin GPIO_PIN_0
#define DI6_GPIO_Port GPIOB
#define DI7_Pin GPIO_PIN_1
#define DI7_GPIO_Port GPIOB
#define clutch_out_Pin GPIO_PIN_8
#define clutch_out_GPIO_Port GPIOA
#define upshift_out_Pin GPIO_PIN_9
#define upshift_out_GPIO_Port GPIOA
#define downshift_out_Pin GPIO_PIN_10
#define downshift_out_GPIO_Port GPIOA
#define ignitioncut_out_Pin GPIO_PIN_15
#define ignitioncut_out_GPIO_Port GPIOA
#define DO4_Pin GPIO_PIN_3
#define DO4_GPIO_Port GPIOB
#define DO5_Pin GPIO_PIN_4
#define DO5_GPIO_Port GPIOB
#define DO6_Pin GPIO_PIN_5
#define DO6_GPIO_Port GPIOB
#define DO7_Pin GPIO_PIN_6
#define DO7_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
