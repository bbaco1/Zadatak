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
    [[GHSearch sharedSearch] getAuthorDetails:self.author withCallback:^(BOOL success) {
        if (success) {
            [self showAuthorData];
        }
    }];
}

- (void)showAuthorData {
    self.nameLabel.text = self.author.nameString;
    self.loginLabel.text = self.author.loginString;
    self.gistLabel.text = [self.author.gistUrl absoluteString];
    self.companyLabel.text = self.author.companyString;
    self.emailLabel.text = self.author.emailString;
    self.repositoryLabel.text = [self.author.reposUrl absoluteString];
    self.idLabel.text = [NSString stringWithFormat:@"%@", self.author.IDNumber];
    self.followersLabel.text = self.author.followersNumberString;
    self.bioLabel.text = self.author.bioString;
}

- (IBAction)userGithubButtonTouched:(UIButton *)sender {
    UIApplication *application = [UIApplication sharedApplication];
    if ([application canOpenURL:self.author.authorUrl]) {
        [application openURL:self.author.authorUrl options:@{} completionHandler:nil];
    }
}

@end
