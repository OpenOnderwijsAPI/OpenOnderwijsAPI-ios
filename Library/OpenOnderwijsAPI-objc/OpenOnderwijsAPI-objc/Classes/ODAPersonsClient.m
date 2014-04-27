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
    ODAPersonDeserializer *serializer = [[ODAPersonDeserializer alloc] init];
    [self getEntityForURL:[NSString stringWithFormat:@"/persons/%@", personId]
           withSerializer:serializer
           withParameters:nil
               onComplete:complete];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAPersonDeserializer *serializer = [[ODAPersonDeserializer alloc] init];
    [self getListForURL:@"/persons" withSerializer:serializer withParameters:params onComplete:complete];
}

-(void)getMeOnComplete:(ODAPersonCompleteBlock)complete {
    if (!self.accessToken) {
        complete(NO, nil);
    } else {
        [self getById:@"@me" onComplete:complete];
    }
}

@end
