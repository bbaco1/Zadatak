//
//  NSArray+Extensions.h
//  Zadatak
//
//  Created by Milorad Orzes on 07/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SortTypeStars,
    SortTypeForks,
    SortTypeUpdated,
} SortType;

@interface NSArray (Extensions)

+ (NSArray *)sortArray:(NSArray *)sortArray withSortType:(SortType)sortType;

@end
