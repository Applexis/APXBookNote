//
//  Section.h
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <SSDataKit/SSDataKit.h>


@interface Section : SSRemoteManagedObject

@property (nonatomic, retain) NSNumber * section_id;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * synced;

@end
