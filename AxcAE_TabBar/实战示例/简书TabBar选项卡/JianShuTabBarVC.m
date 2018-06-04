//
//  JianShuTabBarVC.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/4.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "JianShuTabBarVC.h"

@interface JianShuTabBarVC ()<AxcAE_TabBarDelegate>

@end

@implementation JianShuTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子VC
    [self addChildViewControllers];
}
- (void)addChildViewControllers{
    // 创建选项卡的数据 想怎么写看自己，这块我就写笨点了
    NSArray <NSDictionary *>*VCArray =
    @[@{@"vc":[UIViewController new],@"normalImg":@"icon_tabbar_home_no",@"selectImg":@"icon_tabbar_home",@"itemTitle":@"发现"},
      @{@"vc":[UIViewController new],@"normalImg":@"icon_tabbar_subscription_no",@"selectImg":@"icon_tabbar_subscription",@"itemTitle":@"关注"},
      @{@"vc":[UIViewController new],@"normalImg":@"",@"selectImg":@"",@"itemTitle":@" "},
      @{@"vc":[UIViewController new],@"normalImg":@"icon_tabbar_notification_no",@"selectImg":@"icon_tabbar_notification",@"itemTitle":@"消息"},
      @{@"vc":[UIViewController new],@"normalImg":@"icon_tabbar_me_no",@"selectImg":@"icon_tabbar_me",@"itemTitle":@"我的"}];
    // 1.遍历这个集合
    // 1.1 设置一个保存构造器的数组
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    // 1.2 设置一个保存VC的数组
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 2.根据集合来创建TabBar构造器
        AxcAE_TabBarConfigModel *model = [AxcAE_TabBarConfigModel new];
        // 3.item基础数据三连
        model.itemTitle = [obj objectForKey:@"itemTitle"];
        model.selectImageName = [obj objectForKey:@"selectImg"];
        model.normalImageName = [obj objectForKey:@"normalImg"];
        // 4.设置单个选中item标题状态下的颜色
        model.selectColor = AxcAE_TabBarRGB(224, 111, 97);
        model.normalColor = AxcAE_TabBarRGB(140, 140, 140);
        
        /***********************************/
        if (idx == 2 ) { // 如果是中间的
            CGFloat height = self.tabBar.frame.size.height - 10;
            // 设置凸出
            model.bulgeStyle = AxcAE_TabBarConfigBulgeStyleSquare;
            // 设置凸出高度
            model.bulgeHeight = -5;
            model.bulgeRoundedCorners = height/2; // 修角
            // 设置成纯图片展示
            model.itemLayoutStyle = AxcAE_TabBarItemLayoutStylePicture;
            model.normalImageName = model.selectImageName = @"button_write";
            model.componentMargin = UIEdgeInsetsMake(0, 0, 0, 0);// 无边距
            // 设置大小/边长
            model.itemSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 15.0 ,height);
        }
        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
        // 示例中为了方便就在这写了
        UIViewController *vc = [obj objectForKey:@"vc"];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.f
                                                  green:arc4random()%255/255.f
                                                   blue:arc4random()%255/255.f alpha:1];
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:vc];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    // 5.2 设置VCs -----
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    self.viewControllers = tabBarVCs;
    //////////////////////////////////////////////////////////////////////////
    // 注：这里方便阅读就将AE_TabBar放在这里实例化了 使用懒加载也行
    // 6.将自定义的覆盖到原来的tabBar上面
    // 这里有两种实例化方案：
    // 6.1 使用重载构造函数方式：
    //    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    // 6.2 使用Set方式：
    self.axcTabBar = [AxcAE_TabBar new] ;
    self.axcTabBar.tabBarConfig = tabBarConfs;
    // 7.设置委托
    self.axcTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.axcTabBar];
    [self addLayoutTabBar]; // 10.添加适配
}
// 9.实现代理，如下：
static NSInteger lastIdx = 0;
- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
    if (index != 2) { // 不是中间的就切换
        // 通知 切换视图控制器
        [self setSelectedIndex:index];
        lastIdx = index;
    }else{ // 点击了中间的
        [self.axcTabBar setSelectIndex:lastIdx WithAnimation:NO]; // 换回上一个选中状态
        // 或者
        //        self.axcTabBar.selectIndex = lastIdx; // 不去切换TabBar的选中状态
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了中间的,不切换视图"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"好的！！！！");
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.axcTabBar){
        self.axcTabBar.selectIndex = selectedIndex;
    }
}

// 10.添加适配
- (void)addLayoutTabBar{
    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
    // 能兼容转屏时的自动布局
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.axcTabBar.frame = self.tabBar.bounds;
    [self.axcTabBar viewDidLayoutItems];
}

@end
