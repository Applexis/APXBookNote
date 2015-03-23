//
//  HttpClient.m
//  BookNote
//
//  Created by applex on 15-3-23.
//  Copyright (c) 2015年 cn.edu.sjtu. All rights reserved.
//

#import "HttpClient.h"
#import <AFNetworking/AFNetworking.h>

static NSString *baseAddress = @"http://104.236.222.190:8000/";

@implementation HttpClient

+ (void)uploadImage:(UIImage *)image success:(void(^)(id response))successHandler failure:(void(^)(NSError *))failureHandler {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    NSString *fileName = @"test3.jpg";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = responseSerializer;
    
    [manager POST:[baseAddress stringByAppendingString:@"ocr"] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData
                                    name:@"files"
                                fileName:fileName mimeType:@"image/jpeg"];
        
//        [formData appendPartWithFormData:[key1 dataUsingEncoding:NSUTF8StringEncoding]
//                                    name:@"key1"];
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        if (successHandler) {
            successHandler(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (failureHandler) {
            failureHandler(error);
        }
    }];

}


@end
