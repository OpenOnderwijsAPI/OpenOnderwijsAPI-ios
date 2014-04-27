//
//  ODAScheduleClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAScheduleClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODALessonDeserializer.h"

@implementation ODAScheduleClient

-(void)getById:(NSString *)lessonId onComplete:(ODAScheduleCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/schedule/%@", lessonId] onComplete:^(BOOL success, NSDictionary *data) {
        ODALessonDeserializer *serializer = [[ODALessonDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODALessonDeserializer *serializer = [[ODALessonDeserializer alloc] init];
    [self getListForURL:@"/schedule" withSerializer:serializer withParameters:params onComplete:complete];
}

- (void)getScheduleByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODALessonDeserializer *serializer = [[ODALessonDeserializer alloc] init];
    [self getListForURL:[NSString stringWithFormat:@"/persons/%@/schedule", personId] withSerializer:serializer withParameters:params onComplete:complete];
}

@end
