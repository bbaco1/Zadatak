//
//  User.h
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject

@property (strong, nonatomic) NSURL *avatarUrl;
@property (strong, nonatomic) NSURL *organisationsUrl;
@property (strong, nonatomic) NSURL *authorUrl;
@property (strong, nonatomic) NSURL *gistUrl;
@property (strong, nonatomic) NSURL *reposUrl;
@property (strong, nonatomic) NSString *loginString;
@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSNumber *IDNumber;
@property (strong, nonatomic) NSString *followersUrlString;
@property (strong, nonatomic) UIImage *avatarImage;
@property (strong, nonatomic) NSString *companyString;
@property (strong, nonatomic) NSString *emailString;
@property (strong, nonatomic) NSString *followersNumberString;
@property (strong, nonatomic) NSString *reposNumberString;
@property (strong, nonatomic) NSString *bioString;

- (instancetype)initWithDictionary:(NSDictionary *)dictioanry;

@end
