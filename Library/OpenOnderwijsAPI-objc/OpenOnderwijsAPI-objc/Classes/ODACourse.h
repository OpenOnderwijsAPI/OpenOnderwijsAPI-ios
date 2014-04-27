//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODACourse : ODAEntity

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *abbreviation;
@property (nonatomic, assign) NSInteger ects;
@property (nonatomic, copy) NSString *courseDesription;
@property (nonatomic, copy) NSString *goals;
@property (nonatomic, copy) NSString *requirements;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *enrollment;
@property (nonatomic, copy) NSString *literature;
@property (nonatomic, copy) NSString *exams;
@property (nonatomic, copy) NSString *schedule;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *organisation;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *lecturers;
@property (nonatomic, strong) NSArray *minors;
@property (nonatomic, strong) NSArray *lessonsURLs;
@property (nonatomic, strong) NSArray *groupURLs;

@end
