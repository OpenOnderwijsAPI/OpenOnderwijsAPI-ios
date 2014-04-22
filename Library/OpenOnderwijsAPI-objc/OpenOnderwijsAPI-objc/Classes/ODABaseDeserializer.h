//
//  ODABaseDeserializer.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ODAEntity;

@interface ODABaseDeserializer : NSObject

- (id)deserialize:(NSDictionary *)dictionary;

- (void)mapStringFields:(NSArray *)fieldNames fromDictionary:(NSDictionary *)dictionary toEntity:(ODAEntity *)entity;
- (void)mapMetadataFieldFromDictionary:(NSDictionary *)dictionary toEntity:(ODAEntity *)entity;

@end
