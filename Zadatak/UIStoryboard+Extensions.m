//
//  UIStoryboard+Extensions.m
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "UIStoryboard+Extensions.h"

@implementation UIStoryboard (Extensions)

+ (UIStoryboard *)mainStoryboard {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return mainStoryboard;
}

@end
