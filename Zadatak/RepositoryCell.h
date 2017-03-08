//
//  RepositoryCell.h
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repository.h"
#import "BaseCell.h"

@class RepositoryCell;
@protocol RepositoryCellDelegate <NSObject>

- (void)repositoryCell:(RepositoryCell *)cell buttonTouched:(UIButton *)button;

@end

@interface RepositoryCell : BaseCell

@property (weak, nonatomic) id <RepositoryCellDelegate> delegate;
@property (strong, nonatomic) Repository *repository;
@property (weak, nonatomic) IBOutlet UILabel *repositoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *userAvatarButton;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *watchersNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *forkNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *issueNumberLabel;

- (IBAction)userAvatarButtonTouced:(UIButton *)sender;

@end
