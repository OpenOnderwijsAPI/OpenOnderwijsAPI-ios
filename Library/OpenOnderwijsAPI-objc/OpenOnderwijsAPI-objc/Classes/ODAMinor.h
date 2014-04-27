//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODAMinor : ODAEntity

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *minorDescription;
@property (nonatomic, copy) NSArray *courseURLs;

@end
