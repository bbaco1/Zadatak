//
//  NSArray+Extensions.m
//  Zadatak
//
//  Created by Milorad Orzes on 07/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "NSArray+Extensions.h"

@implementation NSArray (Extensions)

+ (NSArray *)sortArray:(NSArray *)array withSortType:(SortType)sortType {
    NSString *sortKey = @"";
    switch (sortType) {
        case SortTypeStars:
            sortKey = @"stars";
            break;
        case SortTypeForks:
            sortKey = @"forkNumber";
            break;
        case SortTypeUpdated:
            sortKey = @"updateDate";
            break;
        default:
            break;
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    return sortedArray;
}

@end
