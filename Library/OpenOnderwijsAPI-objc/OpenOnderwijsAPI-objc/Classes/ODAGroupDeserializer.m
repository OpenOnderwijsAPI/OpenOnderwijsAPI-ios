//
//  ODAGroupDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAGroupDeserializer.h"
#import "ODAGroup.h"
#import "ODAPersonDeserializer.h"

@implementation ODAGroupDeserializer

// This deserializer has a few quirks. person.group and group have a different set of fields.
- (ODAGroup *)deserialize:(NSDictionary *)dictionary {
    ODAGroup *group = [[ODAGroup alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:group];
    
    if ([dictionary objectForKey:@"groupName"]) {
        group.name = [dictionary objectForKey:@"groupName"];
    } else {
        group.name = [dictionary objectForKey:@"name"];
    }
    
    if ([dictionary objectForKey:@"groupType"]) {
        group.type = [dictionary objectForKey:@"groupType"];
    } else {
        group.type = [dictionary objectForKey:@"type"];
    }
    
    if ([dictionary objectForKey:@"url"]) {
        group.resourceURL = [dictionary objectForKey:@"url"];
    } else if ([dictionary objectForKey:@"group"]) { // In some calls the url is set in group key.
        group.resourceURL = [dictionary objectForKey:@"group"];
    }
    
    group.groupDescription = [dictionary objectForKey:@"description"];
    
    NSArray *members = [dictionary objectForKey:@"members"];
    if (members) {
        ODAPersonDeserializer *personDeserializer = [[ODAPersonDeserializer alloc] init];
        NSMutableArray *parsedMembers = [[NSMutableArray alloc] initWithCapacity:[members count]];
        for (NSDictionary *personDict in members) {
            ODAPerson *person = [personDeserializer deserialize:personDict];
            [parsedMembers addObject:person];
        }
        group.members = [NSArray arrayWithArray:parsedMembers];
    }
    return group;
}

@end
