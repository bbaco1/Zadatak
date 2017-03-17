//
//  RepositoryViewController.h
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepositoryViewController : BaseViewController

@property (strong, nonatomic) Repository *repository;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *watchersNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *forksNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *issueNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *programmingLanguageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfCreationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfChangeLabel;

- (IBAction)ownerDetailsButtonTouched:(UIButton *)sender;
- (IBAction)repositoryWebButtonTouched:(UIButton *)sender;

@end
