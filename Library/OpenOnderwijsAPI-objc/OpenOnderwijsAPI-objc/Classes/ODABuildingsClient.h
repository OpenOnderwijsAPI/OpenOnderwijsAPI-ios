//
//  ODAPersonsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODABuilding.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODABuildingCompleteBlock)(BOOL success, ODABuilding *building);

@interface ODABuildingsClient : ODAAbstractClient

- (void)getById:(NSString *)buildingId onComplete:(ODABuildingCompleteBlock)complete;

@end
