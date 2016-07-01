//
//  NTTabBar.m
//  NTTest
//
//  Created by chenzhaoliu on 16/7/1.
//  Copyright © 2016年 chenzhaoliu. All rights reserved.
//

#import "NTTabBar.h"

@interface NTTabBar()
@property (weak, nonatomic) UIButton *publishButton;
@end

@implementation NTTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishButton.size = publishButton.currentBackgroundImage.size;
        
        // 添加点击事件
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置发布按钮的位置尺寸
    CGFloat height = self.height;
    CGFloat width = self.width;
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    //
    NSInteger index = 0;
    CGFloat buttonH = height;
    CGFloat buttonW = width / 5;
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat x = index > 1 ? (index + 1) * buttonW : index * buttonW;
        view.frame = CGRectMake(x, 0, buttonW, buttonH);
        index++;
    }
    
}

- (void)publishClick {
    
}

@end
