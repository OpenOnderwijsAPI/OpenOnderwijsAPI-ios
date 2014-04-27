//
//  ODATestResultsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODATestResult.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODATestResultCompleteBlock)(BOOL success, ODATestResult *testResult);

@interface ODATestResultsClient : ODAAbstractClient

- (void)getById:(NSString *)testResultId onComplete:(ODATestResultCompleteBlock)complete;

- (void)getTestResultsByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete;

@end
