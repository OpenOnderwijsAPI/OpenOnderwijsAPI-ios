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

@interface ODAAbstractClient : NSObject

- (id)initWithBaseURL:(NSString *)baseURL;

- (void)getList:(ODAParameters *)params onComplete:(ODAListCompleteBlock)complete;

@end
