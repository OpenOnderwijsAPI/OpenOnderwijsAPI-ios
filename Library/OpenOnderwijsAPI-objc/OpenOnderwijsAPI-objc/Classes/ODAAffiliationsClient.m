//
//  ODAAffiliationsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAAffiliationsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODAAffiliationDeserializer.h"

@implementation ODAAffiliationsClient

-(void)getById:(NSString *)affiliationId onComplete:(ODAAffiliationCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/affiliations/%@", affiliationId] onComplete:^(BOOL success, NSDictionary *data) {
        ODAAffiliationDeserializer *serializer = [[ODAAffiliationDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAAffiliationDeserializer *serializer = [[ODAAffiliationDeserializer alloc] init];
    [self getListForURL:@"/affiliations" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
