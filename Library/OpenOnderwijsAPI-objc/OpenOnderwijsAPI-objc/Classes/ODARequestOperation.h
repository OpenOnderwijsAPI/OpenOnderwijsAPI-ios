//
//  ODARequestOperation.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ODARequestCompleteBlock)(BOOL success, NSDictionary *data);

@interface ODARequestOperation : NSObject

- (id)initWithBaseURL:(NSString *)baseURL;
- (void)GET:(NSString *)resourceURL onComplete:(ODARequestCompleteBlock)complete;

@end
