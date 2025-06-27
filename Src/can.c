/**
  ******************************************************************************
  * File Name          : CAN.c
  * Description        : This file provides code for the configuration
  *                      of the CAN instances.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "can.h"

/* USER CODE BEGIN 0 */
#include "gpio.h"
CAN_FilterTypeDef	sFilterConfig;
CAN_TxHeaderTypeDef	TxHeader;
CAN_RxHeaderTypeDef	RxHeader;
uint8_t TxData[8];
uint8_t RxData[8];
uint32_t TxMailbox;
#define clutch 	0
#define upshift		1
#define downshift 	2
#define greenled 	7
//uint8_t newCanMessage = 0;
/* USER CODE END 0 */

CAN_HandleTypeDef hcan;

/* CAN init function */
void MX_CAN_Init(void)
{

  hcan.Instance = CAN;
  hcan.Init.Prescaler = 1;
  hcan.Init.Mode = CAN_MODE_NORMAL;
  hcan.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan.Init.TimeSeg1 = CAN_BS1_13TQ;
  hcan.Init.TimeSeg2 = CAN_BS2_2TQ;
  hcan.Init.TimeTriggeredMode = DISABLE;
  hcan.Init.AutoBusOff = DISABLE;
  hcan.Init.AutoWakeUp = DISABLE;
  hcan.Init.AutoRetransmission = DISABLE;
  hcan.Init.ReceiveFifoLocked = DISABLE;
  hcan.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan) != HAL_OK)
  {
    Error_Handler();
  }

}

void HAL_CAN_MspInit(CAN_HandleTypeDef* canHandle)
{

  GPIO_InitTypeDef GPIO_InitStruct = {0};
  if(canHandle->Instance==CAN)
  {
  /* USER CODE BEGIN CAN_MspInit 0 */

  /* USER CODE END CAN_MspInit 0 */
    /* CAN clock enable */
    __HAL_RCC_CAN1_CLK_ENABLE();
  
    __HAL_RCC_GPIOA_CLK_ENABLE();
    /**CAN GPIO Configuration    
    PA11     ------> CAN_RX
    PA12     ------> CAN_TX 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_11|GPIO_PIN_12;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    GPIO_InitStruct.Alternate = GPIO_AF9_CAN;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    /* CAN interrupt Init */
    HAL_NVIC_SetPriority(CAN_TX_IRQn, 5, 0);
    HAL_NVIC_EnableIRQ(CAN_TX_IRQn);
    HAL_NVIC_SetPriority(CAN_RX0_IRQn, 5, 0);
    HAL_NVIC_EnableIRQ(CAN_RX0_IRQn);
  /* USER CODE BEGIN CAN_MspInit 1 */
    HAL_GPIO_WritePin(GPIOA, ignitioncut_out_Pin, 1); //to start with 0V
  /* USER CODE END CAN_MspInit 1 */
  }
}

void HAL_CAN_MspDeInit(CAN_HandleTypeDef* canHandle)
{

  if(canHandle->Instance==CAN)
  {
  /* USER CODE BEGIN CAN_MspDeInit 0 */

  /* USER CODE END CAN_MspDeInit 0 */
    /* Peripheral clock disable */
    __HAL_RCC_CAN1_CLK_DISABLE();
  
    /**CAN GPIO Configuration    
    PA11     ------> CAN_RX
    PA12     ------> CAN_TX 
    */
    HAL_GPIO_DeInit(GPIOA, GPIO_PIN_11|GPIO_PIN_12);

    /* CAN interrupt Deinit */
    HAL_NVIC_DisableIRQ(CAN_TX_IRQn);
    HAL_NVIC_DisableIRQ(CAN_RX0_IRQn);
  /* USER CODE BEGIN CAN_MspDeInit 1 */

  /* USER CODE END CAN_MspDeInit 1 */
  }
} 

/* USER CODE BEGIN 1 */
void HAL_CAN_TxMailbox0CompleteCallback(CAN_HandleTypeDef *hcan1)
{
	//HAL_GPIO_TogglePin(LED_Blue_GPIO_Port,LED_Blue_Pin);
}

void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan1)
{
	if (HAL_CAN_GetRxMessage(&hcan, CAN_RX_FIFO0, &RxHeader, RxData) != HAL_OK) {}
	newCanMessage();// = 1;

}

void JDO_SendCan(void)
{
	TxHeader.DLC=8;
	TxHeader.IDE=CAN_ID_STD;
	HAL_CAN_AddTxMessage(&hcan,&TxHeader,TxData,&TxMailbox);
	TxData[7]=TxData[7]+1;
}

