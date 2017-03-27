//
//  GHSearch.h
//  Zadatak
//
//  Created by Milorad Orzes on 25/02/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repository.h"
#import "Author.h"

@interface GHSearch : NSObject

+ (GHSearch *)sharedSearch;
- (void)searchWithSearchString:(NSString *)searchString withSort:(NSString *)sort withCallback:(void(^)(NSArray *resposne))callback failedWithError:(void(^)(NSError *error))failureCallback;
- (void)getAuthorDetails:(Author *)author withCallback:(void(^)(BOOL success))callback;

@end
