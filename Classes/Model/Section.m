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


// override
+ (NSArray *)defaultSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:@"remoteID" ascending:YES]];
}

@end