void JDO_SendPoti(uint8_t DataLeft, uint8_t DataRight)
{
	TxHeader.DLC=2;
	TxHeader.IDE=0x150;
	TxData[0]=DataLeft;
	TxData[1]=DataRight;
	HAL_CAN_AddTxMessage(&hcan,&TxHeader,TxData,&TxMailbox);
}

void JDO_GetCan(void)
{

	if (HAL_CAN_GetRxMessage(&hcan, CAN_RX_FIFO0, &RxHeader, RxData) != HAL_OK) {}
	switch(RxHeader.StdId){
		case (0x101):
			HAL_GPIO_WritePin(LED_Y_GPIO_Port, LED_Y_Pin, 0); //turn on yellow LED on RJ45 connector when receiwing a 0x101 message
			if(RxData[0] & 1<<clutch){ //clutch
				HAL_GPIO_WritePin(GPIOA, clutch_out_Pin, 1); //cluch_out_Pin = Pin1 = DO0_Pin (in earlier version)
				//Kuppling dauerhaft offen
			}
			if( !(RxData[0] & 1<<clutch) ){
				HAL_GPIO_WritePin(GPIOA, clutch_out_Pin, 0);
				//Kuppling dauerhaft geschlossen
			}
			if(RxData[0] & 1<<upshift){	//hochschalten 2
				HAL_GPIO_WritePin(GPIOA, ignitioncut_out_Pin, 0); //invertet, 'cause pull up in hardware
				osDelay(10);
				HAL_GPIO_WritePin(GPIOA, ignitioncut_out_Pin, 1); // Pin4 //gearcut+
				osDelay(50);
				HAL_GPIO_WritePin(GPIOA, upshift_out_Pin, 1); // Pin2
				osDelay(125); //125 aktueller   //75war mal ganz ok
				HAL_GPIO_WritePin(GPIOA, upshift_out_Pin, 0);
			}
			else if(RxData[0] & 1<<downshift){	//Runter schalten 4
				HAL_GPIO_WritePin(GPIOA, clutch_out_Pin, 1);
				osDelay(20);
				HAL_GPIO_WritePin(GPIOA, downshift_out_Pin, 1); //Pin3
				osDelay(275); // 275 besser //175  klappt
				HAL_GPIO_WritePin(GPIOA, downshift_out_Pin, 0);
				if( !(RxData[0] & 1<<clutch) ){
					HAL_GPIO_WritePin(GPIOA, clutch_out_Pin, 0);
					//Kupplung wird geschlossen, wenn das Kupplungsbit nicht gesetzt ist
				}
			}
			if(RxData[0] & 1<<greenled)  //128
				HAL_GPIO_WritePin(LED_G_GPIO_Port, LED_G_Pin, 0); //turn on green LED on RJ45 connector
			else
				HAL_GPIO_WritePin(LED_G_GPIO_Port, LED_G_Pin, 1); //turn off green LED on RJ45 connector
			HAL_GPIO_WritePin(LED_Y_GPIO_Port, LED_Y_Pin, 1); //turn yellow LED back off
	break;

	}

}

void JDO_CanInit(void)
{
	/* Filter noch mal �berpr�fen!!! */
	sFilterConfig.FilterBank=0;
	sFilterConfig.FilterMode=CAN_FILTERMODE_IDMASK;
	sFilterConfig.FilterScale=CAN_FILTERSCALE_32BIT;
	sFilterConfig.FilterIdHigh=0x0101<<5; //0x0700;
	sFilterConfig.FilterIdLow=0x0000<<5;
	sFilterConfig.FilterMaskIdHigh=0x1FFF<<5;//0x1FFF<<5;//muss hier geshifted werden???
	sFilterConfig.FilterMaskIdLow=0;//0x1FFF<<5;
	sFilterConfig.FilterFIFOAssignment=CAN_RX_FIFO0;
	sFilterConfig.FilterActivation=ENABLE;
	sFilterConfig.SlaveStartFilterBank=14;
	if(HAL_CAN_ConfigFilter(&hcan,&sFilterConfig)!=HAL_OK)
	{/* Filter configuration Error */
	  Error_Handler();
	}

	if(HAL_CAN_Start(&hcan)!=HAL_OK)
	{/* Start Error */
	  Error_Handler();
	}

	if(HAL_CAN_ActivateNotification(&hcan,CAN_IT_RX_FIFO0_MSG_PENDING |CAN_IT_TX_MAILBOX_EMPTY)!=HAL_OK)
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

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
