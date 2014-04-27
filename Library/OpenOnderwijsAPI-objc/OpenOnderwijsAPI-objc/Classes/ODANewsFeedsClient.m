//
//  ODANewsFeedsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODANewsFeedsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODANewsFeedDeserializer.h"

@implementation ODANewsFeedsClient

-(void)getById:(NSString *)newsFeedId onComplete:(ODANewsFeedCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/newsfeeds/%@", newsFeedId] onComplete:^(BOOL success, NSDictionary *data) {
        ODANewsFeedDeserializer *serializer = [[ODANewsFeedDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODANewsFeedDeserializer *serializer = [[ODANewsFeedDeserializer alloc] init];
    [self getListForURL:@"/newsfeeds" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
