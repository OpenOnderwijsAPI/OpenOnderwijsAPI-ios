//
//  ODANewsItemDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 26/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODANewsItemDeserializer.h"
#import "ODANewsItem.h"

@implementation ODANewsItemDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODANewsItem *newsItem = [[ODANewsItem alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:newsItem];
    
    [self mapStringFields:@[@"url", @"title", @"author", @"image", @"link", @"content"] fromDictionary:dictionary toEntity:newsItem];
    
    newsItem.newsItemID = [dictionary objectForKey:@"id"];
    
    // todo date
    // newsItem.publicationDate = [dictionary objectForKey:@"pubDate"];
    
    return newsItem;
}

@end
