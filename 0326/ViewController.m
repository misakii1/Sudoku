//
//  ViewController.m
//  0326
//
//  Created by tim on 2017/9/1.
//  Copyright © 2017年 tim. All rights reserved.
//

#import "ViewController.h"
#import "TMApp.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int totalColumns = 3;

    CGFloat appW = 85;
    CGFloat appH = 95;

    CGFloat marginX = (self.view.frame.size.width - appW * totalColumns) / (totalColumns + 1);
    CGFloat marginY = 25;
    for (int index = 0; index<self.apps.count; index++) {
        
        UIView *appView = [[UIView alloc] init];
        

        int row = index /totalColumns;
        int col = index % totalColumns;
        
        CGFloat appX = marginX + col * (appW + marginX);
        CGFloat appY = marginY + row * (appH + marginY);
        appView.frame = CGRectMake(appX,appY, appW, appH);
        [self.view addSubview:appView];
        
        //字典转模型
        TMApp *appInfo = self.apps[index];
        
        UIImageView *image = [[UIImageView alloc]init];
        
        CGFloat iconW = 65;
        CGFloat iconH = 65;
        CGFloat iconX = (appW -iconW) *0.5;
        CGFloat iconY = 0;
        image.frame = CGRectMake(iconX, iconY, iconW, iconH);
        image.image = [UIImage imageNamed:appInfo.icon];
        [appView addSubview:image];
        
        UILabel *nameLable = [[UILabel alloc] init];
        CGFloat nameW = appW;
        CGFloat nameH = 20;
        CGFloat nameX = 0;
        CGFloat nameY = iconY + iconH;
        nameLable.frame = CGRectMake(nameX, nameY, nameW, nameH);
        nameLable.text = appInfo.name;
        nameLable.font = [UIFont systemFontOfSize:12];
        nameLable.textAlignment = NSTextAlignmentCenter;
        [appView addSubview:nameLable];
        
        UIButton *downloadBtn = [[UIButton alloc] init];
        CGFloat downloadH = 20;
        CGFloat downloadX = 12;
        CGFloat downloadW = appW - 2 * downloadX;
        CGFloat downloadY = nameY + nameH;
        downloadBtn.frame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
        [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        downloadBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        downloadBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [appView addSubview:downloadBtn];

    }
    
}

- (NSArray *)apps
{
    if (_apps == nil) {
    
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        NSArray *dictArray =[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            
            //TMApp *app = [[TMApp alloc]initWithDict:dict];
            TMApp *app = [TMApp arrayWithDict:dict];
            
            [appArray addObject:app];
        }
        //赋值
        _apps = appArray;
        NSLog(@"%@",dictArray);
    
    }
    return _apps;
}


@end
