//
//  ODAGroupRoleDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAGroupRoleDeserializer.h"
#import "ODAGroupRole.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"

@implementation ODAGroupRoleDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODAGroupRole *groupRole = [[ODAGroupRole alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:groupRole];
    
    [self mapStringFields:@[@"role"] fromDictionary:dictionary toEntity:groupRole];
    
    groupRole.groupURL = [dictionary objectForKey:@"group"];
    groupRole.personURL = [dictionary objectForKey:@"person"];
    
    return groupRole;
}

@end
