//
//  ODAAbstractClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ODAParameters;

typedef void (^ODAListCompleteBlock)(BOOL success, NSArray *list);
typedef void (^ODAEntityCompleteBlock)(BOOL success, id entity);

@interface ODAAbstractClient : NSObject

- (id)initWithBaseURL:(NSString *)baseURL;

- (void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete;

// If your api has oauth support, set the accessToken on a client to make requests authorized.
// Reset it to nil to make the next call unauthorized.
// The token is passed to the API as a bearer token.
@property (nonatomic, strong) NSString *accessToken;

@property (nonatomic, readonly) NSDictionary *lastError;

@end
