//
//  WHGradientHelper.h
//  Example
//
//  Created by whbalzac on 3/20/17.
//  Copyright © 2017 whbalzac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultWidth 200
#define kDefaultHeight 200

typedef NS_ENUM(NSInteger, WHGradientDirection) {
    WHLinearGradientDirectionLevel,                 //AC - BD
    WHLinearGradientDirectionVertical,              //AB - CD
    WHLinearGradientDirectionUpwardDiagonalLine,    //A - D
    WHLinearGradientDirectionDownDiagonalLine,      //C - B
};
//      A         B
//       _________
//      |         |
//      |         |
//       ---------
//      C         D

@interface WHGradientHelper : NSObject

//   Linear Gradient
+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType;/* CGSizeMake(kDefaultWidth, kDefaultHeight) */
+ (UIImage *)getLinearGradientImage:(UIColor *)startColor and:(UIColor *)endColor directionType:(WHGradientDirection)directionType option:(CGSize)size;

//    Radial Gradient
+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor;/* raduis = kDefaultWidth / 2 */
+ (UIImage *)getRadialGradientImage:(UIColor *)centerColor and:(UIColor *)outColor option:(CGSize)size;

//   ChromatoAnimation
+ (void)addGradientChromatoAnimation:(UIView *)view;

//   LableText LinearGradient and ChromatoAnimation
+ (void)addLinearGradientForLableText:(UIView *)parentView lable:(UILabel *)lable start:(UIColor *)startColor and:(UIColor *)endColor;  /* don't need call 'addSubview:' for lable */
+ (void)addGradientChromatoAnimationForLableText:(UIView *)parentView lable:(UILabel *)lable; /* don't need call 'addSubview:' for lable */

@end
