//
//  ODAClient.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAPersonsClient.h"
#import "ODABuildingsClient.h"
#import "ODARoomsClient.h"
#import "ODAGroupsClient.h"
#import "ODAAffiliationsClient.h"
#import "ODANewsItemsClient.h"

@interface ODAClient : NSObject

- (id)initWithBaseURL:(NSString *)baseURL;

@property (nonatomic, readonly) ODAPersonsClient *personsClient;
@property (nonatomic, readonly) ODABuildingsClient *buildingsClient;
@property (nonatomic, readonly) ODARoomsClient *roomsClient;
@property (nonatomic, readonly) ODAGroupsClient *groupsClient;
@property (nonatomic, readonly) ODAAffiliationsClient *affiliationsClient;
@property (nonatomic, readonly) ODANewsItemsClient *newsItemsClient;
@end
