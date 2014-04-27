//
//  ODANewsItemsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//
#import "ODANewsItemsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODANewsItemDeserializer.h"

@implementation ODANewsItemsClient

-(void)getById:(NSString *)newsItemId onComplete:(ODANewsItemCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/newsitems/%@", newsItemId] onComplete:^(BOOL success, NSDictionary *data) {
        ODANewsItemDeserializer *serializer = [[ODANewsItemDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODANewsItemDeserializer *serializer = [[ODANewsItemDeserializer alloc] init];
    [self getListForURL:@"/newsitems" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
