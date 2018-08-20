/**
  ******************************************************************************
  * File Name          : CAN.c
  * Description        : This file provides code for the configuration
  *                      of the CAN instances.
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2018 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "can.h"

#include "gpio.h"

/* USER CODE BEGIN 0 */
CAN_FilterTypeDef	sFilterConfig;
CAN_TxHeaderTypeDef	TxHeader;
CAN_RxHeaderTypeDef	RxHeader;
uint8_t TxData[8];
uint8_t RxData[8];
uint32_t TxMailbox;
/* USER CODE END 0 */

CAN_HandleTypeDef hcan1;

/* CAN1 init function */
void MX_CAN1_Init(void)
{

  hcan1.Instance = CAN1;
  hcan1.Init.Prescaler = 3;
  hcan1.Init.Mode = CAN_MODE_NORMAL;
  hcan1.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan1.Init.TimeSeg1 = CAN_BS1_13TQ;
  hcan1.Init.TimeSeg2 = CAN_BS2_2TQ;
  hcan1.Init.TimeTriggeredMode = DISABLE;
  hcan1.Init.AutoBusOff = DISABLE;
  hcan1.Init.AutoWakeUp = DISABLE;
  hcan1.Init.AutoRetransmission = DISABLE;
  hcan1.Init.ReceiveFifoLocked = DISABLE;
  hcan1.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

void HAL_CAN_MspInit(CAN_HandleTypeDef* canHandle)
{

  GPIO_InitTypeDef GPIO_InitStruct;
  if(canHandle->Instance==CAN1)
  {
  /* USER CODE BEGIN CAN1_MspInit 0 */

  /* USER CODE END CAN1_MspInit 0 */
    /* CAN1 clock enable */
    __HAL_RCC_CAN1_CLK_ENABLE();
  
    /**CAN1 GPIO Configuration    
    PD0     ------> CAN1_RX
    PD1     ------> CAN1_TX 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF9_CAN1;
    HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

    /* CAN1 interrupt Init */
    HAL_NVIC_SetPriority(CAN1_TX_IRQn, 0, 0);
    HAL_NVIC_EnableIRQ(CAN1_TX_IRQn);
    HAL_NVIC_SetPriority(CAN1_RX0_IRQn, 0, 0);
    HAL_NVIC_EnableIRQ(CAN1_RX0_IRQn);
  /* USER CODE BEGIN CAN1_MspInit 1 */

  /* USER CODE END CAN1_MspInit 1 */
  }
}

void HAL_CAN_MspDeInit(CAN_HandleTypeDef* canHandle)
{

  if(canHandle->Instance==CAN1)
  {
  /* USER CODE BEGIN CAN1_MspDeInit 0 */

  /* USER CODE END CAN1_MspDeInit 0 */
    /* Peripheral clock disable */
    __HAL_RCC_CAN1_CLK_DISABLE();
  
    /**CAN1 GPIO Configuration    
    PD0     ------> CAN1_RX
    PD1     ------> CAN1_TX 
    */
    HAL_GPIO_DeInit(GPIOD, GPIO_PIN_0|GPIO_PIN_1);

    /* CAN1 interrupt Deinit */
    HAL_NVIC_DisableIRQ(CAN1_TX_IRQn);
    HAL_NVIC_DisableIRQ(CAN1_RX0_IRQn);
  /* USER CODE BEGIN CAN1_MspDeInit 1 */

  /* USER CODE END CAN1_MspDeInit 1 */
  }
} 

/* USER CODE BEGIN 1 */
void HAL_CAN_TxMailbox0CompleteCallback(CAN_HandleTypeDef*hcan)
{
	HAL_GPIO_TogglePin(LED_Blue_GPIO_Port,LED_Blue_Pin);
}

void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef*hcan)
{
	HAL_CAN_GetRxMessage(&hcan1,CAN_RX_FIFO0,&RxHeader,RxData);
	if(RxData[7]&0x01) HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,1);
	else HAL_GPIO_WritePin(LED_Green_GPIO_Port,LED_Green_Pin,0);
	if(RxData[7]&0x02) HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,1);
	else HAL_GPIO_WritePin(LED_Red_GPIO_Port,LED_Red_Pin,0);
}
void JDO_SendCan(void)
{
	HAL_CAN_AddTxMessage(&hcan1,&TxHeader,TxData,&TxMailbox);
	HAL_Delay(500);
	TxData[7]=TxData[7]+1;
}

void JDO_CanInit(void)
{
	/* Filter noch mal überprüfen!!! */
	sFilterConfig.FilterBank=0;
	sFilterConfig.FilterMode=CAN_FILTERMODE_IDMASK;
	sFilterConfig.FilterScale=CAN_FILTERSCALE_16BIT;
	sFilterConfig.FilterIdHigh=0x0321<<5;
	sFilterConfig.FilterIdLow=0x0000;
	sFilterConfig.FilterMaskIdHigh=0x1FFE<<5;//muss hier geshifted werden???
	sFilterConfig.FilterMaskIdLow=0x1FFF<<5;
	sFilterConfig.FilterFIFOAssignment=CAN_RX_FIFO0;
	sFilterConfig.FilterActivation=ENABLE;
	sFilterConfig.SlaveStartFilterBank=14;
	if(HAL_CAN_ConfigFilter(&hcan1,&sFilterConfig)!=HAL_OK)
	{/* Filter configuration Error */
	  Error_Handler();
	}

	if(HAL_CAN_Start(&hcan1)!=HAL_OK)
	{/* Start Error */
	  Error_Handler();
	}

	if(HAL_CAN_ActivateNotification(&hcan1,CAN_IT_RX_FIFO0_MSG_PENDING |CAN_IT_TX_MAILBOX_EMPTY)!=HAL_OK)
	{/* Notification Error */
	  Error_Handler();
	}

	TxHeader.StdId=0x321;
	TxHeader.ExtId=0x01;
	TxHeader.RTR=CAN_RTR_DATA;
	TxHeader.IDE=CAN_ID_STD;
	TxHeader.DLC=8;
	TxHeader.TransmitGlobalTime=DISABLE;
	TxData[0]=1;
	TxData[1]=2;
	TxData[2]=3;
	TxData[3]=4;
	TxData[4]=5;
	TxData[5]=6;
	TxData[6]=7;
	TxData[7]=8;
}
/* USER CODE END 1 */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
