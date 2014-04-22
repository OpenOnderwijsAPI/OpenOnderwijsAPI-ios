//
//  ODARoomsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODARoom.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODARoomCompleteBlock)(BOOL success, ODARoom *room);

@interface ODARoomsClient : ODAAbstractClient

- (void)getById:(NSString *)roomId onComplete:(ODARoomCompleteBlock)complete;

@end
