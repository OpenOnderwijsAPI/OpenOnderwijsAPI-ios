//
//  ODAGroupsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 25/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ODAGroup.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAGroupCompleteBlock)(BOOL success, ODAGroup *group);

@interface ODAGroupsClient : ODAAbstractClient

- (void)getById:(NSString *)groupId onComplete:(ODAGroupCompleteBlock)complete;

@end
