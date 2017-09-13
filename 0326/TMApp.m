//
//  TMApp.m
//  0326
//
//  Created by tim on 2017/9/2.
//  Copyright © 2017年 tim. All rights reserved.
//

#import "TMApp.h"

@implementation TMApp


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        
    }
    return self;
}

+ (instancetype)arrayWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];

}

@end
