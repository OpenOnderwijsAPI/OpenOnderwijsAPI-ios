//
//  ODABaseDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODABaseDeserializer.h"
#import "ODAEntity.h"
#import "NSDateFormatter+ODAISO8601.h"

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
    
    if ([[dictionary allKeys] containsObject:@"lastModified"]) {
        entity.lastModified = [self dateFromString:[dictionary objectForKey:@"lastModified"]];
    }
    
    if ([[dictionary allKeys] containsObject:@"id"]) {
        entity.identifier = [dictionary objectForKey:@"id"];
    }
}

- (NSDate *)dateFromString:(NSString *)string {
    if (string) {
        if ([string length] <= 11 ) {
            return [[NSDateFormatter ODAISO8601_dateFormatter_dateOnly] dateFromString:string];
        } else if ([string rangeOfString:@"."].location == NSNotFound) {
            // iso string without millis
            return [[NSDateFormatter ODAISO8601_dateFormatter_noMillis] dateFromString:string];
        } else {
            return [[NSDateFormatter ODAISO8601_dateFormatter_millis] dateFromString:string];
        }
    }
    return nil;
}

- (id)deserialize:(NSDictionary *)dictionary {
    NSAssert(false, @"Abstract method! Must be overridden in serializers");
    return nil;
}

@end
