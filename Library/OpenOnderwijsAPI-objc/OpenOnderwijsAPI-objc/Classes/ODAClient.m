//
//  ODAClient.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODAClient.h"

@interface ODAClient ()

@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, readwrite, strong) ODAPersonsClient *personsClient;
@property (nonatomic, readwrite, strong) ODABuildingsClient *buildingsClient;
@property (nonatomic, readwrite, strong) ODARoomsClient *roomsClient;
@property (nonatomic, readwrite, strong) ODAGroupsClient *groupsClient;
@property (nonatomic, readwrite, strong) ODAAffiliationsClient *affiliationsClient;
@property (nonatomic, readwrite, strong) ODANewsItemsClient *newsItemsClient;

@end

@implementation ODAClient

- (id)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    if (self) {
        self.baseURL = baseURL;
    }
    return self;
}

- (ODAPersonsClient *)personsClient {
    if (!_personsClient) {
        _personsClient = [[ODAPersonsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _personsClient;
}

- (ODABuildingsClient *)buildingsClient {
    if (!_buildingsClient) {
        _buildingsClient = [[ODABuildingsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _buildingsClient;
}

- (ODARoomsClient *)roomsClient {
    if (!_roomsClient) {
        _roomsClient = [[ODARoomsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _roomsClient;
}

- (ODAGroupsClient *)groupsClient {
    if (!_groupsClient) {
        _groupsClient = [[ODAGroupsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _groupsClient;
}

- (ODAAffiliationsClient *)affiliationsClient {
    if (!_affiliationsClient) {
        _affiliationsClient = [[ODAAffiliationsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _affiliationsClient;
}

- (ODANewsItemsClient *)newsItemsClient {
    if (!_newsItemsClient) {
        _newsItemsClient = [[ODANewsItemsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _newsItemsClient;
}
@end
