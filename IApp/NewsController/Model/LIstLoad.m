//
//  LIstLoad.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "LIstLoad.h"
#import <AFNetworking/AFNetworking.h>
#import <YYModel/YYModel.h>
#import "ListItem.h"

@implementation LIstLoad

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock {
    // 加载数据之前先去读取本地文件中的数据，在弱网的情况下优化客户的体验
    NSArray<ListItem *> *listdata = [self readDataFromLocal];
    if (listdata) {
        finishBlock(YES, listdata);
    }
    
    // 防止循环引用
    __weak typeof(self) weakSelf = self;
    NSString *url1 = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    [manager GET:url1 parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        // YYModel将请求数据封装称数组结构
        NSArray *newsModels = [NSArray yy_modelArrayWithClass:ListItem.class json:[[responseObject objectForKey:@"result"] objectForKey:@"data"]];
        
        // 序列化对象数组成二进制数据保存在文件中
        [strongSelf archiveListDataWithArray:newsModels];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(YES, newsModels);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ask failed.");
    }];
}

- (NSArray<ListItem *> *)readDataFromLocal{
    // 获取文件路径
    NSString *homePath = NSHomeDirectory();
    NSString *path = [homePath stringByAppendingPathComponent:@"Library/Caches/Data"];
    NSString *filePath = [path stringByAppendingPathComponent:@"list"];
    
    // 读取文件内容
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *readListData = [fileManager contentsAtPath:filePath];
    
    // 反序列化文件
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil]  fromData:readListData error:nil];
    
    // 判断对象类别并强转成对应的类型
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<ListItem *> *)unarchiveObj;
    }
    return nil;;
}

- (void)archiveListDataWithArray:(NSArray<ListItem *> *)array {
    NSString *homePath = NSHomeDirectory();
    NSString *path = [homePath stringByAppendingPathComponent:@"Library/Caches/Data"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *creatError;
    // 创建文件夹
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&creatError];
    // 创建文件
    NSString *filePath = [path stringByAppendingPathComponent:@"list"];
    // 将传进来的对象数组，序列化成为二进制文件
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    // 将文件保存在沙盒指定的文件夹中
    [fileManager createFileAtPath:filePath contents:listData attributes:nil];
}


@end
