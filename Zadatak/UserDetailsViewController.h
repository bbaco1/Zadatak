//
//  UserDetailsViewController.h
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsViewController : BaseViewController

@property (strong, nonatomic) Author *author;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

- (IBAction)userGithubButtonTouched:(UIButton *)sender;

@end
