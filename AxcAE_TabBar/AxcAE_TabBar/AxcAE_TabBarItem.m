//
//  AxcAE_TabBarItem.m
//  Axc_AEUI
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "AxcAE_TabBarItem.h"

@implementation AxcAE_TabBarItem

#pragma mark - 构造
- (instancetype)init{
    self = [super init];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithModel:(AxcAE_TabBarConfigModel *)itemModel{
    self = [super init];
    if (self) {
        [self configuration];
        [self setItemModel:itemModel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self itemDidLayoutControl]; // 进行组件布局 （因为需要封装，所以没打算在第一时间进行布局）
    [self itemDidLayoutBadgeLabel]; // 进行脚标布局
}
////////
#pragma mark - 配置实例
- (void)configuration{

}
- (void)itemDidLayoutBadgeLabel{
    switch (self.itemModel.itemBadgeStyle) {
        case AxcAE_TabBarItemBadgeStyleTopRight:{   // 右上方 默认
            self.badgeLabel.center = CGPointMake(self.frame.size.width - (self.badgeLabel.frame.size.width/2),self.badgeLabel.frame.size.height/2 );
        }break;
        case AxcAE_TabBarItemBadgeStyleTopCenter:{      // 上中间
            self.badgeLabel.center = CGPointMake(self.frame.size.width/2,self.badgeLabel.frame.size.height/2 );
        }break;
        case AxcAE_TabBarItemBadgeStyleTopLeft:{         // 左上方
            self.badgeLabel.center = CGPointMake((self.badgeLabel.frame.size.width/2),self.badgeLabel.frame.size.height/2 );
        }break;
        default: break;
    }
}

#define iconImgView_Proportion (2.0/3.0)
#define titleLabel_Proportion (1.0/3.0)
- (void)itemDidLayoutControl{
    // 开始内部布局
    self.backgroundImageView.frame = self.bounds;
    CGRect iconImgFrame = self.icomImgView.frame;
    CGRect titleFrame = self.titleLabel.frame;
    BOOL isIcomImgViewSize = self.itemModel.icomImgViewSize.width || self.itemModel.icomImgViewSize.height;
    BOOL isTitleLabelSize = self.itemModel.titleLabelSize.width || self.itemModel.titleLabelSize.height;
    // 除去边距后的最大宽度
    CGFloat marginWidth = self.frame.size.width - self.itemModel.componentMargin.left - self.itemModel.componentMargin.right;
    // 进行决策设置大小
    if (isIcomImgViewSize){
        iconImgFrame.size = self.itemModel.icomImgViewSize;
    }else{
        iconImgFrame.size = CGSizeMake(marginWidth, self.frame.size.height * iconImgView_Proportion - self.itemModel.componentMargin.top - 5);
    }
    if (isTitleLabelSize){
        titleFrame.size = self.itemModel.titleLabelSize;
    }else{
        titleFrame.size = CGSizeMake(marginWidth, self.frame.size.height - iconImgFrame.size.height - self.itemModel.componentMargin.bottom);
    }
    // 至此大小已计算完毕，开始布局
    self.titleLabel.hidden = NO;
    self.icomImgView.hidden = NO;
    switch (self.itemModel.itemLayoutStyle) {
        case AxcAE_TabBarItemLayoutStyleTopPictureBottomTitle:{         // 上图片下文字 使用图3 文1比
            iconImgFrame.origin.y = self.itemModel.componentMargin.top;
            iconImgFrame.origin.x = (self.frame.size.width - iconImgFrame.size.width)/2;
            // 图上文下 文label的高度要减去间距
            titleFrame.size.height -= self.itemModel.pictureWordsMargin;
            titleFrame.origin.y = iconImgFrame.origin.y + iconImgFrame.size.height + self.itemModel.pictureWordsMargin;
            titleFrame.origin.x = (self.frame.size.width - titleFrame.size.width)/2;
        }break;
        case AxcAE_TabBarItemLayoutStyleBottomPictureTopTitle:{         // 下图片上文字
            titleFrame.origin.y = self.itemModel.componentMargin.top;
            titleFrame.origin.x = (self.frame.size.width - iconImgFrame.size.width)/2;
            titleFrame.size.height = self.frame.size.height * iconImgView_Proportion - self.itemModel.componentMargin.top - self.itemModel.pictureWordsMargin - 5;
            // 下图片上文字 图的高度要减去间距
            iconImgFrame.origin.y = titleFrame.origin.y + titleFrame.size.height + self.itemModel.pictureWordsMargin;
            iconImgFrame.origin.x = self.itemModel.componentMargin.left;
            iconImgFrame.size = CGSizeMake(marginWidth, self.frame.size.height -
                                           titleFrame.size.height - titleFrame.origin.y - self.itemModel.componentMargin.bottom - self.itemModel.pictureWordsMargin);
        }break;
        case AxcAE_TabBarItemLayoutStyleLeftPictureRightTitle:{         // 左图片右文字
            // 左右布局要重新计算图片宽度和文本高度 比例要按照相反的1：3计算
            iconImgFrame.size.width = self.frame.size.width * titleLabel_Proportion ;
            titleFrame.size.height = self.frame.size.height - self.itemModel.componentMargin.top - self.itemModel.componentMargin.bottom;
            titleFrame.size.width = self.frame.size.width - // 图片的右下终点坐标 + 边距 + 组件右边距极限
            (iconImgFrame.size.width + iconImgFrame.origin.x + self.itemModel.pictureWordsMargin + self.itemModel.componentMargin.right);
            
            iconImgFrame.origin.y = (self.frame.size.height - iconImgFrame.size.height)/2;
            iconImgFrame.origin.x = self.itemModel.componentMargin.left;
            // 左图片右文字 文label的宽度要减去间距
            titleFrame.size.width -= self.itemModel.pictureWordsMargin;
            titleFrame.origin.y = self.itemModel.componentMargin.top;
            titleFrame.origin.x = iconImgFrame.size.width + iconImgFrame.origin.x + self.itemModel.pictureWordsMargin;
        }break;
        case AxcAE_TabBarItemLayoutStyleRightPictureLeftTitle:{         // 右图片左文字
            // 左右布局要重新计算图片宽度和文本高度 比例要按照相反的1：3计算
            iconImgFrame.size.width = self.frame.size.width * titleLabel_Proportion ;
            titleFrame.size.height = self.frame.size.height - self.itemModel.componentMargin.top - self.itemModel.componentMargin.bottom;
            titleFrame.size.width = self.frame.size.width - // 图片的右下终点坐标 + 边距 + 组件右边距极限
            (iconImgFrame.size.width  + self.itemModel.pictureWordsMargin + self.itemModel.componentMargin.right);
            
            titleFrame.origin.x = self.itemModel.componentMargin.left;
            // 左图片右文字 文label的宽度要减去间距
            titleFrame.size.width -= self.itemModel.pictureWordsMargin;
            titleFrame.origin.y = self.itemModel.componentMargin.top;
            
            iconImgFrame.origin.y = (self.frame.size.height - iconImgFrame.size.height)/2;
            iconImgFrame.origin.x = titleFrame.size.width + titleFrame.origin.x + self.itemModel.pictureWordsMargin;
        }break;
        case AxcAE_TabBarItemLayoutStylePicture:{                       // 单图片占满全部
            iconImgFrame.size = CGSizeMake(self.frame.size.width - self.itemModel.componentMargin.left - self.itemModel.componentMargin.right,
                                           self.frame.size.height - self.itemModel.componentMargin.top - self.itemModel.componentMargin.bottom);
            iconImgFrame.origin = CGPointMake(self.itemModel.componentMargin.right, self.itemModel.componentMargin.top);
            self.titleLabel.hidden = YES;
        }break;
        case AxcAE_TabBarItemLayoutStyleTitle:{                         // 单标题占满全部
            titleFrame.size = CGSizeMake(self.frame.size.width - self.itemModel.componentMargin.left - self.itemModel.componentMargin.right,
                                           self.frame.size.height - self.itemModel.componentMargin.top - self.itemModel.componentMargin.bottom);
            titleFrame.origin = CGPointMake(self.itemModel.componentMargin.right, self.itemModel.componentMargin.top);
            self.icomImgView.hidden = YES;
        }break;
        default:  break;
    }
    self.icomImgView.frame = iconImgFrame;
    self.titleLabel.frame = titleFrame;
}
#pragma mark - 动画函数
- (void)startStrringConfigAnimation{
    WeakSelf;//添加动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    switch (self.itemModel.interactionEffectStyle) {
        case AxcAE_TabBarInteractionEffectStyleNone:{ // 无
        }break;
        case AxcAE_TabBarInteractionEffectStyleSpring:{ // 放大放小
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 0.6;
            animation.calculationMode = kCAAnimationCubic;
            
        }break;
        case AxcAE_TabBarInteractionEffectStyleShake:{ // 摇动
            animation.keyPath = @"transform.rotation";
            CGFloat angle = M_PI_4 / 10;
            animation.values = @[@(-angle), @(angle), @(-angle)];
            animation.duration = 0.2f;
        }break;
        case AxcAE_TabBarInteractionEffectStyleAlpha:{ // 透明
            animation.keyPath = @"opacity";
            animation.values = @[@1.0,@0.7,@0.5,@0.7,@1.0];
            animation.duration = 0.6;
        }break;
        case AxcAE_TabBarInteractionEffectStyleCustom:{ // 自定义动画
            if (weakSelf.itemModel.customInteractionEffectBlock) {
                weakSelf.itemModel.customInteractionEffectBlock(weakSelf);
            }
        }break;
        default: break;
    }
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        [view.layer addAnimation:animation forKey:nil];
    }];
}

