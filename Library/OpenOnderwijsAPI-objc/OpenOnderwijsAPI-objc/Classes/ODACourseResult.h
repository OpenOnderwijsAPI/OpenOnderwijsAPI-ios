//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"
#import "ODACourse.h"

@interface ODACourseResult : ODAEntity

@property (nonatomic, copy) NSString *studentURL;
@property (nonatomic, strong) ODACourse *course;
@property (nonatomic, strong) NSArray *testResultURLs;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, assign) BOOL passed;

@end
