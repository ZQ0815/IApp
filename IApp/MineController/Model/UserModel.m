//
//  UserModel.m
//  IApp
//
//  Created by 张强 on 2020/8/3.
//  Copyright © 2020 codeam. All rights reserved.
//

#import "UserModel.h"
#import <AFNetworking/AFNetworking.h>

@implementation UserModel

- (void)loadUserDatas {
    NSString *url = @"http://localhost:8080/hello";
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    // 允许接收不同类型的响应数据格式
    manager.responseSerializer.acceptableContentTypes =  [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",@"application/atom+xml",@"application/xml",@"text/xml",nil]];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *userList = [responseObject objectForKey:@"data"];
        NSLog(@"%@", userList);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"qing qiu shi bai");
    }];
}

@end
