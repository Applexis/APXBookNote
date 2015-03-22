//
//  BookListViewController.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "BookListViewController.h"
#import "Book.h"

@interface BookListViewController ()


@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"My Books", @"");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Working with Cells

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Book *book = [self objectForViewIndexPath:indexPath];
    cell.textLabel.text = book.name;
}



#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const reuseIdentifier = @"BookListViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark - UITableViewDelegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Book *book = [self objectForViewIndexPath:indexPath];
    
}


@end
