//
//  ODAPerson.h
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 31/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODAEntity.h"

@interface ODAPerson : ODAEntity

@property (nonatomic, copy) NSString *personID;
@property (nonatomic, copy) NSString *givenName;
@property (nonatomic, copy) NSString *surName;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *mail;
@property (nonatomic, copy) NSString *telephoneNumber;
@property (nonatomic, copy) NSString *mobileNumber;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *organisation;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *office;
@property (nonatomic, copy) NSString *employeeID;
@property (nonatomic, copy) NSString *studentID;
@property (nonatomic, copy) NSArray *affiliations;
@property (nonatomic, copy) NSArray *groups;

@end
