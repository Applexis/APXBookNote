//
//  HttpClient.h
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HttpClient : NSObject

+ (void)uploadImage:(UIImage *)image success:(void(^)(id response))successHandler failure:(void(^)(NSError *))failureHandler;

@end
