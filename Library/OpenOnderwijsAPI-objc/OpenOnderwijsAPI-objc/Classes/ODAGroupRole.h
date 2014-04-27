//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODAGroupRole : ODAEntity

@property (nonatomic, copy) NSString *groupURL;
@property (nonatomic, copy) NSString *personURL;
@property (nonatomic, copy) NSString *role;

@end
