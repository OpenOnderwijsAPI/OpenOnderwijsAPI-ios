//
//  ODATestResultsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODATestResultsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODATestResultDeserializer.h"

@implementation ODATestResultsClient

-(void)getById:(NSString *)testResultId onComplete:(ODATestResultCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/testresults/%@", testResultId] onComplete:^(BOOL success, NSDictionary *data) {
        ODATestResultDeserializer *serializer = [[ODATestResultDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODATestResultDeserializer *serializer = [[ODATestResultDeserializer alloc] init];
    [self getListForURL:@"/testresults" withSerializer:serializer withParameters:params onComplete:complete];
}

-(void)getTestResultsByPerson:(NSString *)personId params:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODATestResultDeserializer *serializer = [[ODATestResultDeserializer alloc] init];
    [self getListForURL:[NSString stringWithFormat:@"/persons/%@/testresults", personId] withSerializer:serializer withParameters:params onComplete:complete];
}

@end
