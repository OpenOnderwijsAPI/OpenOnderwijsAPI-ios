//
//  ODACourseDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODACourseDeserializer.h"
#import "ODACourse.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"

@implementation ODACourseDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODACourse *course = [[ODACourse alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:course];
    
    [self mapStringFields:@[@"name", @"goals", @"requirements", @"level", @"format",
                            @"langugae", @"enrollment", @"literature", @"exams", @"schedule",
                            @"link", @"organisation", @"department", @"lecturers"] fromDictionary:dictionary toEntity:course];
    
    course.abbreviation = [dictionary objectForKey:@"abbr"];
    course.ects = [[dictionary objectForKey:@"ects"] integerValue];
    course.courseDesription = [dictionary objectForKey:@"description"];
    
    NSArray *lessons = [dictionary objectForKey:@"lessons"];
    if (lessons) {
        course.lessonsURLs = lessons;
    }
    
    NSArray *groups = [dictionary objectForKey:@"groups"];
    if (groups) {
        course.groupURLs = groups;
    }
    
    return course;
}

@end
