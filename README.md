# AxcAE_TabBar
![language](https://img.shields.io/badge/Language-Objective--C-8E44AD.svg)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
![Platform](https://img.shields.io/badge/platform-%20iOS%20-lightgrey.svg)
![CocoaPods](https://img.shields.io/badge/CocoaPods-1.5.2-brightgreen.svg)
![Axc](https://img.shields.io/badge/Axc-AEKit-orange.svg)

![AxcAE_TabBar](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/AxcAE_TabBarTitle.png)<br>

### 简介：
AxcAE_TabBar，以开放为封装核心的TabBar组件，尽量将属性、API等参数全部开放给使用者去自定义，能够方便快速使用的一个TabBar选项卡组件<br>

### 框架支持
最低支持：iOS 8.0 

IDE：Xcode 9.0 及以上版本 (由于适配iPhone X使用iOS11api，所以请使用Xcode 9.0及以上版本)

### <a id="使用方法"></a>使用/安装

* 第一种：手动  
  * 1.找到包含：</br>
   `AxcAE_TabBar.h.m`、</br>
   `AxcAE_TabBarBadge.h.m`、</br>
   `AxcAE_TabBarItem.h.m`、</br>
   `AxcAE_TabBarDefine.h`</br>
  的`AxcAE_TabBar`文件夹;</br>
  * 2.直接把`AxcAE_TabBar`文件夹拖入到您的工程中;
  * 3.导入 `"AxcAE_TabBar.h"`
* 第二种：Cocoapods
  * 1.在Podfile 中添加 `pod 'AxcAE_TabBar'`
  * 2.执行 `pod setup`
  * 3.执行 `pod install` 或 `pod update`
  * 4.导入 `#import <AxcAE_TabBar/AxcAE_TabBar.h>`

### <a id="功能介绍"></a>功能介绍
- [x] 支持横竖屏 (已适配iPhone X)
- [x] 支持自定义Item背景图 
- [x] 支持自定义Item图标的自定义渲染颜色（tingColor，某种情况再不需要两套TabBar图标啦）
- [x] 支持自定义Item的触发动画（预设有弹簧、放大缩小、渐变）
- [x] 支持自定义Item的内部布局
- [x] 支持自定义Item的内部组件（组件全开放指针，可以直接外部操作属性，如创建之初就能定义个别Item的字体等）
- [x] 支持自定义Item的内部组件大小
- [x] 支持自定义Item的内部组件的相关属性（点语法可能会有点长，比如item.iconImageView.ContentMode = ...）
- [x] 支持自定义TabBar的背景图
- [x] 支持自定义TabBar的背景图的模糊毛玻璃遮罩
- [x] 支持自定义TabBar上Item相对在各自单元格内的排布方式以及对齐方式
- [x] 支持自定义TabBar上Item小气泡(徽标)的左中右排布
- [x] 支持自定义TabBar的凸起按钮
- [x] 支持自定义TabBar的凸起按钮触发事件，包括能切换视图
- [x] 支持自定义TabBar的凸起按钮的位置，只要你想，凸起按钮也可以不一定在中间
- [x] 支持自定义TabBar的多重凸起按钮，如果遇到奇葩多个凸起按钮的需求，别慌
- [x] 支持自定义TabBar的多重复合凸起按钮，有圆有方怎么办，循环遍历特殊对待（还能再奇葩么）
- [x] 支持自定义TabBar的Item自定义大小等
- [x] 支持TabBar中控制器可获取对应Item的方式
- [x] 支持TabBar与系统TabBar隐藏的同步
- [x] 支持TabBar在Push的时候与系统同步Hidden的效果（因为父视图就是系统的TabBar）
<!-- - [x] 3D Touch快捷菜单 -->
- [x] 支持并不依赖其他三方库，适配由自行计算Frame



### 意见

> 如果您在使用中有好的需求及建议，或者遇到什么bug，欢迎随时issue，我会及时的回复
 
# 预览
![主示例图](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/Main%20screen%20shot.png)
## 示例内容部分
![所有示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_0.gif)
## 模仿部分主流app的TabBar设置
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_1.gif)
## 带背景图+选中后背景颜色
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_2.gif)
## 背景图片+模糊毛玻璃
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_3.gif)
## 中间圆形凸起
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_4.gif)
## 多重圆形凸起
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_5.gif)
## 中间矩形凸起
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_6.gif)
## 多重混合凸起
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_7.gif)
## 按钮自定义大小
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_8.gif)
## 按钮相对在TabBar单元格中的上、左、右、下、左上、右上、左下、右下布局
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_9.gif)
## 按钮内部 文上图下、图左文右、文左图右、全图、全文模式
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_10.gif)
## 徽标居上左中右排布模式
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_11.gif)
## 按钮独立点击动画特效设置
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_12.gif)
## 按钮独立选中颜色设置
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_13.gif)
## 按钮独立选中背景颜色设置
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_14.gif)
## 按钮独立背景图片设置
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_15.gif)
## 与渐变色三方库混合使用，背景动态渐变
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_16.gif)
## 背景从上到下黑到灰渐变
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_17.gif)
## 背景从上到下渐变2
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_18.gif)
## 背景从左到右红到橘渐变 + 按钮独立选中背景色
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_19.gif)
## 背景从左下到右上渐变
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_20.gif)
## 背景渐变+按钮独立渐变
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_21.gif)
## 仿微博Tabbar
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_22.gif)
## 仿咸鱼TabBar
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_23.gif)
## 仿简书TabBar
![示例](https://github.com/axclogo/AxcAE_TabBar/blob/master/Images/sample_24.gif)
## 按钮其他常用测试

### 更新日志
● 1.0.0: 重新适配iPhoneX，以及部分坐标计算出现的错误; </br>
● 1.0.3: 修复重设VC的Title时，文字出现重影，原因是系统的item遮挡造成; </br>

