//
//  Book.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "Book.h"


@implementation Book

@dynamic title;
@dynamic subtitle;
@dynamic startDate;
@dynamic author;
@dynamic remoteID;
@dynamic updatedAt;
@dynamic sections;

// override
+ (NSArray *)defaultSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:@"remoteID" ascending:YES]];
}

@end
