//
//  ODACoursesClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODACoursesClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODACourseDeserializer.h"

@implementation ODACoursesClient

-(void)getById:(NSString *)courseId onComplete:(ODACourseCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/courses/%@", courseId] onComplete:^(BOOL success, NSDictionary *data) {
        ODACourseDeserializer *serializer = [[ODACourseDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODACourseDeserializer *serializer = [[ODACourseDeserializer alloc] init];
    [self getListForURL:@"/courses" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
