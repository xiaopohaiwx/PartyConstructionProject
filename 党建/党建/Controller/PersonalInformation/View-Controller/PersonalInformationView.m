//
//  PersonalInformationView.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "PersonalInformationView.h"

@implementation PersonalInformationView

- (instancetype)initWithFrame:(CGRect)frame ContentArr:(NSArray *)contentArr
{
    if(self = [super initWithFrame:frame])
    {
        NSString *header = [contentArr[0] valueForKey:@"header"];
        [self.imgViewHead setImageWithURL:[NSURL URLWithString:header]];

        NSString *username = [GETVALUE(contentArr[0], @"username")];
        NSString *idCard = [GETVALUE(contentArr[0], @"idCard")];
        NSString *hometown =[GETVALUE(contentArr[0], @"hometown")];
        NSString *address = [GETVALUE(contentArr[0], @"address")];
        NSString *nation = [GETVALUE(contentArr[0], @"nation")];
        NSString *wxNum = [GETVALUE(contentArr[0], @"wxNum")];
        NSString *qqNum = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *sex = nil;
        if([GETVALUE(contentArr[0], @"sex")] == 0)
        {
            sex = @"女";
        }
        else
        {
            sex = @"男";
        }
        NSString *education = [GETVALUE(contentArr[0], @"education")];
        NSString *jobRank = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *salary = [NSString stringWithFormat:@"%@", [GETVALUE(contentArr[0], @"salary")]];
        NSString *joinPartyTime = [GETVALUE(contentArr[0], @"joinPartyTime")];
        NSString *lastPayTime = [GETVALUE(contentArr[0], @"lastPayTime")];
        NSString *partyIdentity = [GETVALUE(contentArr[0], @"partyIdentity")];
        
        NSArray *arr1 = @[username, idCard, hometown, address, nation, wxNum, qqNum, sex, education, jobRank, salary, joinPartyTime, lastPayTime, partyIdentity];
        for (NSInteger i = 0; i < 14; ++i)
        {
            UILabel *labelContent = [UILabel labelWithContent:arr1[i] SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentRight NumberOfLines:1];
            [labelContent makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgViewHeadBG.bottom).offset(i * 51 + 18.5);
                make.right.equalTo(self.imgViewBG.right).offset(-10);
                make.size.equalTo(CGSizeMake(160, 15));
            }];
        }
    }
    return self;
}

@end
