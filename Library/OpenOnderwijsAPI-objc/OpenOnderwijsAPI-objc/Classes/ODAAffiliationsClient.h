//
//  ODAAffiliationsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ODAAffiliation.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAAffiliationCompleteBlock)(BOOL success, ODAAffiliation *group);

@interface ODAAffiliationsClient : ODAAbstractClient

- (void)getById:(NSString *)affiliationId onComplete:(ODAAffiliationCompleteBlock)complete;

@end
