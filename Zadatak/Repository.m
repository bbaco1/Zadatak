//
//  Repository.m
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "Repository.h"

@implementation Repository

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.nameString = [dictionary objectForKey:@"name"];
        self.author = [[User alloc] initWithDictionary:[dictionary objectForKey:@"owner"]];
        self.watchersString = [dictionary objectForKey:@"watchers_count"];
        self.forkNumberString = [dictionary objectForKey:@"forks_count"];
        self.issueNumberString = [dictionary objectForKey:@"open_issues_count"];
        self.languageString = [dictionary objectForKey:@"language"];
        self.updatedString = [dictionary objectForKey:@"updated_at"];
        self.updateDate = [self getDateFromString:self.updatedString];
        self.starsNumber = [dictionary objectForKey:@"stargazers_count"];
    }
    return self;
}

- (NSDate *)getDateFromString:(NSString *)dateString {
    NSDateFormatter *dateFromatter = [[NSDateFormatter alloc] init];
    [dateFromatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return [dateFromatter dateFromString:dateString];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@, author:%@, imageUrl:%@, watchers: %@, forkNumber:%@, issuerNumber:%@", self.nameString, self.author.nameString, self.author.avatarUrl, self.watchersString, self.forkNumberString, self.issueNumberString];
}

@end
