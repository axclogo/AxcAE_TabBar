//
//  AxcAE_TabBarDefine.h
//  Axc_AEUI
//
//  Created by Axc on 2018/6/2.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#ifndef AxcAE_TabBarDefine_h
#define AxcAE_TabBarDefine_h

// weak
#define WeakSelf __weak typeof(self)weakSelf = self

#define AxcAE_TabBarRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define AxcAE_TabBarRGB(r,g,b) AxcAE_TabBarRGBA(r,g,b,1.0f)

#define AxcAE_TabBarItemSlectBlue AxcAE_TabBarRGB(59,185,222)
#define AxcAE_TabBarItemBadgeRed  AxcAE_TabBarRGB(255,38,0)

#define AxcAE_IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#endif /* AxcAE_TabBarDefine_h */
