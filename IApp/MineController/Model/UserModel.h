//
//  UserModel.h
//  IApp
//
//  Created by 张强 on 2020/8/3.
//  Copyright © 2020 codeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (void)loadUserDatas;

@end

NS_ASSUME_NONNULL_END
