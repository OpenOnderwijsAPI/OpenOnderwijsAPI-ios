//
//  ODAAbstractClient-Protected.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODARequestOperation.h"

@class ODABaseDeserializer;

@interface ODAAbstractClient ()

@property (nonatomic, readwrite, strong) NSDictionary *lastError;

- (void)GET:(NSString *)resourceURL onComplete:(ODARequestCompleteBlock)complete;
- (NSString *)urlFromString:(NSString *)url appendingParams:(NSDictionary *)params;

- (void)getListForURL:(NSString *)url
       withSerializer:(ODABaseDeserializer *)serializer
       withParameters:(ODAParameters *)params
           onComplete:(ODAListCompleteBlock)complete;

- (void)getEntityForURL:(NSString *)url
         withSerializer:(ODABaseDeserializer *)serializer
         withParameters:(ODAParameters *)params
             onComplete:(ODAEntityCompleteBlock)complete;

@end
