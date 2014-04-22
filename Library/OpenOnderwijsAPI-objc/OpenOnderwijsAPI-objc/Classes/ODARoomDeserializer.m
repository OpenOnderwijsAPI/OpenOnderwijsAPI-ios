//
//  ODARoomDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//


#import "ODARoomDeserializer.h"
#import "ODARoom.h"

@implementation ODARoomDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODARoom *room = [[ODARoom alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:room];
    
    room.roomID = [dictionary objectForKey:@"id"];
    
    [self mapStringFields:@[@"name", @"address", @"postalCode", @"city"] fromDictionary:dictionary toEntity:room];
    
    room.roomDescription = [dictionary objectForKey:@"description"];
    room.abbreviation = [dictionary objectForKey:@"abbr"];
    
    room.totalSeats = [[dictionary objectForKey:@"totalSeats"] integerValue];
    room.totalWorkspaces = [[dictionary objectForKey:@"totalWorkspaces"] integerValue];
    room.availableWorkspaces = [[dictionary objectForKey:@"availableWorkspaces"] integerValue];
    
    return room;
}


@end
