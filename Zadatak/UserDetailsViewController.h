//
//  UserDetailsViewController.h
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) User *author;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) UIImage *avatarImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
