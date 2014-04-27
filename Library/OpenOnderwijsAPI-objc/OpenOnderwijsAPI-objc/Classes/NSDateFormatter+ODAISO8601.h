//
//  NSDateFormatter+ISO8601.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 27/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ODAISO8601)

+ (NSDateFormatter *)ODAISO8601_dateFormatter_millis;
+ (NSDateFormatter *)ODAISO8601_dateFormatter_noMillis;
+ (NSDateFormatter *)ODAISO8601_dateFormatter_dateOnly;

@end
