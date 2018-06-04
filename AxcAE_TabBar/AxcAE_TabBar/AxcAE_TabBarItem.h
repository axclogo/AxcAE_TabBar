//
//  AxcAE_TabBarItem.h
//  Axc_AEUI
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AxcAE_TabBarBadge.h"

// 凸出后的形状
typedef NS_ENUM(NSInteger, AxcAE_TabBarConfigBulgeStyle) {
    AxcAE_TabBarConfigBulgeStyleNormal = 0,         // 无 默认
    AxcAE_TabBarConfigBulgeStyleCircular,           // 圆形
    AxcAE_TabBarConfigBulgeStyleSquare              // 方形
};

// item相对在tabbar的独立单元格布局
typedef NS_ENUM(NSInteger, AxcAE_TabBarConfigAlignmentStyle) {
    AxcAE_TabBarConfigAlignmentStyleCenter = 0,           // 居中 默认
    AxcAE_TabBarConfigAlignmentStyleCenterTop,            // 顶部对齐
    AxcAE_TabBarConfigAlignmentStyleCenterLeft,           // 靠左对齐
    AxcAE_TabBarConfigAlignmentStyleCenterRight,          // 靠右对齐
    AxcAE_TabBarConfigAlignmentStyleCenterBottom,         // 靠下对齐
    
    AxcAE_TabBarConfigAlignmentStyleTopLeft,        // 上左对齐
    AxcAE_TabBarConfigAlignmentStyleTopRight,       // 上右对齐
    
    AxcAE_TabBarConfigAlignmentStyleBottomLeft,     // 下左对齐
    AxcAE_TabBarConfigAlignmentStyleBottomRight,    // 下右对齐
};

// item内部组件布局模式
typedef NS_ENUM(NSInteger, AxcAE_TabBarItemLayoutStyle) {
    AxcAE_TabBarItemLayoutStyleTopPictureBottomTitle = 0,   // 上图片下文字 默认
    AxcAE_TabBarItemLayoutStyleBottomPictureTopTitle,       // 下图片上文字
    AxcAE_TabBarItemLayoutStyleLeftPictureRightTitle,       // 左图片右文字
    AxcAE_TabBarItemLayoutStyleRightPictureLeftTitle,       // 右图片左文字
    AxcAE_TabBarItemLayoutStylePicture,                     // 单图片占满全部
    AxcAE_TabBarItemLayoutStyleTitle,                       // 单标题占满全部
};

// item的Badge脚标方位
typedef NS_ENUM(NSInteger, AxcAE_TabBarItemBadgeStyle) {
    AxcAE_TabBarItemBadgeStyleTopRight = 0,   // 右上方 默认
    AxcAE_TabBarItemBadgeStyleTopCenter,      // 上中间
    AxcAE_TabBarItemBadgeStyleTopLeft         // 左上方
};

// 点击触发时候的交互效果
typedef NS_ENUM(NSInteger, AxcAE_TabBarInteractionEffectStyle) {
    AxcAE_TabBarInteractionEffectStyleNone,     // 无 默认
    AxcAE_TabBarInteractionEffectStyleSpring,   // 放大放小弹簧效果
    AxcAE_TabBarInteractionEffectStyleShake,    // 摇动动画效果
    AxcAE_TabBarInteractionEffectStyleAlpha,    // 透明动画效果
    AxcAE_TabBarInteractionEffectStyleCustom,   // 自定义动画效果
};

@class AxcAE_TabBarItem;
// 当交互效果选选择自定义时，会回调以下Block
typedef void(^CustomInteractionEffectBlock) (AxcAE_TabBarItem *item);


@interface AxcAE_TabBarConfigModel : NSObject

#pragma mark - 标题控制类
// item的标题
@property(nonatomic, copy)NSString *itemTitle;
// 默认标题颜色 默认灰色
@property (nonatomic, strong) UIColor *normalColor;
// 选中标题颜色 默认AxcAE_TabBarItemSlectBlue
@property (nonatomic, strong) UIColor *selectColor;

#pragma mark - 图片控制类
// 选中后的图片名称
@property(nonatomic, copy)NSString *selectImageName;
// 正常的图片名称
@property(nonatomic, copy)NSString *normalImageName;
// 默认的 图片tintColor
@property(nonatomic, strong)UIColor *normalTintColor;
// 选中的 图片tintColor
@property(nonatomic, strong)UIColor *selectTintColor;

