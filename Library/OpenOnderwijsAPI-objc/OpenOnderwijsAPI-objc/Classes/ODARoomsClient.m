//
//  ODARoomsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODARoomsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODARoomDeserializer.h"

@implementation ODARoomsClient

-(void)getById:(NSString *)roomId onComplete:(ODARoomCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/rooms/%@", roomId] onComplete:^(BOOL success, NSDictionary *data) {
        ODARoomDeserializer *serializer = [[ODARoomDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODARoomDeserializer *serializer = [[ODARoomDeserializer alloc] init];
    [self getListForURL:@"/rooms" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
