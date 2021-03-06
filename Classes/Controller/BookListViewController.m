//
//  BookListViewController.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "BookListViewController.h"
#import "Book.h"
#import "BookDetailViewController.h"

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


#pragma mark - Configuration

- (Class)entityClass {
    return [Book class];
}


- (NSPredicate *)predicate {
    return nil;
}


- (NSString *)sectionNameKeyPath {
    return nil;
}


- (NSString *)cacheName {
    return nil;
}


#pragma mark - Working with Cells

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Book *book = [self objectForViewIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.subtitle;
}



#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const reuseIdentifier = @"BookListViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark - UITableViewDelegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Book *book = [self objectForViewIndexPath:indexPath];
    
    BookDetailViewController *detailViewController = [[BookDetailViewController alloc] init];
    detailViewController.managedObject = book;
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
