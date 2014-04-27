//
//  ODANewsFeed.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 27/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODANewsFeed : ODAEntity

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *newsFeedDescription;
@property (nonatomic, strong) NSArray *items;

@end
