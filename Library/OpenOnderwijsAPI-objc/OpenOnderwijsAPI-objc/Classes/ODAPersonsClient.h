//
//  ODAPersonsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAPerson.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAPersonCompleteBlock)(BOOL success, ODAPerson *person);

@interface ODAPersonsClient : ODAAbstractClient

// Get a specific person by their ID.
- (void)getById:(NSString *)personId onComplete:(ODAPersonCompleteBlock)complete;

// Get your personal details (requires OAuth token)
- (void)getMeOnComplete:(ODAPersonCompleteBlock)complete;

@end
