//
//  ODATestResultDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODATestResultDeserializer.h"
#import "ODATestResult.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"

@implementation ODATestResultDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODATestResult *testResult = [[ODATestResult alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:testResult];
    
    [self mapStringFields:@[@"grade", @"result", @"weight"] fromDictionary:dictionary toEntity:testResult];
    
    testResult.testResultDescription = [dictionary objectForKey:@"description"];
    testResult.date = [self dateFromString:[dictionary objectForKey:@"date"]];
    testResult.passed = [[dictionary objectForKey:@"passed"] boolValue];
    
    return testResult;
}

@end
