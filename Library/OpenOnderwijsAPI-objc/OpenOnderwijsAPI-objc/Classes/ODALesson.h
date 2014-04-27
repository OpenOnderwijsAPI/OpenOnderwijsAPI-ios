//
//  ODASchedule.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 27/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@class ODARoom;
@class ODACourse;

@interface ODALesson : ODAEntity

@property (nonatomic, strong) ODARoom *room;
@property (nonatomic, strong) ODACourse *course;
@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) NSDate *end;
@property (nonatomic, copy) NSString *scheduleDescription;

@end
