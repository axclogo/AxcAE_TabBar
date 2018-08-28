//
//  BadgeViewController.m
//  AxcAE_TabBar
//
//  Created by AxcLogo on 2018/8/27.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "BadgeViewController.h"
#import "BaseTabBar.h"

@interface BadgeViewController ()

@end

@implementation BadgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click:(id)sender {
    BaseTabBar *tabBarVC = (BaseTabBar *)self.tabBarController;
    AxcAE_TabBarItem *item = tabBarVC.axcTabBar.currentSelectItem; // 因为已经到这个页面，说明就是当前的选项卡item
    // 设置徽标位置
    AxcAE_TabBarConfigModel *itemModel = item.itemModel;
    itemModel.itemBadgeStyle = AxcAE_TabBarItemBadgeStyleTopCenter; // 因为是item强引用model，所以两个model的指针相同，可以直接设置
    
    item.badgeLabel.badgeWidth = 10; // 宽度
    item.badgeLabel.badgeHeight = 10;   // 高度
    item.badge = @"";
    // 内容随便设置，宽高都可以由你来决定，更开放一些，就是可能多两行代码O(∩_∩)O哈哈~
}

@end
