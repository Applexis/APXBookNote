//
//  Section.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "Section.h"


@implementation Section

@dynamic section_id;
@dynamic text;
@dynamic date;
@dynamic synced;


// override
+ (NSArray *)defaultSortDescriptors {
    return @[[NSSortDescriptor sortDescriptorWithKey:@"section_id" ascending:YES]]
}

@end
