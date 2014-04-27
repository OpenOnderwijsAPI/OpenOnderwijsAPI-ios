//
//  ODANewsItem.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODANewsItem : ODAEntity

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate *publicationDate;

@end
