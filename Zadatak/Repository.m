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
        self.creationDate = [self getDateFromString:[dictionary objectForKey:@"created_at"]];
        self.updateDate = [self getDateFromString:[dictionary objectForKey:@"updated_at"]];
        self.starsNumber = [dictionary objectForKey:@"stargazers_count"];
        self.detailsUrl = [NSURL URLWithString:[dictionary objectForKey:@"html_url"]];
    }
    return self;
}

- (NSDate *)getDateFromString:(NSString *)dateString {
    NSDateFormatter *dateFromatter = [[NSDateFormatter alloc] init];
    [dateFromatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return [dateFromatter dateFromString:dateString];
}

- (void)setWatchersString:(NSString *)watchersString {
    NSString *appendingString;
    if ([watchersString isKindOfClass:[NSNumber class]]) {
        appendingString = [(NSNumber *)watchersString stringValue];
    } else if ([watchersString isKindOfClass:[NSString class]]) {
        appendingString = watchersString;
    }
    appendingString = [appendingString stringByAppendingString:@" watchers"];
    _watchersString = appendingString;
}

- (void)setForkNumberString:(NSString *)forkNumberString {
    NSString *appendingString;
    if ([forkNumberString isKindOfClass:[NSNumber class]]) {
        appendingString = [(NSNumber *)forkNumberString stringValue];
    } else if ([forkNumberString isKindOfClass:[NSString class]]) {
        appendingString = forkNumberString;
    }
    appendingString = [appendingString stringByAppendingString:@" forks"];
    _forkNumberString = appendingString;
}

- (void)setIssueNumberString:(NSString *)issueNumberString {
    NSString *appendingString;
    if ([issueNumberString isKindOfClass:[NSNumber class]]) {
        appendingString = [(NSNumber *)issueNumberString stringValue];
    } else if ([issueNumberString isKindOfClass:[NSString class]]) {
        appendingString = issueNumberString;
    }
    appendingString = [appendingString stringByAppendingString:@" issues"];
    _issueNumberString = appendingString;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@, author:%@, imageUrl:%@, watchers: %@, forkNumber:%@, issuerNumber:%@", self.nameString, self.author.nameString, self.author.avatarUrl, self.watchersString, self.forkNumberString, self.issueNumberString];
}

@end
