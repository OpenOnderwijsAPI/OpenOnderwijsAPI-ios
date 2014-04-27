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

- (void)getById:(NSString *)personId onComplete:(ODAPersonCompleteBlock)complete;
- (void)getMeOnComplete:(ODAPersonCompleteBlock)complete;

@end
