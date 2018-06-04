//
//  AxcAE_TabBar.h
//  Axc_AEUI
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcAE_TabBarBadge.h"
#import "AxcAE_TabBarItem.h"

@class AxcAE_TabBar;
@class AxcAE_TabBarConfigModel;



@protocol AxcAE_TabBarDelegate <NSObject >

- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index;

@end

@interface AxcAE_TabBar : UIView
#pragma mark - 主动属性
// 重载构造创建方法
- (instancetype)initWithTabBarConfig:(NSArray <AxcAE_TabBarConfigModel *> *)tabBarConfig;
// 直接设置/SET方法
@property(nonatomic, strong)NSArray <AxcAE_TabBarConfigModel *>*tabBarConfig;
// 进行item子视图重新布局 最好推荐在TabBarVC中的 -viewDidLayoutSubviews 中执行，可以达到自动布局的效果
- (void)viewDidLayoutItems;
// TabBar背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;
// 当前选中的 TabBar
@property (nonatomic, strong) AxcAE_TabBarItem *currentSelectItem;
// 设置角标
- (void)setBadge:(NSString *)Badge index:(NSUInteger)index;
// 是否开启毛玻璃模糊效果 默认NO不开启
@property(nonatomic, assign)BOOL translucent;
// 模糊效果的构造Style
@property(nonatomic, strong)UIBlurEffect* effect;
// 模糊效果的视图
@property(nonatomic, strong)UIVisualEffectView* effectView;

#pragma mark - 存储/获取属性
// 使/获取 当前选中下标
@property (nonatomic, assign) NSInteger selectIndex;
// 是否触发设置的动画效果
- (void)setSelectIndex:(NSInteger)selectIndex WithAnimation:(BOOL )animation;

// TabbarItems集合
@property (nonatomic, readonly, strong) NSArray <AxcAE_TabBarItem *> *tabBarItems;
// 代理
@property (nonatomic, weak) id <AxcAE_TabBarDelegate>delegate;




@end



