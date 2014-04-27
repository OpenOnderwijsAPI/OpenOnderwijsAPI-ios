//
//  ODAScheduleClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODALesson.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODAScheduleCompleteBlock)(BOOL success, ODALesson *schedule);

@interface ODAScheduleClient : ODAAbstractClient

- (void)getById:(NSString *)scheduleId onComplete:(ODAScheduleCompleteBlock)complete;

- (void)getScheduleByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete;

@end
