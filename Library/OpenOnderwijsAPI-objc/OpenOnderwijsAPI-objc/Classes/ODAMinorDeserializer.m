//
//  ODAMinorDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAMinorDeserializer.h"
#import "ODAMinor.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"

@implementation ODAMinorDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODAMinor *minor = [[ODAMinor alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:minor];
    
    [self mapStringFields:@[@"name"] fromDictionary:dictionary toEntity:minor];
    minor.minorDescription = [dictionary objectForKey:@"description"];
    
    NSArray *courses = [dictionary objectForKey:@"courses"];
    if (courses) {
        minor.courseURLs = courses;;
    }
    
    return minor;
}

@end
