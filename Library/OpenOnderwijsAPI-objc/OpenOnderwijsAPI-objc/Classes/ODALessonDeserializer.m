//
//  ODAScheduleDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 27/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODALessonDeserializer.h"
#import "ODALesson.h"
#import "ODABaseDeserializer.h"
#import "ODARoomDeserializer.h"
#import "ODACourseDeserializer.h"

@implementation ODALessonDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODALesson *schedule = [[ODALesson alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:schedule];
    
    schedule.scheduleDescription = [dictionary objectForKey:@"description"];
    schedule.start = [self dateFromString:[dictionary objectForKey:@"start"]];
    schedule.end = [self dateFromString:[dictionary objectForKey:@"end"]];
    
    NSDictionary *roomDict = [dictionary objectForKey:@"room"];
    if (roomDict) {
        ODARoomDeserializer *roomSerializer = [[ODARoomDeserializer alloc] init];
        schedule.room = [roomSerializer deserialize:roomDict];
    }
    
    NSDictionary *courseDict = [dictionary objectForKey:@"course"];
    if (courseDict) {
        ODACourseDeserializer *courseSerializer = [[ODACourseDeserializer alloc] init];
        schedule.course = [courseSerializer deserialize:courseDict];
    }

    
    return schedule;
}

@end
