//
//  User.h
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSURL *avatarUrl;
@property (strong, nonatomic) NSURL *organisationsUrl;
@property (strong, nonatomic) NSURL *userUrl;
@property (strong, nonatomic) NSURL *gistUrl;
@property (strong, nonatomic) NSURL *reposUrl;

@property (strong, nonatomic) NSString *loginString;
@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSString *IDString;
@property (strong, nonatomic) NSString *followersUrlString;

- (instancetype)initWithDictionary:(NSDictionary *)dictioanry;

@end
