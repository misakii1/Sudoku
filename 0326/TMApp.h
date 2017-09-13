//
//  TMApp.h
//  0326
//
//  Created by tim on 2017/9/2.
//  Copyright © 2017年 tim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMApp : NSObject
/**
 copy : NSString
 strong: 一般对象
 weak: UI控件
 assign:基本数据类型
 */
@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *icon;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)arrayWithDict:(NSDictionary *)dict;


@end
