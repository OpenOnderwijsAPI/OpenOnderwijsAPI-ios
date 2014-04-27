//
//  ODAAbstractClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAAbstractClient.h"
#import "ODAAbstractClient-Protected.h"
#import "ODARequestOperation.h"
#import "ODABaseDeserializer.h"
#import "ODAParameters.h"

@interface ODAAbstractClient () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, strong) NSMutableArray *operationQueue;
@end

@implementation ODAAbstractClient

- (id)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    if (self) {
        self.baseURL = baseURL;
        self.operationQueue = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return self;
}

- (void)GET:(NSString *)resourceURL onComplete:(ODARequestCompleteBlock)complete {
    ODARequestOperation *operation = [[ODARequestOperation alloc] initWithBaseURL:self.baseURL accessToken:self.accessToken];
    [operation GET:resourceURL onComplete:complete];
}

- (void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete {
    NSAssert(false, @"Abstract method! Needs override in ...Client");
}

- (void)getListForURL:(NSString *)url
       withSerializer:(ODABaseDeserializer *)serializer
       withParameters:(ODAParameters *)params
           onComplete:(ODAListCompleteBlock)complete {
    NSString *resourceURL = [self urlFromString:url appendingParams:[params dictionaryRepresentation]];
    [self GET:resourceURL onComplete:^(BOOL success, NSDictionary *data) {
        NSInteger itemCount = 0;
        if (success) {
            if (data[@"meta"][@"thisPage"]) {
                itemCount = [data[@"meta"][@"thisPage"] integerValue];
            }
            NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:itemCount];
            for (NSDictionary *itemDict in [data objectForKey:@"data"]) {
                [list addObject:[serializer deserialize:itemDict]];
            }
            complete(success, [NSArray arrayWithArray:list]);
        } else {
            self.lastError = data;
            complete(success, nil);
        }
    }];
}

- (void)getEntityForURL:(NSString *)url
         withSerializer:(ODABaseDeserializer *)serializer
         withParameters:(ODAParameters *)params
             onComplete:(ODAEntityCompleteBlock)complete {
    NSString *resourceURL = [self urlFromString:url appendingParams:[params dictionaryRepresentation]];
    [self GET:resourceURL onComplete:^(BOOL success, NSDictionary *data) {
        id entity = nil;
        if (success) {
            entity = [serializer deserialize:data];
        } else {
            self.lastError = data;
        }
        complete(success, entity);
    }];
}


// Inspired by http://stackoverflow.com/questions/718429/creating-url-query-parameters-from-nsdictionary-objects-in-objectivec
- (NSString*)urlEscapeString:(NSString *)unencodedString
{
    CFStringRef originalStringRef = (__bridge_retained CFStringRef)unencodedString;
    NSString *s = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,originalStringRef, NULL, NULL,kCFStringEncodingUTF8);
    CFRelease(originalStringRef);
    return s;
}

- (NSString *)urlFromString:(NSString *)string appendingParams:(NSDictionary *)params {
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:string];
        
    for (id key in params) {
        NSString *keyString = [key description];
        NSString *valueString = [[params objectForKey:key] description];
        
        if ([urlWithQuerystring rangeOfString:@"?"].location == NSNotFound) {
            [urlWithQuerystring appendFormat:@"?%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        } else {
            [urlWithQuerystring appendFormat:@"&%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        }
    }
    return urlWithQuerystring;
}

@end
