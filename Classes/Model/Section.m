//
//  Section.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "Section.h"
#import "Book.h"


@implementation Section

@dynamic remoteID;
@dynamic text;
@dynamic date;
@dynamic synced;
@dynamic book;


- (void)setBook:(Book *)book {
    [self willChangeValueForKey:@"book"];
    [self setPrimitiveValue:book forKey:@"book"];
    book.updatedAt = NSDate();
    [self didChangeValueForKey:@"book"];
}

// override
+ (NSArray *)defaultSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:@"remoteID" ascending:YES]];
}

@end
