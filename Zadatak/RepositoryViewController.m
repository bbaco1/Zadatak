//
//  RepositoryViewController.m
//  Zadatak
//
//  Created by Milorad Orzes on 06/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "RepositoryViewController.h"
#import "UserDetailsViewController.h"

@interface RepositoryViewController ()

@end

@implementation RepositoryViewController

#pragma mark view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLabels];
}

#pragma mark - user interaction methods
- (IBAction)ownerDetailsButtonTouched:(UIButton *)sender {
    UserDetailsViewController *userDetailsViewController = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"userDetailsID"];
    userDetailsViewController.author = self.repository.author;
    [self.navigationController pushViewController:userDetailsViewController animated:YES];
}

- (IBAction)repositoryWebButtonTouched:(UIButton *)sender {
    NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @NO};
    if ([[UIApplication sharedApplication] canOpenURL:self.repository.detailsUrl]) {
        [[UIApplication sharedApplication] openURL:self.repository.detailsUrl options:options completionHandler:nil];    }
}

- (void)setLabels {
    self.nameLabel.text = self.repository.nameString;
    self.authorNameLabel.text = self.repository.author.nameString;
    self.watchersNumberLabel.text = self.repository.watchersString;
    self.forksNumberLabel.text = self.repository.forkNumberString;
    self.issueNumberLabel.text = self.repository.issueNumberString;
    self.programmingLanguageLabel.text = self.repository.languageString;
    self.dateOfCreationLabel.text = [NSDateFormatter localizedStringFromDate:self.repository.creationDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
    self.dateOfChangeLabel.text = [NSDateFormatter localizedStringFromDate:self.repository.updateDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];

}
@end
