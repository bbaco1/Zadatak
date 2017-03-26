//
//  ViewController.h
//  Zadatak
//
//  Created by Milorad Orzes on 23/02/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepositoryCell.h"

@interface SearchViewController : BaseViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, RepositoryCellDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;

- (IBAction)sortButtonTouched:(UIButton *)sender;

@end

