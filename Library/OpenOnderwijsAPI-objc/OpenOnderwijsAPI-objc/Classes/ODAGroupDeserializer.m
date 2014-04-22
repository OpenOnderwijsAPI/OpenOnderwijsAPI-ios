//
//  ODAGroupDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAGroupDeserializer.h"
#import "ODAGroup.h"

@implementation ODAGroupDeserializer

- (ODAGroup *)deserialize:(NSDictionary *)dictionary {
    ODAGroup *group = [[ODAGroup alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:group];
    
    group.name = [dictionary objectForKey:@"groupName"];
    group.groupDescription = [dictionary objectForKey:@"description"];
    group.type = [dictionary objectForKey:@"groupType"];
    
    // metamapper will read wrong field for resourceurl.
    group.resourceURL = [dictionary objectForKey:@"group"];
    
    return group;
}

@end
