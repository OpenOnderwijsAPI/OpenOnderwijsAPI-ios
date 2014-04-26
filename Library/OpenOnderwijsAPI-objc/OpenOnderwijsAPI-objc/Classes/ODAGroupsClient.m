//
//  ODAGroupsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 25/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAGroupsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODAGroupDeserializer.h"

@implementation ODAGroupsClient

-(void)getById:(NSString *)groupId onComplete:(ODAGroupCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/groups/%@", groupId] onComplete:^(BOOL success, NSDictionary *data) {
        ODAGroupDeserializer *serializer = [[ODAGroupDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAGroupDeserializer *serializer = [[ODAGroupDeserializer alloc] init];
    [self getListForURL:@"/groups" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
