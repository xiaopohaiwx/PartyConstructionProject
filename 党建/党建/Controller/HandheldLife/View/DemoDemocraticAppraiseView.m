//
//  DemoDemocraticAppraiseView.m
//  党建
//
//  Created by 邱敏 on 2018/10/29.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "DemoDemocraticAppraiseView.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"

@implementation DemoDemocraticAppraiseView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _titleLable = [UILabel labelWithContent:@"评议须知" SuperView:self TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:18.0] TextAlignment:NSTextAlignmentCenter AdjustsFontSizeToFitWidth:YES];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(22);
            make.centerX.equalTo(self.centerX);
            make.width.equalTo(100);
            make.height.equalTo(18);
        }];
        
        NSString *str = @"在党支部专题组织生活会上，每一位党员要对照评议内容进行个人总结，查摆存在的问题，进行批评与自我批评，明确下一步的努力方向。在此基础上，党支部组织全体党员对每一位党员进行民主评议。评议主要内容如下：";
        
        _noticeLable = [UILabel labelWithAttributedTextContent:str SuperView:self TextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:15.0] LineSpacing:5 Broadsize:32 mask_makeConstraints:^(MASConstraintMaker * _Nonnull make) {
            make.top.equalTo(self.titleLable.bottom).offset(24);
            make.left.equalTo(10);
            make.right.equalTo(-10);
        }];
        
        NSArray *arr = @[@"1、坚定理想信念、贯彻执行党的路线方针政策情况；",
                         @"2、参加“两学一做学习教育情况；",
                         @"3、参加党的组织生活、按要求交纳党费；",
                         @"4、学习情况、业务能力提高情况；",
                         @"5、关心集体、团结同志，发挥先锋模范作用情况；",
                         @"6、联系群众、关心群众、服务群众情况；",
                         @"7、遵守党章党规、法律法规和学校规章制度情况。"];
        
        for (int i = 0; i < 6; i ++)
        {
            _contentLable = [UILabel labelWithContent:arr[i] SuperView:self TextColor:[UIColor grayColor] Font:[UIFont systemFontOfSize:15.0] TextAlignment:NSTextAlignmentLeft AdjustsFontSizeToFitWidth:YES];
            [_contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.noticeLable.bottom).offset(15 + 30 * i);
                make.left.equalTo(10);
                make.width.equalTo(SCREENWIDTH - 10);
            }];
        }
        
        NSArray *dropArr = @[@"请选择",
                             @"信息工程学院教工第一党支部",
                             @"信息工程学院教工第二党支部",
                             @"信息工程学院学生党支部",
                             @"信息工程学院学生流动党支部"];
        //下拉菜单
        _dropBtn = [[YTQDropdownMenu alloc] init];
        [_dropBtn setFrame:CGRectMake(30, 460, SCREENWIDTH / 2 + 5, 40)];
        [_dropBtn setMenuTitles:dropArr rowHeight:20];
        _dropBtn.delegate = self;
        [self addSubview:_dropBtn];
        
        //下一步按钮
        _nextBtn = [UIButton buttonWithText:@"下一步" TextColor:[UIColor whiteColor]  TextSize:15.0 SuperView:self Tag:0 Target:self Action:@selector(clickNext:)];
        _nextBtn.backgroundColor = ssRGBHex(0xC51506);
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.layer.cornerRadius = 5;
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(460);
            make.right.equalTo(-30);
            make.width.equalTo(SCREENWIDTH / 4 + 5);
            make.height.equalTo(40);
        }];
    }
    return self;
}

-(void)clickNext:(UIButton *)btn
{
    if (_nextBtn.tag != 0)
    {
        switch (_nextBtn.tag)
        {
            case 1:
            {
                NSLog(@"%ld", _nextBtn.tag);
                if (_nextBlock) {
                    _nextBlock(_nextBtn);
                }
            }
                break;
            case 2:
            {
                NSLog(@"%ld", _nextBtn.tag);
                if (_nextBlock) {
                    _nextBlock(_nextBtn);
                }
            }
                break;
            case 3:
            {
                NSLog(@"%ld", _nextBtn.tag);
                if (_nextBlock) {
                    _nextBlock(_nextBtn);
                }
            }
                break;
            case 4:
            {
                NSLog(@"%ld", _nextBtn.tag);
                if (_nextBlock) {
                    _nextBlock(_nextBtn);
                }
            }
                break;
        }
    }
}

#pragma mark - YTQDropdownMenu Delegate

- (void)dropdownMenu:(YTQDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    NSLog(@"你选择了：%ld",number);
    _nextBtn.tag = number;
}

@end
