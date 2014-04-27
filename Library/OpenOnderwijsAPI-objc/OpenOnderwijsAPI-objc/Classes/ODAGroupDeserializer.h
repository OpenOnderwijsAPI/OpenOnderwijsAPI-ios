//
//  ODAGroupDeserializer.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODABaseDeserializer.h"

@class ODAGroup;

@interface ODAGroupDeserializer : ODABaseDeserializer

- (ODAGroup *)deserialize:(NSDictionary *)dictionary;

@end
