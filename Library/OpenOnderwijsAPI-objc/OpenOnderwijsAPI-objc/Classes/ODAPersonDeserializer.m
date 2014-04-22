//
//  ODAPersonDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAPersonDeserializer.h"
#import "ODAPerson.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"

@implementation ODAPersonDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODAPerson *person = [[ODAPerson alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:person];
    
    person.personID = [dictionary objectForKey:@"id"];

    [self mapStringFields:@[@"givenName", @"surName", @"displayName", @"mail", @"telephoneNumber", @"mobileNumber",
                      @"photo", @"gender", @"organisation", @"department", @"title", @"office",
                      @"employeeID", @"studentID"] fromDictionary:dictionary toEntity:person];
    
    NSArray *affiliations = [dictionary objectForKey:@"affiliations"];
    if (affiliations) {
        person.affiliations = affiliations;
    }
    
    ODAGroupDeserializer *groupDeserializer = [[ODAGroupDeserializer alloc] init];
    NSArray *groups = [dictionary objectForKey:@"groups"];
    NSMutableArray *parsedGroups = [[NSMutableArray alloc] initWithCapacity:[groups count]];
    if (groups) {
        for (NSDictionary *groupDict in groups) {
            ODAGroup *group = [groupDeserializer deserialize:groupDict];
            [parsedGroups addObject:group];
        }
    }
    person.groups = [NSArray arrayWithArray:parsedGroups];

    return person;
}

@end
