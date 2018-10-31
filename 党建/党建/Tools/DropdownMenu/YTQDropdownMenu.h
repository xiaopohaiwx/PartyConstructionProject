//
//  YTQDropdownMenu.h
//
//  Version:1.0.0
//
//  Created by MajorLi on 15/5/4.
//  Copyright (c) 2015年 yy. All rights reserved.
//
//
//

#import <UIKit/UIKit.h>

@class YTQDropdownMenu;

@protocol YTQDropdownMenuDelegate <NSObject>

@optional

- (void)dropdownMenuWillShow:(YTQDropdownMenu *)menu;    // 当下拉菜单将要显示时调用
- (void)dropdownMenuDidShow:(YTQDropdownMenu *)menu;     // 当下拉菜单已经显示时调用
- (void)dropdownMenuWillHidden:(YTQDropdownMenu *)menu;  // 当下拉菜单将要收起时调用
- (void)dropdownMenuDidHidden:(YTQDropdownMenu *)menu;   // 当下拉菜单已经收起时调用

- (void)dropdownMenu:(YTQDropdownMenu *)menu selectedCellNumber:(NSInteger)number; // 当选择某个选项时调用

@end




@interface YTQDropdownMenu : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton * mainBtn;  // 主按钮 可以自定义样式 可在.m文件中修改默认的一些属性

@property (nonatomic, assign) id <YTQDropdownMenuDelegate>delegate;


- (void)setMenuTitles:(NSArray *)titlesArr rowHeight:(CGFloat)rowHeight;  // 设置下拉菜单控件样式

- (void)showDropDown; // 显示下拉菜单
- (void)hideDropDown; // 隐藏下拉菜单

@end
