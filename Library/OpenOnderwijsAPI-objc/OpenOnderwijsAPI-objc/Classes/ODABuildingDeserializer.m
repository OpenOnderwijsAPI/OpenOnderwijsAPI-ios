//
//  ODABuildingDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODABuildingDeserializer.h"
#import "ODABuilding.h"

@implementation ODABuildingDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODABuilding *building = [[ODABuilding alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:building];
    
    [self mapStringFields:@[@"name", @"address", @"postalCode", @"city"] fromDictionary:dictionary toEntity:building];
    
    building.buildingDescription = [dictionary objectForKey:@"description"];
    building.abbreviation = [dictionary objectForKey:@"abbr"];
    building.latitude = [[dictionary objectForKey:@"lat"] doubleValue];
    building.longitude = [[dictionary objectForKey:@"lon"] doubleValue];
    
    return building;
}


@end
