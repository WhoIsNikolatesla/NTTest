//
//  NTEssenceViewController.m
//  NTTest
//
//  Created by chenzhaoliu on 16/6/30.
//  Copyright © 2016年 chenzhaoliu. All rights reserved.
//

#import "NTEssenceViewController.h"
#import "NTTopicController.h"

@interface NTEssenceViewController ()
@property (weak, nonatomic) UIView *titleButtonView;
@property (strong, nonatomic) NSMutableArray *titleButtonArray;
@property (weak, nonatomic) UIButton *selectedButton;
@end

@implementation NTEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableViewControll];
    
    [self setUpScrollView];
    
    [self setUpTitleView];
}

- (NSMutableArray *)titleButtonArray
{
    if (!_titleButtonArray) {
        _titleButtonArray = [NSMutableArray array];
    }
    return _titleButtonArray;
}

#pragma mark - 创建tableviewControll
- (void)setUpTableViewControll {
    
    NTTopicController *all = [[NTTopicController alloc] init];
    all.title = @"全部";
    [self addChildViewController:all];
    
    NTTopicController *video = [[NTTopicController alloc] init];
    video.title = @"视频";
    [self addChildViewController:video];
    
    NTTopicController *audio = [[NTTopicController alloc] init];
    audio.title = @"声音";
    [self addChildViewController:audio];
    
    NTTopicController *picture = [[NTTopicController alloc] init];
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    NTTopicController *word = [[NTTopicController alloc] init];
    word.title = @"段子";
    [self addChildViewController:word];
    
}

#pragma mark - 创建scrollview
- (void)setUpScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor colorWithRed:215 / 255.0 green:215 / 255.0 blue:215 / 255.0 alpha:1];
    scrollView.frame = self.view.bounds;
    
    [self.view addSubview:scrollView];
    
}

#pragma mark - 创建导航栏
- (void)setUpTitleView {
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 35)];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    [self.view addSubview:titleView];
    
    for (int i = 0; i < 5; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        titleButton.y = 0;
        titleButton.x = i * self.view.frame.size.width / 5;
        titleButton.size = CGSizeMake(self.view.frame.size.width / 5, 35);
        
        [titleView addSubview:titleButton];
        [self.titleButtonArray addObject:titleButton];
        
    }
    
    UIView *titleButtonView = [[UIView alloc] init];
    titleButtonView.backgroundColor = [self.titleButtonArray.lastObject titleColorForState:UIControlStateSelected];
    titleButtonView.y = 33;
    titleButtonView.height = 2;
    titleButtonView.width = 10;
    [titleView addSubview:titleButtonView];
    self.titleButtonView = titleButtonView;
    
    UIButton *fristSelectedButton = self.titleButtonArray.firstObject;
    [fristSelectedButton.titleLabel sizeToFit];
    titleButtonView.width = fristSelectedButton.titleLabel.width;
    titleButtonView.centerX = fristSelectedButton.centerX;
    [self buttonClick:self.titleButtonArray.firstObject];
    
}

#pragma mark - 导航栏按钮的点击事件
- (void)buttonClick:(UIButton *)titleButton {
    
    self.selectedButton.selected = NO;
    titleButton.selected = YES;
    self.selectedButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.titleButtonView.width = titleButton.titleLabel.width;
        self.titleButtonView.centerX = titleButton.centerX;
    }];
    
}

@end
