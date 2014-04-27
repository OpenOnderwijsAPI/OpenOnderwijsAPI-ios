//
//  ODACourseResultDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODACourseResultDeserializer.h"
#import "ODACourseResult.h"
#import "ODABaseDeserializer.h"
#import "ODACourseDeserializer.h"

@implementation ODACourseResultDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODACourseResult *courseResult = [[ODACourseResult alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:courseResult];
    
    [self mapStringFields:@[@"grade", @"result"] fromDictionary:dictionary toEntity:courseResult];
    
    courseResult.studentURL = [dictionary objectForKey:@"student"];
    courseResult.passed = [[dictionary objectForKey:@"passed"] boolValue];
    
    NSDictionary *courseDict = [dictionary objectForKey:@"course"];
    if (courseDict) {
        ODACourseDeserializer *courseDeserializer = [[ODACourseDeserializer alloc] init];
        courseResult.course = [courseDeserializer deserialize:courseDict];
    }
    
    NSArray *testResults = [dictionary objectForKey:@"testResults"];
    if (testResults) {
        courseResult.testResultURLs = testResults;
    }
 
    return courseResult;
}

@end