#pragma mark - SET/GET
- (void)setItemModel:(AxcAE_TabBarConfigModel *)itemModel{
    _itemModel = itemModel;
    self.backgroundImageView = itemModel.backgroundImageView; // 先添加背景
    self.title = _itemModel.itemTitle;
    self.normalImage = [UIImage imageNamed:_itemModel.normalImageName];
    self.selectImage = [UIImage imageNamed:_itemModel.selectImageName];
    self.normalColor = _itemModel.normalColor;
    self.selectColor = _itemModel.selectColor;
    self.normalTintColor = _itemModel.normalTintColor;
    self.selectTintColor = _itemModel.selectTintColor;
    self.normalBackgroundColor = _itemModel.normalBackgroundColor;
    self.selectBackgroundColor = _itemModel.selectBackgroundColor;
    self.titleLabel = _itemModel.titleLabel;
    self.icomImgView = _itemModel.icomImgView;
    CGRect itemFrame = self.frame;
    itemFrame.size = _itemModel.itemSize;
    self.badgeLabel.automaticHidden = _itemModel.automaticHidden;
    self.frame = itemFrame;
    self.badge = _itemModel.badge;
}
- (void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (_isSelect) { // 是选中
        self.icomImgView.image = self.selectImage;
        self.titleLabel.textColor = self.selectColor;
        // 如果有设置tintColor，那么就选中图片后将图片渲染成TintColor
        if (self.selectTintColor) {
            self.icomImgView.image = [self.icomImgView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            [self.icomImgView setTintColor:self.selectTintColor];
        }
        [UIView animateWithDuration:0.3 animations:^{
            if (self.selectBackgroundColor) {
                self.backgroundColor = self.selectBackgroundColor;
            }else{
                self.backgroundColor = [UIColor clearColor];
            }
        }];
    }else{
        self.icomImgView.image = self.normalImage;
        self.titleLabel.textColor = self.normalColor;
        // 如果有设置tintColor，那么未选中将图片渲染成TintColor
        if (self.normalTintColor) {
            self.icomImgView.image = [self.icomImgView.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            [self.icomImgView setTintColor:self.normalTintColor];
        }
        [UIView animateWithDuration:0.3 animations:^{
            if (self.normalBackgroundColor) {
                self.backgroundColor = self.normalBackgroundColor;
            }else{
                self.backgroundColor = [UIColor clearColor];
            }
        }];
    }
    self.titleLabel.text = self.title;
}
- (void)setIcomImgView:(UIImageView *)icomImgView{
    _icomImgView = icomImgView;
    [self addSubview:_icomImgView];
    self.isSelect = self.isSelect;
}
- (void)setTitleLabel:(UILabel *)titleLabel{
    _titleLabel = titleLabel;
    [self addSubview:_titleLabel];
}
- (void)setBackgroundImageView:(UIImageView *)backgroundImageView{
    _backgroundImageView = backgroundImageView;
    [self addSubview:_backgroundImageView];
}
- (void)setBadge:(NSString *)badge{
    _badge = badge;
    if (_badge) {
        self.badgeLabel.badgeText = _badge;
        [self itemDidLayoutBadgeLabel]; // 布局Badge
    }
}

#pragma mark - 懒加载
- (AxcAE_TabBarBadge *)badgeLabel{
    if (!_badgeLabel) {
        _badgeLabel = [AxcAE_TabBarBadge new];
        [self addSubview:_badgeLabel];
    }
    return _badgeLabel;
}


@end




@implementation AxcAE_TabBarConfigModel

- (instancetype)init{
    self = [super init];
    if (self) { // 设置初始默认值
        // 默认标题正常颜色
        self.normalColor = [UIColor grayColor];
        // 默认选中标题颜色
        self.selectColor = AxcAE_TabBarItemSlectBlue;
        // 默认凸出 20
        self.bulgeHeight = 20.0;
        self.pictureWordsMargin = 5.0;
        self.componentMargin = UIEdgeInsetsMake(5, 5, 5, 5);
        self.isRepeatClick = NO;
    }
    return self;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UIImageView *)icomImgView{
    if (!_icomImgView) {
        _icomImgView = [UIImageView new];
        _icomImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _icomImgView;
}
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
    }
    return _backgroundImageView;
}

@end
