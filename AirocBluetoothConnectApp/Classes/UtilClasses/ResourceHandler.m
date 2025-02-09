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

#import "ResourceHandler.h"

#define SERVICE_AND_CHARACTERISTIC_NAMES_PLIST      @"serviceAndCharacteristicNames"
#define PLIST                                       @"plist"
#define UNKNOWN_SERVICE                             @"Unknown Service"
#define UNKNOWN_CHARACTERISTIC                      @"Unknown Characteristic"

/*!
 *  @class ResourceHandler
 *
 *  @discussion Class to handle the property lists
 *
 */

@implementation ResourceHandler

/*!
 *  @method getItemsFromPropertyList:
 *
 *  @discussion Method that returns elements from the given plist
 *
 */

+(NSDictionary *) getItemsFromPropertyList:(NSString *)PListName
{
    NSDictionary *MenuItemDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PListName ofType:@"plist"]];
    return MenuItemDictionary;
}

/*!
 *  @method getServiceNameForUUID:
 *
 *  @discussion Method that returns service name for a given UUID
 *
 */
+(NSString *) getServiceNameForUUID:(CBUUID *)UUID
{
    NSDictionary *allServicesAndCharacteristicsDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:SERVICE_AND_CHARACTERISTIC_NAMES_PLIST ofType:PLIST]];
    
    NSString *serviceName = [allServicesAndCharacteristicsDict objectForKey:UUID.UUIDString];
    
    if (serviceName.length < 1)
    {
        serviceName = UNKNOWN_SERVICE;
    }
    return serviceName;
}

/*!
 *  @method getCharacteristicNameForUUID:
 *
 *  @discussion Method that returns characteristic name for a given UUID
 *
 */

+(NSString *) getCharacteristicNameForUUID:(CBUUID *)UUID
{
    NSDictionary *allServicesAndCharacteristicsDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:SERVICE_AND_CHARACTERISTIC_NAMES_PLIST ofType:PLIST]];
    
    NSString *characteristicName = [allServicesAndCharacteristicsDict objectForKey:UUID.UUIDString];
    
    if (characteristicName.length < 1)
    {
        characteristicName = UNKNOWN_CHARACTERISTIC;
    }
    return characteristicName;
}




@end
