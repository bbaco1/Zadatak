//
//  UserDetailsViewController.m
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avatarImageView.image = self.author.avatarImage;
    [[GHSearch sharedSearch] getUserDetails:self.author withCallback:^(BOOL success) {
        if (success) {
            
        }
    }];
}

- (IBAction)userGithubButtonTouched:(UIButton *)sender {
    UIApplication *application = [UIApplication sharedApplication];
    if ([application canOpenURL:self.author.authorUrl]) {
        [application openURL:self.author.authorUrl options:@{} completionHandler:nil];
    }
}

@end
