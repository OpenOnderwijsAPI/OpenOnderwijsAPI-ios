//
//  ODAAffiliation.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 25/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODAAffiliation : ODAEntity

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *personUrls;

@end
