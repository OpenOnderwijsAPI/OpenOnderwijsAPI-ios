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
@end
