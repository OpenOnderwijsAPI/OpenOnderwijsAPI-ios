//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODATestResult : ODAEntity

@property (nonatomic, copy) NSString *studentURL;
@property (nonatomic, copy) NSString *courseURL;
@property (nonatomic, copy) NSString *courseResultURL;
@property (nonatomic, copy) NSString *testResultDescription;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, assign) BOOL passed;
@property (nonatomic, copy) NSString *weight;

@end
