//
//  BookDetailViewController.h
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "SSManagedTableViewController.h"

@class Book;
@interface BookDetailViewController : SSManagedTableViewController

@property (nonatomic, readonly) Book *book;

@end
