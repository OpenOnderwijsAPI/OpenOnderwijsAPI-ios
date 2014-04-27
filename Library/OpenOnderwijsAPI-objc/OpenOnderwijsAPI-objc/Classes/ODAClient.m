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
@property (nonatomic, readwrite, strong) ODANewsFeedsClient *newsFeedsClient;
@property (nonatomic, readwrite, strong) ODAGroupRolesClient *groupRolesClient;
@property (nonatomic, readwrite, strong) ODACoursesClient *coursesClient;
@property (nonatomic, readwrite, strong) ODACourseResultsClient *courseResultsClient;
@property (nonatomic, readwrite, strong) ODAScheduleClient *scheduleClient;
@property (nonatomic, readwrite, strong) ODATestResultsClient *testResultsClient;
@property (nonatomic, readwrite, strong) ODAMinorsClient *minorsClient;


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

- (ODANewsFeedsClient *)newsFeedsClient {
    if (!_newsFeedsClient) {
        _newsFeedsClient = [[ODANewsFeedsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _newsFeedsClient;
}

- (ODAGroupRolesClient *)groupRolesClient {
    if (!_groupRolesClient) {
        _groupRolesClient = [[ODAGroupRolesClient alloc] initWithBaseURL:self.baseURL];
    }
    return _groupRolesClient;
}

- (ODACoursesClient *)coursesClient {
    if (!_coursesClient) {
        _coursesClient = [[ODACoursesClient alloc] initWithBaseURL:self.baseURL];
    }
    return _coursesClient;
}

- (ODACourseResultsClient *)courseResultsClient {
    if (!_courseResultsClient) {
        _courseResultsClient = [[ODACourseResultsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _courseResultsClient;
}

- (ODAScheduleClient *)scheduleClient {
    if (!_scheduleClient) {
        _scheduleClient = [[ODAScheduleClient alloc] initWithBaseURL:self.baseURL];
    }
    return _scheduleClient;
}

- (ODATestResultsClient *)testResultsClient {
    if (!_testResultsClient) {
        _testResultsClient = [[ODATestResultsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _testResultsClient;
}

- (ODAMinorsClient *)minorsClient {
    if (!_minorsClient) {
        _minorsClient = [[ODAMinorsClient alloc] initWithBaseURL:self.baseURL];
    }
    return _minorsClient;
}

@end
