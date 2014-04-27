//
//  ODARoom.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 22/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODARoom : ODAEntity

@property (nonatomic, copy) NSString *abbreviation;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *roomDescription;
@property (nonatomic, assign) NSInteger totalSeats;
@property (nonatomic, assign) NSInteger totalWorkspaces;
@property (nonatomic, assign) NSInteger availableWorkspaces;

@end
