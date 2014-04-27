//
//  ODABuilding.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODABuilding : ODAEntity

@property (nonatomic, copy) NSString *abbreviation;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *buildingDescription;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end
