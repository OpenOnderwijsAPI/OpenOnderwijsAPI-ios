//
//  ODABaseDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODABaseDeserializer.h"
#import "ODAEntity.h"

@implementation ODABaseDeserializer

- (void)mapStringFields:(NSArray *)fieldNames fromDictionary:(NSDictionary *)dictionary toEntity:(ODAEntity *)entity {
    for (NSString *fieldName in fieldNames) {
        if ([[dictionary allKeys] containsObject:fieldName]) {
            [entity setValue:[dictionary valueForKey:fieldName] forKey:fieldName];
        }
    }
}

- (void)mapMetadataFieldFromDictionary:(NSDictionary *)dictionary toEntity:(ODAEntity *)entity {
    if ([[dictionary allKeys] containsObject:@"resourceURL"]) {
        entity.resourceURL = [dictionary objectForKey:@"resourceURL"];
    } else if ([[dictionary allKeys] containsObject:@"url"]) {
        entity.resourceURL = [dictionary objectForKey:@"url"];
    }
    
    // todo lastModified (not currently present in api)
}

- (id)deserialize:(NSDictionary *)dictionary {
    NSAssert(false, @"Abstract method! Must be overridden in serializers");
    return nil;
}

@end
