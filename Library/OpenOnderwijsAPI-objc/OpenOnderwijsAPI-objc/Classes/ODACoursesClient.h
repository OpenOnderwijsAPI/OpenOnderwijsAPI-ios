//
//  ODACoursesClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODACourse.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODACourseCompleteBlock)(BOOL success, ODACourse *course);

@interface ODACoursesClient : ODAAbstractClient

// Get a specific course by its id.
- (void)getById:(NSString *)courseId onComplete:(ODACourseCompleteBlock)complete;

@end
