//
//  ODANewsFeedDeserializer.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODANewsFeedDeserializer.h"
#import "ODANewsFeed.h"
#import "ODANewsItem.h"
#import "ODABaseDeserializer.h"
#import "ODAGroupDeserializer.h"
#import "ODANewsItemDeserializer.h"

@implementation ODANewsFeedDeserializer

- (id)deserialize:(NSDictionary *)dictionary {
    ODANewsFeed *newsFeed = [[ODANewsFeed alloc] init];
    [self mapMetadataFieldFromDictionary:dictionary toEntity:newsFeed];
    
    newsFeed.title = [dictionary objectForKey:@"title"];
    newsFeed.newsFeedDescription = [dictionary objectForKey:@"description"];
    
    NSArray *items = [dictionary objectForKey:@"items"];
    if (items) {
        ODANewsItemDeserializer *newsItemDeserializer = [[ODANewsItemDeserializer alloc] init];
        NSMutableArray *parsedItems = [[NSMutableArray alloc] initWithCapacity:[items count]];
        
        for (NSDictionary *itemDict in items) {
            ODANewsItem *item = [newsItemDeserializer deserialize:itemDict];
            [parsedItems addObject:item];
        }
        newsFeed.items = [NSArray arrayWithArray:parsedItems];

    }
 
    return newsFeed;
}

@end
