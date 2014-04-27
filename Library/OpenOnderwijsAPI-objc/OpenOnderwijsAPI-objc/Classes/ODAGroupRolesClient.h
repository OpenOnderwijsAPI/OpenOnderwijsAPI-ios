//
//  ODAGroupRolesClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAGroupRole.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAGroupRoleCompleteBlock)(BOOL success, ODAGroupRole *groupRole);

@interface ODAGroupRolesClient : ODAAbstractClient

- (void)getById:(NSString *)groupRoleId onComplete:(ODAGroupRoleCompleteBlock)complete;

@end