#pragma mark - item背景控制类
// 默认的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *normalBackgroundColor;
// 选中的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *selectBackgroundColor;
// 单个item的背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;

#pragma mark - item附加控制类
// 凸出形变类型
@property(nonatomic, assign)AxcAE_TabBarConfigBulgeStyle bulgeStyle;
// 凸出高于TabBar多高 默认20
@property(nonatomic, assign)CGFloat bulgeHeight;
// 突出后圆角 默认0  如果是圆形的圆角，则会根据设置的ItemSize最大宽度自动裁切，设置后将按照此参数进行裁切
@property(nonatomic, assign)CGFloat bulgeRoundedCorners;
// item相对TabBar对齐模式
@property(nonatomic, assign)AxcAE_TabBarConfigAlignmentStyle alignmentStyle;
// item大小
@property(nonatomic, assign)CGSize itemSize;
// 角标内容
@property(nonatomic, strong)NSString *badge;
// 角标方位
@property(nonatomic, assign)AxcAE_TabBarItemBadgeStyle itemBadgeStyle;
// 为零是否自动隐藏 默认不隐藏
@property(nonatomic, assign)BOOL automaticHidden;

#pragma mark - item内部组件控制类
// TitleLabel指针
@property (nonatomic, strong) UILabel *titleLabel;
// imageView
@property (nonatomic, strong) UIImageView *icomImgView;
// item内部组件布局模式
@property(nonatomic, assign)AxcAE_TabBarItemLayoutStyle itemLayoutStyle;
// titleLabel大小 有默认值
@property(nonatomic, assign)CGSize titleLabelSize;
// icomImgView大小 有默认值
@property(nonatomic, assign)CGSize icomImgViewSize;
// 所有组件距离item边距 默认 UIEdgeInsetsMake(5, 5, 10, 5)
@property(nonatomic, assign)UIEdgeInsets componentMargin;
// 图片文字的间距 默认 2
@property(nonatomic, assign)CGFloat pictureWordsMargin;

#pragma mark - item交互控制类
// 点击触发后的交互效果
@property(nonatomic, assign)AxcAE_TabBarInteractionEffectStyle interactionEffectStyle;
// 是否允许重复点击触发动画 默认NO
@property(nonatomic, assign)BOOL isRepeatClick;
// 当交互效果选选择自定义时，会回调以下Block
@property(nonatomic, copy)CustomInteractionEffectBlock customInteractionEffectBlock;
// 多个自定义时候使用区分的Tag
@property(nonatomic, assign)NSInteger tag;

@end





@interface AxcAE_TabBarItem : UIControl

// 构造
- (instancetype)initWithModel:(AxcAE_TabBarConfigModel *)itemModel;

// 标题
@property (nonatomic, copy) NSString *title;
// 默认标题颜色
@property (nonatomic, strong) UIColor *normalColor;
// 选中标题颜色
@property (nonatomic, strong) UIColor *selectColor;
// 默认的 Image
@property (nonatomic, strong) UIImage *normalImage;
// 选中的 Image
@property (nonatomic, strong) UIImage *selectImage;
// 默认的 图片tintColor
@property(nonatomic, strong)UIColor *normalTintColor;
// 选中的 图片tintColor
@property(nonatomic, strong)UIColor *selectTintColor;
// 默认的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *normalBackgroundColor;
// 选中的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *selectBackgroundColor;
// 单个item的背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;
// 角标内容
@property(nonatomic, strong)NSString *badge;
// item的所在索引
@property(nonatomic, assign)NSInteger itemIndex;

// 选中状态
@property (nonatomic, assign) BOOL isSelect;
// imageView
@property (nonatomic, strong) UIImageView *icomImgView;
// 标题Label
@property (nonatomic, strong) UILabel *titleLabel;
// 角标Label
@property(nonatomic, strong)AxcAE_TabBarBadge *badgeLabel;

// 模型构造器
@property(nonatomic, strong)AxcAE_TabBarConfigModel *itemModel;
// 重新开始布局
- (void)itemDidLayoutControl;
// 开始执行设置的动画
- (void)startStrringConfigAnimation;

@end
