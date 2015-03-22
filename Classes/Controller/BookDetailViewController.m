//
//  BookDetailViewController.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "BookDetailViewController.h"
#import "Book.h"
#import "Section.h"


@interface BookDetailViewController ()

@end

@implementation BookDetailViewController

@dynamic book;

- (Book *)book {
    return (Book *)self.managedObject;
}

- (void)setManagedObject:(SSManagedObject *)managedObject {
    [super setManagedObject:managedObject];
    self.ignoreChange = YES;
    [self.fetchedResultsController performFetch:nil];
    [self.tableView reloadData];
    self.ignoreChange = NO;
    
    self.title = self.book.title;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.book.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Configuration

- (Class)entityClass {
    return [Section class];
}


- (NSPredicate *)predicate {
    return [NSPredicate predicateWithFormat:@"book = %@", self.book];
}


- (NSString *)sectionNameKeyPath {
    return nil;
}


- (NSString *)cacheName {
    return nil;
}


#pragma mark - Working with Cells

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Section *section = [self objectForViewIndexPath:indexPath];
    cell.textLabel.text = [section.text substringToIndex:100];
}



#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const reuseIdentifier = @"SectionListViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Book *book = [self objectForViewIndexPath:indexPath];
    
}

@end
