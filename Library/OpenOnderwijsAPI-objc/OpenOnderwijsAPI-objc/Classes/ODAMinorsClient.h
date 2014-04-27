//
//  ODAMinorsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAMinor.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAMinorCompleteBlock)(BOOL success, ODAMinor *minor);

@interface ODAMinorsClient : ODAAbstractClient

// Get a specific minor by its id.
- (void)getById:(NSString *)minorId onComplete:(ODAMinorCompleteBlock)complete;

@end
