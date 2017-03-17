//
//  User.m
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictioanry {
    self = [super init];
    if (self) {
        self.loginString = [dictioanry objectForKey:@"login"];
        self.avatarUrl = [dictioanry objectForKey:@"avatar_url"];
        self.IDString = [dictioanry objectForKey:@"id"];
        self.userUrl = [dictioanry objectForKey:@"url"];
        self.reposUrl = [dictioanry objectForKey:@"repos_url"];
        self.nameString = [dictioanry objectForKey:@""];
    }
    return self;
}

- (void)setAvatarUrl:(NSURL *)avatarUrl {
    if ([avatarUrl isKindOfClass:[NSString class]]) {
        _avatarUrl = [NSURL URLWithString:(NSString *)avatarUrl];
    } else if ([avatarUrl isKindOfClass:[NSURL class]]) {
        _avatarUrl = avatarUrl;
    }
}

//- (void)setFollowersUrlString:(NSString *)followersUrlString {
//    
//    
//}

@end
