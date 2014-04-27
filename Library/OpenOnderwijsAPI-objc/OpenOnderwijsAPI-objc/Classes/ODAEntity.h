//
//  ODAEntity.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODAEntity : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *resourceURL;
@property (nonatomic, strong) NSDate *lastModified;

@end
