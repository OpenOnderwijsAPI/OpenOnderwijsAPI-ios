//
//  ODAGroupRolesClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAGroupRolesClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODAGroupRoleDeserializer.h"

@implementation ODAGroupRolesClient

-(void)getById:(NSString *)groupRoleId onComplete:(ODAGroupRoleCompleteBlock)complete {
    [self GET:[NSString stringWithFormat:@"/grouproles/%@", groupRoleId] onComplete:^(BOOL success, NSDictionary *data) {
        ODAGroupRoleDeserializer *serializer = [[ODAGroupRoleDeserializer alloc] init];
        complete(success, [serializer deserialize:data]);
    }];
}

-(void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    ODAGroupRoleDeserializer *serializer = [[ODAGroupRoleDeserializer alloc] init];
    [self getListForURL:@"/grouproles" withSerializer:serializer withParameters:params onComplete:complete];
}

@end
