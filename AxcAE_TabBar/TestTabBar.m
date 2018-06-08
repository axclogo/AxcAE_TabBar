//
//  TestTabBar.m
//  AxcAE_TabBar
//
//  Created by Axc on 2018/6/8.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "TestTabBar.h"
#import "AxcAE_TabBar.h"

@implementation TestTabBar
//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让凸出按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        for (UIView *subView in self.subviews) {
            CGPoint myPoint = [subView convertPoint:point fromView:self];
            // 根据坐标判断是否为凸出按钮
            if (myPoint.y < 0) {
                // 如果子视图为TabBar
                if ([subView isKindOfClass:[AxcAE_TabBar class]]) {
                    // 遍历子视图TabBar的子视图
                    for (UIView *axcTabBarItem in subView.subviews) {
                        // 并且这个视图类属于Item
                        if ([axcTabBarItem isKindOfClass:[AxcAE_TabBarItem class]]) {
                            // 判断点击点是否位于按钮内
                            if (CGRectContainsPoint(axcTabBarItem.frame, myPoint)) {
                                // 触发事件传达给item
                                return axcTabBarItem;
                            }
                        }
                    }
                }
            }
        }
        return view;
    } else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return view;
    }
}
@end
