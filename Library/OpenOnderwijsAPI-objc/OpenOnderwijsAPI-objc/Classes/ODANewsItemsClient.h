//
//  ODANewsItemsClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODANewsItem.h"
#import "ODAAbstractClient.h"
#import "ODAParameters.h"

typedef void (^ODANewsItemCompleteBlock)(BOOL success, ODANewsItem *newsItem);

@interface ODANewsItemsClient : ODAAbstractClient

// Get a specific newsitem by its id.
- (void)getById:(NSString *)newsItemId onComplete:(ODANewsItemCompleteBlock)complete;

@end
