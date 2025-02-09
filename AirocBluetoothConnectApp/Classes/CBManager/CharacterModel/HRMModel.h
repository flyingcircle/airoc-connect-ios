/*
 * Copyright 2014-2022, Cypress Semiconductor Corporation (an Infineon company) or
 * an affiliate of Cypress Semiconductor Corporation.  All rights reserved.
 *
 * This software, including source code, documentation and related
 * materials ("Software") is owned by Cypress Semiconductor Corporation
 * or one of its affiliates ("Cypress") and is protected by and subject to
 * worldwide patent protection (United States and foreign),
 * United States copyright laws and international treaty provisions.
 * Therefore, you may use this Software only as provided in the license
 * agreement accompanying the software package from which you
 * obtained this Software ("EULA").
 * If no EULA applies, Cypress hereby grants you a personal, non-exclusive,
 * non-transferable license to copy, modify, and compile the Software
 * source code solely for use in connection with Cypress's
 * integrated circuit products.  Any reproduction, modification, translation,
 * compilation, or representation of this Software except as specified
 * above is prohibited without the express written permission of Cypress.
 *
 * Disclaimer: THIS SOFTWARE IS PROVIDED AS-IS, WITH NO WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, NONINFRINGEMENT, IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Cypress
 * reserves the right to make changes to the Software without notice. Cypress
 * does not assume any liability arising out of the application or use of the
 * Software or any product or circuit described in the Software. Cypress does
 * not authorize its products for use in any products where a malfunction or
 * failure of the Cypress product may reasonably be expected to result in
 * significant property damage, injury or death ("High Risk Product"). By
 * including Cypress's product in a High Risk Product, the manufacturer
 * of such system or application assumes all risk of such use and in doing
 * so agrees to indemnify Cypress against all liability.
 */

#import <Foundation/Foundation.h>

@interface HRMModel : NSObject


/*!
 *  @property bpmValue
 *
 *  @discussion The format of the Heart Rate Measurement Value
 *
 */
@property(nonatomic,assign)NSInteger bpmValue;

/*!
 *  @property sensorLocation
 *
 *  @discussion The Body Sensor Location characteristic of the device is used to describe the intended location of the heart rate measurement for the device.
 *
 */
@property(nonatomic,retain)NSString *sensorLocation;


/*!
 *  @property sensorContact
 *
 *  @discussion The value of the Sensor Contact Status bits (bits 1 and 2) of the Flags field of the Heart Rate Measurement characteristic.
 */
@property(nonatomic,retain)NSString *sensorContact;

/*!
 *  @property RR_Interval
 *
 *  @discussion The RR-Interval value represents the time between two R-Wave detections.
 *
 */
@property(nonatomic,retain)NSString *RRinterval;

/*!
 *  @property EnergyExpended
 *
 *  @discussion EnergyExpended.
 *
 */
@property(nonatomic,retain)NSString *energyExpended;

/*!
 *  @method discoverCharacteristicsWithHandler:
 *
 *  @discussion Discovers characteristics of the service
 */
-(void)discoverCharacteristicsWithHandler:(void (^) (BOOL success, NSError *error))handler;

/*!
 *  @method setCharacteristicUpdateHandler:
 *
 *  @discussion Sets notifications or indications for the value of a specified characteristic.
 */
-(void)setCharacteristicUpdateHandler:(void (^) (BOOL success, NSError *error))handler;

/*!
 *  @method stopUpdate
 *
 *  @discussion Stop notifications or indications for the value of a specified characteristic.
 */
-(void)stopUpdate;

@end
