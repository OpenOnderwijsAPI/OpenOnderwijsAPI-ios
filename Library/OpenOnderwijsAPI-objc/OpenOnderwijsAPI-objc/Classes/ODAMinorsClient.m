//
//  ODAMinorsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAMinorsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODAMinorDeserializer.h"

@implementation ODAMinorsClient

-(void)getById:(NSString *)minorId onComplete:(ODAMinorCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/minors/%@", minorId] onComplete:^(BOOL success, NSDictionary *data) {
        ODAMinorDeserializer *serializer = [[ODAMinorDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAMinorDeserializer *serializer = [[ODAMinorDeserializer alloc] init];
    [self getListForURL:@"/minors" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
