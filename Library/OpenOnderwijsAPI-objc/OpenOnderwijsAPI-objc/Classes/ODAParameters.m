//
//  ODAParameters.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAParameters.h"
#import "NSDateFormatter+ODAISO8601.h"

@interface ODAParameters ()

@property (nonatomic, strong) NSMutableDictionary *values;

@end

@implementation ODAParameters

- (id)init {
    self = [super init];
    if (self) {
        self.values = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setParam:(NSString *)value forKey:(NSString *)key {
    [self.values setObject:value forKey:key];
}

- (NSString *)getParamForKey:(NSString *)key {
    return [self.values objectForKey:key];
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithDictionary:self.values];
    NSDateFormatter *formatter = [NSDateFormatter ODAISO8601_dateFormatter_noMillis];
    
    if (self.page > 0) {
        [result setObject:[NSString stringWithFormat:@"%ld", (long)self.page] forKey:@"page"];
    }
    if (self.startDate) {
        [result setObject:[formatter stringFromDate:self.startDate] forKey:@"start"];
    }
    if (self.endDate) {
        [result setObject:[formatter stringFromDate:self.endDate] forKey:@"end"];
    }
    if (self.searchQuery) {
        [result setObject:self.searchQuery forKey:@"q"];
    }
    if (self.affiliationFilter) {
        [result setObject:self.affiliationFilter forKey:@"affiliation"];
    }
    return [NSDictionary dictionaryWithDictionary:result];
}

@end
