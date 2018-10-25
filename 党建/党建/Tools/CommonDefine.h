//
//  CommonDefine.h
//  党建
//
//  Created by Mac on 2018/10/24.
//  Copyright © 2018年 wx. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define SETUSERDEFAULT(object, key) [NSUserDefaults standardUserDefaults] setObject:object forKey:key
#define USERDEFAULT(key) [NSUserDefaults standardUserDefaults] valueForKey:key

#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define NavigationColor ssRGBHex(0xCC000D)
#define BGCOLOR ssRGBHex(0xFFFFFF)

//状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度 + 状态栏高度
#define NavigationBarHeight self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height
//tabbar高度
#define TabBarHeight self.tabBarController.tabBar.bounds.size.height

#endif /* CommonDefine_h */
