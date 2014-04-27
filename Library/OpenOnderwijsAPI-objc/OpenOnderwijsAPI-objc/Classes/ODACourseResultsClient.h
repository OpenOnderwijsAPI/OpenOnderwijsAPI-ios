//
//  ODAPersonsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODACourseResult.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODACourseResultCompleteBlock)(BOOL success, ODACourseResult *courseResult);

@interface ODACourseResultsClient : ODAAbstractClient

// Get a specific course result by its id.
- (void)getById:(NSString *)courseResultId onComplete:(ODACourseResultCompleteBlock)complete;

// Get a list of course results for a particular person
- (void)getCourseResultsByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete;

@end
