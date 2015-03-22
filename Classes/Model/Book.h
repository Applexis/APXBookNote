//
//  Book.h
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <SSDataKit/SSDataKit.h>

@interface Book : SSRemoteManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * start_date;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSNumber *book_id;

@end
