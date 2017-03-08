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
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(searchForRepository) withObject:nil afterDelay:0.3];
    return YES;
}

- (void)searchForRepository {
    [[GHSearch sharedSearch] searchWithSearchString:self.textField.text withCallback:^(NSArray *resposne) {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepositoryViewController *detailsVC = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"repositoryDetailsID"];
    [self.navigationController pushViewController:detailsVC animated:YES];
    NSLog(@"user tapped on row: %ld", indexPath.row);
}

- (void)repositoryCell:(RepositoryCell *)cell buttonTouched:(UIButton *)button {
    UserDetailsViewController *detailsVC = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:@"userDetailsID"];
    [self.navigationController pushViewController:detailsVC animated:YES];
    NSLog(@"user:%@ image touched", cell.repository.author.nameString);
}

@end
