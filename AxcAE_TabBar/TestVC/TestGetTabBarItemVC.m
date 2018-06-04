//
//  TestGetTabBarItemVC.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/4.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "TestGetTabBarItemVC.h"
#import "BaseTabBar.h"

@interface TestGetTabBarItemVC ()
;
@property(nonatomic, assign)NSInteger badge;
@end

@implementation TestGetTabBarItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)click:(id)sender {
    BaseTabBar *tabBarVC = (BaseTabBar *)self.tabBarController;
    AxcAE_TabBarItem *item = tabBarVC.axcTabBar.currentSelectItem; // 因为已经到这个页面，说明就是当前的选项卡item
    // 或者可以这么获取
//    AxcAE_TabBarItem *item = tabBarVC.axcTabBar.tabBarItems[2]; // 这个下标是固定的，代表这个页面下的item
    
    self.badge ++;
    item.badge = [NSString stringWithFormat:@"%ld",self.badge];
    // 为0是否自动隐藏
//    item.badgeLabel.automaticHidden = YES;
    
}


@end
