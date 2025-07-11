/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * Copyright (c) 2018 STMicroelectronics International N.V. 
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without 
  * modification, are permitted, provided that the following conditions are met:
  *
  * 1. Redistribution of source code must retain the above copyright notice, 
  *    this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  *    this list of conditions and the following disclaimer in the documentation
  *    and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of other 
  *    contributors to this software may be used to endorse or promote products 
  *    derived from this software without specific written permission.
  * 4. This software, including modifications and/or derivative works of this 
  *    software, must execute solely and exclusively on microcontroller or
  *    microprocessor devices manufactured by or for STMicroelectronics.
  * 5. Redistribution and use of this software other than as permitted under 
  *    this license is void and will automatically terminate your rights under 
  *    this license. 
  *
  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS" 
  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT 
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT 
  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */     
#include "can.h"
#include "adc.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
//#define ph_debug
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */
volatile uint8_t nCM =0;

/* USER CODE END Variables */
osThreadId blinkingLedHandle;
osThreadId inverterCheckHandle;
osThreadId brakeCheckHandle;

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */
/* USER CODE END FunctionPrototypes */

void blinkingLedEntry(void const * argument);
void inverterCheckEntry(void const * argument);
void brakeCheckEntry(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */
       

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* definition and creation of blinkingLed */
  osThreadDef(blinkingLed, blinkingLedEntry, osPriorityNormal, 0, 128);
  blinkingLedHandle = osThreadCreate(osThread(blinkingLed), NULL);

  /* definition and creation of inverterCheck */
  osThreadDef(inverterCheck, inverterCheckEntry, osPriorityNormal, 0, 128);
  inverterCheckHandle = osThreadCreate(osThread(inverterCheck), NULL);

  /* definition and creation of brakeCheck */
  osThreadDef(brakeCheck, brakeCheckEntry, osPriorityNormal, 0, 128);
  brakeCheckHandle = osThreadCreate(osThread(brakeCheck), NULL);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_blinkingLedEntry */
/**
  * @brief  Function implementing the blinkingLed thread.
  * @param  argument: Not used 
  * @retval None
  */
/* USER CODE END Header_blinkingLedEntry */
void blinkingLedEntry(void const * argument)
{

  /* USER CODE BEGIN blinkingLedEntry */
  /* Infinite loop */
  for(;;)
  {
    vTaskDelay(pdMS_TO_TICKS(1));
    HAL_GPIO_TogglePin(LED_Y_GPIO_Port, LED_Y_Pin);
    /* Infinite loop */
    for(;;)
    {
      HAL_GPIO_TogglePin(LED_Y_GPIO_Port, LED_Y_Pin);
      vTaskDelay(pdMS_TO_TICKS(200));
    }
  }
  /* USER CODE END blinkingLedEntry */
}

/* USER CODE BEGIN Header_inverterCheckEntry */
/**
* @brief Function implementing the inverterCheck thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_inverterCheckEntry */
void inverterCheckEntry(void const * argument)
{
  /* USER CODE BEGIN inverterCheckEntry */
  /* Infinite loop */
  int inverterActive = 0;
  for(;;)
  {
    vTaskDelay(pdMS_TO_TICKS(1));
    if (HAL_GPIO_ReadPin(INVERTER_ACTIVE_GPIO_Port, INVERTER_ACTIVE_Pin) != inverterActive)
    {
      if (!inverterActive)
      {
        inverterActive = 1;
        HAL_GPIO_TogglePin(SOUND_BUZZER_GPIO_Port, SOUND_BUZZER_Pin);
        HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin);
        vTaskDelay(pdMS_TO_TICKS(1500));
        HAL_GPIO_TogglePin(SOUND_BUZZER_GPIO_Port, SOUND_BUZZER_Pin);
        HAL_GPIO_TogglePin(LED_G_GPIO_Port, LED_G_Pin);
      }
      else
      {
        inverterActive = 0;
      }
    }
  }
  /* USER CODE END inverterCheckEntry */
}

/* USER CODE BEGIN Header_brakeCheckEntry */
/**
* @brief Function implementing the brakeCheck thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_brakeCheckEntry */
void brakeCheckEntry(void const * argument)
{
  /* USER CODE BEGIN brakeCheckEntry */
  /* Infinite loop */

  uint32_t initialPedalBreakValue;
  uint32_t pedalBreakValue;
  float initialVoltage;
  float voltage;

  HAL_ADC_Start(&hadc1);
  HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
  initialPedalBreakValue = HAL_ADC_GetValue(&hadc1); // Read value (0–4095 on 12-bit ADC)
  initialVoltage = (initialPedalBreakValue / 4095.0f) * 3.3f;

  for(;;)
  {
    vTaskDelay(pdMS_TO_TICKS(1));
    HAL_ADC_Start(&hadc1);
    HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
    pedalBreakValue = HAL_ADC_GetValue(&hadc1); // Read value (0–4095 on 12-bit ADC)
    if (pedalBreakValue > (initialPedalBreakValue + initialPedalBreakValue / 100)) {
      HAL_GPIO_WritePin(BRAKE_LIGHT_GPIO_Port, BRAKE_LIGHT_Pin, GPIO_PIN_SET);
    } else {
      HAL_GPIO_WritePin(BRAKE_LIGHT_GPIO_Port, BRAKE_LIGHT_Pin, GPIO_PIN_RESET);
    }

    voltage = (pedalBreakValue / 4095.0f) * 3.3f;
  }
  /* USER CODE END brakeCheckEntry */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
/* USER CODE END Application */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
