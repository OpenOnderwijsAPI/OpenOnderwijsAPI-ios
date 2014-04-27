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
    
    [self mapStringFields:@[@"givenName", @"surName", @"displayName", @"mail", @"telephoneNumber", @"mobileNumber",
                      @"photo", @"gender", @"organisation", @"department", @"title", @"office",
                      @"employeeID", @"studentID"] fromDictionary:dictionary toEntity:person];
    
    NSArray *affiliations = [dictionary objectForKey:@"affiliations"];
    if (affiliations) {
        person.affiliations = affiliations;
    }
    
    NSArray *groups = [dictionary objectForKey:@"groups"];
    if (groups) {
        ODAGroupDeserializer *groupDeserializer = [[ODAGroupDeserializer alloc] init];
        NSMutableArray *parsedGroups = [[NSMutableArray alloc] initWithCapacity:[groups count]];
        
        for (NSDictionary *groupDict in groups) {
            ODAGroup *group = [groupDeserializer deserialize:groupDict];
            [parsedGroups addObject:group];
        }
        person.groups = [NSArray arrayWithArray:parsedGroups];

    }
 
    return person;
}

@end
