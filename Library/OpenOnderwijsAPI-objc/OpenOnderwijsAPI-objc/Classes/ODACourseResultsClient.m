//
//  ODAPersonsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODACourseResultsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODACourseResultDeserializer.h"

@implementation ODACourseResultsClient

-(void)getById:(NSString *)courseResultId onComplete:(ODACourseResultCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/courseresults/%@", courseResultId] onComplete:^(BOOL success, NSDictionary *data) {
        ODACourseResultDeserializer *serializer = [[ODACourseResultDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODACourseResultDeserializer *serializer = [[ODACourseResultDeserializer alloc] init];
    [self getListForURL:@"/courseresults" withSerializer:serializer withParameters:params onComplete:complete];
}

- (void)getCourseResultsByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODACourseResultDeserializer *serializer = [[ODACourseResultDeserializer alloc] init];
    [self getListForURL:[NSString stringWithFormat:@"/persons/%@/courseresults", personId] withSerializer:serializer withParameters:params onComplete:complete];
}

@end
