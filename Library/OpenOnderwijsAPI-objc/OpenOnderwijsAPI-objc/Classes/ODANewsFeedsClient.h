//
//  ODAPersonsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODANewsFeed.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODANewsFeedCompleteBlock)(BOOL success, ODANewsFeed *newsFeed);

@interface ODANewsFeedsClient : ODAAbstractClient

// Get a specific news feed by its id.
- (void)getById:(NSString *)newsFeedId onComplete:(ODANewsFeedCompleteBlock)complete;

@end
