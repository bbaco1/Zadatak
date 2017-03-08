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
@property (strong, nonatomic) NSString *stars;
@property (weak, nonatomic) IBOutlet UILabel *repositoryName;
@property (weak, nonatomic) IBOutlet UIButton *userAvatarButton;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

- (IBAction)userAvatarButtonTouced:(UIButton *)sender;

@end
