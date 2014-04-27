//
//  NSDateFormatter+ISO8601.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 27/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "NSDateFormatter+ODAISO8601.h"

@implementation NSDateFormatter (ODAISO8601)

+ (NSDateFormatter *)ODAISO8601_dateFormatter_millis {
    
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *formatter = [dictionary objectForKey:@"ODAISO8601_dateFormatter_millis"];
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
        // Always use this locale when parsing fixed format date strings
        NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [formatter setLocale:posix];
    }
    
    return formatter;
}

+ (NSDateFormatter *)ODAISO8601_dateFormatter_noMillis {
    
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *formatter = [dictionary objectForKey:@"ODAISO8601_dateFormatter_noMillis"];
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        // Always use this locale when parsing fixed format date strings
        NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [formatter setLocale:posix];
    }
    
    return formatter;
}

+ (NSDateFormatter *)ODAISO8601_dateFormatter_dateOnly {
    
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *formatter = [dictionary objectForKey:@"ODAISO8601_dateFormatter_dateOnly"];
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'"];
        // Always use this locale when parsing fixed format date strings
        NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [formatter setLocale:posix];
    }
    
    return formatter;
}

@end
