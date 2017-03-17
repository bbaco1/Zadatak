//
//  Repository.h
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repository : NSObject

@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) User *author;
@property (strong, nonatomic) NSString *watchersString;
@property (strong, nonatomic) NSString *forkNumberString;
@property (strong, nonatomic) NSString *issueNumberString;
@property (strong, nonatomic) NSString *languageString;
@property (strong, nonatomic) NSDate *updateDate;
@property (strong, nonatomic) NSDate *creationDate;
@property (strong, nonatomic) NSNumber *starsNumber;
@property (strong, nonatomic) NSURL *detailsUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
