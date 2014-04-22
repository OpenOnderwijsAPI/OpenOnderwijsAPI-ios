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

@interface ODAClient : NSObject

- (id)initWithBaseURL:(NSString *)baseURL;

@property (nonatomic, readonly) ODAPersonsClient *personsClient;
@property (nonatomic, readonly) ODABuildingsClient *buildingsClient;

@end
