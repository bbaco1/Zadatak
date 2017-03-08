//
//  RepositoryCell.m
//  Zadatak
//
//  Created by Milorad Orzes on 02/03/2017.
//  Copyright © 2017 Milorad Orzes. All rights reserved.
//

#import "RepositoryCell.h"
#import <UIImageView+AFNetworking.h>

@implementation RepositoryCell

- (void)setRepository:(Repository *)repository {
    _repository = repository;
    self.repositoryNameLabel.text = repository.nameString;
    self.authorNameLabel.text = repository.author.loginString;
    self.watchersNumberLabel.text = repository.watchersString;
    self.forkNumberLabel.text = repository.forkNumberString;
    self.issueNumberLabel.text = repository.issueNumberString;
    [self setAvatarImageWithUrl:repository.author.avatarUrl];
}

- (void)setAvatarImageWithUrl:(NSURL *)avatarUrl {
    NSURLRequest *request = [NSURLRequest requestWithURL:avatarUrl];
    [self.avatarImageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [self.avatarImageView setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"Failed to get image with error: %@", error);
    }];
}

- (IBAction)userAvatarButtonTouced:(UIButton *)sender {
    [self.delegate repositoryCell:self buttonTouched:sender];
}

@end
