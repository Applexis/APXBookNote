//
//  Book.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "Book.h"


@implementation Book

@dynamic name;
@dynamic start_date;
@dynamic author;
@dynamic book_id;


// override
+ (NSArray *)defaultSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:@"book_id" ascending:YES]];
}

@end
