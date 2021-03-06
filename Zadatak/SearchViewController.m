//
//  ViewController.m
//  Zadatak
//
//  Created by Milorad Orzes on 23/02/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "SearchViewController.h"
#import "UserDetailsViewController.h"
#import "RepositoryViewController.h"
#import "NSArray+Extensions.h"

@interface SearchViewController () {
    NSArray *datasource;
    NSString *sortTypeString;
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sortTypeString = @"stars";
    UIButton *button = (UIButton *)self.buttonCollection[0];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    self.textField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(searchForRepository) withObject:nil afterDelay:0.3];
    return YES;
}

- (void)searchForRepository {
    [[GHSearch sharedSearch] searchWithSearchString:self.textField.text withSort:sortTypeString withCallback:^(NSArray *resposne) {
        datasource = resposne;
        datasource = [NSArray sortArray:[datasource copy] withSortType:SortTypeUpdated];
        [self.tableView reloadData];
    } failedWithError:^(NSError *error) {
        datasource = nil;
        [self.tableView reloadData];
    }];
}

#pragma mark - tableView delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepositoryCell *repositoryCell = [tableView dequeueReusableCellWithIdentifier:@"repositoryCellID"];
    repositoryCell.repository = [datasource objectAtIndex:indexPath.row];
    repositoryCell.delegate = self;
    return repositoryCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepositoryViewController *detailsVC = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"repositoryDetailsID"];
    detailsVC.repository = [datasource objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

- (void)repositoryCell:(RepositoryCell *)cell buttonTouched:(UIButton *)button {
    UserDetailsViewController *detailsVC = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"userDetailsID"];
    detailsVC.author = cell.repository.author;
    [self.navigationController pushViewController:detailsVC animated:YES];
}

- (IBAction)sortButtonTouched:(UIButton *)sender {
    for (UIButton *button in self.buttonCollection) {
        button.backgroundColor = [UIColor clearColor];
        button.tintColor = [UIColor blueColor];
    }
    sender.backgroundColor = [UIColor blueColor];
    sender.tintColor = [UIColor whiteColor];
    if ([sender.titleLabel.text isEqualToString:@"Stars"]) {
        sortTypeString = @"stars";
    } else if ([sender.titleLabel.text isEqualToString:@"Forks"]) {
        sortTypeString = @"forks";
    } else {
        sortTypeString = @"updated";
    }
    [self searchForRepository];
}

@end
