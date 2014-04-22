//
//  ODAParameters.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODAParameters : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, copy)   NSString *searchQuery;
@property (nonatomic, copy)   NSString *affiliationFilter;

- (void)setParam:(NSString *)value forKey:(NSString *)key;
- (NSString *)getParamForKey:(NSString *)key;

- (NSDictionary *)dictionaryRepresentation;

@end
