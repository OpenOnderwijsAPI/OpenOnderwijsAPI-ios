//
//  ODAPersonsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAPersonsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODAPersonDeserializer.h"

@implementation ODAPersonsClient

-(void)getById:(NSString *)personId onComplete:(ODAPersonCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/persons/%@", personId] onComplete:^(BOOL success, NSDictionary *data) {
        ODAPersonDeserializer *serializer = [[ODAPersonDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAPersonDeserializer *serializer = [[ODAPersonDeserializer alloc] init];
    [self getListForURL:@"/persons" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
