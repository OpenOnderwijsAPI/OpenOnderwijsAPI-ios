//
//  ODAPersonsClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODABuildingsClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODABuildingDeserializer.h"

@implementation ODABuildingsClient

-(void)getById:(NSString *)buildingId onComplete:(ODABuildingCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/buildings/%@", buildingId] onComplete:^(BOOL success, NSDictionary *data) {
        ODABuildingDeserializer *serializer = [[ODABuildingDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODABuildingDeserializer *serializer = [[ODABuildingDeserializer alloc] init];
    [self getListForURL:@"/buildings" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
