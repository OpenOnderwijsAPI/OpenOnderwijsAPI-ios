//
//  ODAAffiliationDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 25/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAAffiliationDeserializer.h"
#import "ODAAffiliation.h"

@implementation ODAAffiliationDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODAAffiliation *affiliation = [[ODAAffiliation alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:affiliation];
    
    affiliation.name = [dictionary objectForKey:@"affiliation"];
    
    if ([dictionary objectForKey:@"persons"]) {
        affiliation.personUrls = [dictionary objectForKey:@"persons"];
    }
    
    return affiliation;
}

@end
