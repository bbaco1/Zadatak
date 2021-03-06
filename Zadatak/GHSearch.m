//
//  GHSearch.m
//  Zadatak
//
//  Created by Milorad Orzes on 25/02/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#define kBaseGitHubUrl @"https://api.github.com"

#import "GHSearch.h"

@implementation GHSearch {
    AFHTTPSessionManager *manager;
}

+ (GHSearch *)sharedSearch {
    static GHSearch *search = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        search = [[GHSearch alloc] init];
    });
    return search;
}

- (GHSearch *)init {
    self = [super init];
    if (self) {
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseGitHubUrl]];
    }
    return self;
}

- (void)searchWithSearchString:(NSString *)searchString withSort:(NSString *)sort withCallback:(void(^)(NSArray *resposne))callback failedWithError:(void(^)(NSError *error))failureCallback {
    NSDictionary *parameters = @{
                                 @"q": searchString,
                                 @"sort":sort
                                 };
    [manager GET:@"search/repositories" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *responseMutableArray = [NSMutableArray new];
        for (NSDictionary *resultsDictionary in [responseObject objectForKey:@"items"]) {
            Repository *repository = [[Repository alloc] initWithDictionary:resultsDictionary];
            [responseMutableArray addObject:repository];
        }
        
        callback([responseMutableArray copy]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureCallback(error);
        NSLog(@"Failed to get search results with error: %@", error);
    }];
}

- (void)getAuthorDetails:(Author *)author withCallback:(void(^)(BOOL success))callback {
    NSString *getString = [NSString stringWithFormat:@"user/%@", author.IDNumber];
    [manager GET:getString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        author.nameString = [responseObject objectForKey:@"name"];
        author.organisationsUrl = [responseObject objectForKey:@"organisation_url"];
        author.followersNumberString = [responseObject objectForKey:@"followers"];
        author.emailString = [responseObject objectForKey:@"email"];
        author.companyString = [responseObject objectForKey:@"company"];
        author.bioString = [responseObject objectForKey:@"bio"];
        author.reposNumberString = [responseObject objectForKey:@"public_repos"];
        
        if (responseObject != nil) {
            callback(@YES);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failed with error: %@", error);
    }];
}

@end
