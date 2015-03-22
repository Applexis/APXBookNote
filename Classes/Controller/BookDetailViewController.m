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


@interface BookDetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UINavigationItem *rightBarButtonItem;

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
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Getter 

- (UINavigationItem *)rightBarButtonItem {
    if (!_rightBarButtonItem) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@"addSection:"];
    }
    return _rightBarButtonItem;
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

#pragma mark - Actions

- (void)addSection:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        return;
    }

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


// Not use now.
/*
- (void)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
 */


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
