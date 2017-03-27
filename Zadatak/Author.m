//
//  User.m
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "Author.h"

@implementation Author

- (instancetype)initWithDictionary:(NSDictionary *)dictioanry {
    self = [super init];
    if (self) {
        self.loginString = [dictioanry objectForKey:@"login"];
        self.avatarUrl = [dictioanry objectForKey:@"avatar_url"];
        self.IDNumber = [dictioanry objectForKey:@"id"];
        self.authorUrl = [dictioanry objectForKey:@"html_url"];
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

- (void)setAuthorUrl:(NSURL *)authorUrl {
    if ([authorUrl isKindOfClass:[NSString class]]) {
        _authorUrl = [NSURL URLWithString:(NSString *)authorUrl];
    } else if ([authorUrl isKindOfClass:[NSURL class]]) {
        _authorUrl = authorUrl;
    }
}

- (void)setCompanyString:(NSString *)companyString {
    if ([companyString isKindOfClass:[NSString class]]) {
        _companyString = companyString;
    } else {
        _companyString = @"-";
    }
}

- (void)setEmailString:(NSString *)emailString {
    if ([emailString isKindOfClass:[NSString class]]) {
        _emailString = emailString;
    } else {
        _emailString = @"-";
    }
}

- (void)setReposUrl:(NSURL *)reposUrl {
    if ([reposUrl isKindOfClass:[NSURL class]]) {
        _reposUrl = reposUrl;
    } else {
        _reposUrl = nil;
    }
}

- (void)setBioString:(NSString *)bioString {
    if ([bioString isKindOfClass:[NSString class]]) {
        _bioString = bioString;
    } else {
        _bioString = @"-";
    }
}

- (void)setFollowersNumberString:(NSString *)followersNumberString {
    _followersUrlString = [NSString stringWithFormat:@"%ld", (long)followersNumberString];
}

@end
