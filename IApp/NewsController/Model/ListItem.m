//
//  ListItem.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (void)configWithDictionary:(NSDictionary *)dictionary {
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

# pragma mark - NSSecureCoding
- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.category = [coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
        self.uniqueKey = [coder decodeObjectForKey:@"uniqueKey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.authorName = [coder decodeObjectForKey:@"authorName"];
        self.articleUrl = [coder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
