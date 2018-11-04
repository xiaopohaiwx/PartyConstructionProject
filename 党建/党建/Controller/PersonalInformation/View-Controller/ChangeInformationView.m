//
//  ChangeInformationView.m
//  党建
//
//  Created by Mac on 2018/11/1.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "ChangeInformationView.h"

@implementation ChangeInformationView

- (instancetype)initWithFrame:(CGRect)frame ContentArr:(nonnull NSMutableArray *)contentArr
{
    if(self = [super initWithFrame:frame])
    {
        NSString *url = [contentArr[0] valueForKey:@"header"];
        [self.imgViewHead setImageWithURL:[NSURL URLWithString:url]];
        self.imgViewHead.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.imgViewHead addGestureRecognizer:tap];
        
        //创建存放textField的数组
        _fieldArr = [[NSMutableArray alloc] initWithCapacity:1];
        
        NSString *username = [GETVALUE(contentArr[0], @"username")];
        NSString *idCard = [GETVALUE(contentArr[0], @"idCard")];
        NSString *hometown =[GETVALUE(contentArr[0], @"hometown")];
        NSString *address = [GETVALUE(contentArr[0], @"address")];
        NSString *nation = [GETVALUE(contentArr[0], @"nation")];
        NSString *wxNum = [GETVALUE(contentArr[0], @"wxNum")];
        NSString *qqNum = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *sex = [GETVALUE(contentArr[0], @"sex")];
        NSString *education = [GETVALUE(contentArr[0], @"education")];
        NSString *jobRank = [GETVALUE(contentArr[0], @"qqNum")];
        NSString *salary = [NSString stringWithFormat:@"%@", [GETVALUE(contentArr[0], @"salary")]];
        NSString *joinPartyTime = [GETVALUE(contentArr[0], @"joinPartyTime")];
        NSString *lastPayTime = [GETVALUE(contentArr[0], @"lastPayTime")];
        NSString *partyIdentity = [GETVALUE(contentArr[0], @"partyIdentity")];
        if([partyIdentity isEqualToString:@"党员"])
        {
            _partyStatus = 2;
        }
        else if([partyIdentity isEqualToString:@"预备党员"])
        {
            _partyStatus = 1;
        }
        else
        {
            _partyStatus = 2;
        }
        _sex = [sex integerValue];
        
        NSArray *placeArr = @[username, idCard, hometown, address, nation, wxNum, qqNum, sex, education, jobRank, salary, joinPartyTime, lastPayTime, partyIdentity];
       
        for (NSInteger i = 0; i < 7; ++i)
        {
            _textField = [UITextField textFieldWithSuperView:self Content:placeArr[i] TextColor:TitleColor Tag:i TextAlignment:NSTextAlignmentRight];
            _textField.delegate = self;
            [_textField makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgViewHeadBG.bottom).offset(i * 51 + 18.5);
                make.right.equalTo(-10);
                make.size.equalTo(CGSizeMake(170, 15));
            }];
            if(i == 1)
            {
                _textField.userInteractionEnabled = NO;
            }
            [_fieldArr addObject:_textField];
        }
    
        _manBtn = [UIButton buttonWithSuperView:self Name:@"choose_btn" SelectName:@"choose1_btn" Target:self Action:@selector(chooseBtn:) Tag:1];
        [_manBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.top).offset(51);
            make.right.equalTo(-80);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
        
        UILabel *labelMan = [UILabel labelWithContent:@"男" SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentCenter NumberOfLines:1];
        [labelMan makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.manBtn.right).offset(5);
            make.top.equalTo(self.textField.top).offset(48);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        
        _womenBtn = [UIButton buttonWithSuperView:self Name:@"choose_btn" SelectName:@"choose1_btn" Target:self Action:@selector(chooseBtn:) Tag:0];
        [_womenBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.top).offset(51);
            make.right.equalTo(-35);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
        
        UILabel *labelWomen = [UILabel labelWithContent:@"女" SuperView:self TextColor:TitleColor Font:[UIFont systemFontOfSize:15] TextAlignment:NSTextAlignmentCenter NumberOfLines:1];
        [labelWomen makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.womenBtn.right).offset(5);
            make.top.equalTo(self.textField.top).offset(48);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        
        if(_sex == 0)
        {
            _womenBtn.selected = YES;
            _manBtn.selected = NO;
            _selectBtn = _womenBtn;
        }
        else
        {
            _womenBtn.selected = NO;
            _manBtn.selected = YES;
            _selectBtn = _manBtn;
        }
        
        for (NSInteger i = 8; i < 11; ++i)
        {
            _textField = [UITextField textFieldWithSuperView:self Content:placeArr[i] TextColor:TitleColor Tag:i TextAlignment:NSTextAlignmentRight];
            _textField.delegate = self;
            [_textField makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgViewHeadBG.bottom).offset(i * 51 + 18.5);
                make.right.equalTo(-10);
                make.size.equalTo(CGSizeMake(170, 15));
            }];
            [_fieldArr addObject:_textField];
        }
        
        _labelArr = [[NSMutableArray alloc] initWithCapacity:1];
        _labelTagArr = [[NSMutableArray alloc] initWithCapacity:1];
        
        for (NSInteger i = 11; i < 14; ++i)
        {
            _label = [UILabel labelWithSuperView:self Text:placeArr[i] TextColor:TitleColor Font:15 TextAlignment:NSTextAlignmentRight UserInteractionEnabled:YES Tag:i];
            [_label makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imgViewHeadBG.bottom).offset(i * 51 + 18.5);
                make.right.equalTo(-10);
                make.size.equalTo(CGSizeMake(170, 15));
            }];
            //将label加入数组
            [_labelArr addObject:_label];
            //给label加上相应的手势
            switch (i) {
                case 11:
                {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1:)];
                    [_label addGestureRecognizer:tap];
                }
                    break;
                case 12:
                {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2:)];
                    [_label addGestureRecognizer:tap];
                }
                    break;
                case 13:
                {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap3:)];
                    [_label addGestureRecognizer:tap];
                }
                    break;
                    
                default:
                    break;
            }
        }
        
        //选项卡
        _optionsView = [[UIView alloc] init];
        [self addSubview:_optionsView];
        [_optionsView makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(110, 70));
        }];
        _optionsView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.8];
        
        NSArray *optionsArr = @[@"积极分子", @"预备党员", @"党员"];
        for (NSInteger i = 0; i < 3; ++i)
        {
            UIButton *button = [UIButton buttonWithText:optionsArr[i] TextColor:TitleColor TextSize:13 SuperView:_optionsView Tag:i Target:self Action:@selector(choose:)];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.optionsView);
                make.top.equalTo(self.optionsView.top).offset(5 + i * 20);
                make.height.height.equalTo(20);
            }];
        }
        _optionsView.hidden = YES;
    }
    return self;
}
//性别点击事件
- (void)chooseBtn:(UIButton *)btn
{
    NSLog(@"++++++++");
    if(btn != _selectBtn)
    {
        _selectBtn.selected = NO;
        btn.selected = YES;
        _selectBtn = btn;
        _sex = btn.tag;
    }
    else
    {
        _selectBtn.selected = NO;
        _sex = btn.tag;
    }
    NSLog(@"%ld", _sex);
}

//头像及后三个选项点击事件
- (void)tap:(UITapGestureRecognizer *)tap
{
    NSLog(@"------0-----");
    if(_delegate)
    {
        [_delegate getAlert:[self setAlert]];
    }
}

//入党时间手势
- (void)tap1:(UITapGestureRecognizer *)tap
{
    NSLog(@"------1-----");
    if(_delegate)
    {
        [_delegate getDatePicker:[self setDataPicker]];
    }
    [_labelTagArr removeAllObjects];
    [_labelTagArr addObject:@"11"];
}
//党费最后缴纳时间手势
- (void)tap2:(UITapGestureRecognizer *)tap
{
    NSLog(@"-----2------");
    if(_delegate)
    {
        [_delegate getDatePicker:[self setDataPicker]];
    }
    [_labelTagArr removeAllObjects];
    [_labelTagArr addObject:@"12"];
    
}
//当前身份手势
- (void)tap3:(UITapGestureRecognizer *)tap
{
    NSLog(@"-----3------");
    _optionsView.hidden = NO;
    [_labelTagArr removeAllObjects];
    [_labelTagArr addObject:@"13"];
}

//创建dataPicker
- (UIDatePicker *)setDataPicker
{
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT -310, SCREENWIDTH, 200)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.date = [NSDate date];
    _datePicker.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    /* 用runtime修改UIDatePicker的字体颜色 */
    unsigned int outCount;
    objc_property_t *pProperty = class_copyPropertyList([UIDatePicker class], &outCount);
    for (NSInteger i = outCount -1; i >= 0; i--)
    {
        // 循环获取属性的名字   property_getName函数返回一个属性的名称
        NSString *getPropertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
        if([getPropertyName isEqualToString:@"textColor"])
        {
            [_datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
        }
    }
    
    _datePicker.minimumDate = [self dateFromStr:@"1997-01-01"];
    _datePicker.maximumDate = [NSDate date];
    
    [_datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    return _datePicker;
}

//日期转字符串
- (NSString *)strFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
}
//字符串转日期
- (NSDate *)dateFromStr:(NSString *)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:str];
}
//日期改变时的事件
- (void)valueChange:(UIDatePicker *)sender
{
    NSLog(@"%@", [self strFromDate:sender.date]);
    //遍历labelArr数组，改变相应label的值
    for (id label in _labelArr)
    {
        for(id tag in _labelTagArr)
        {
            NSString *labelTag = [NSString stringWithFormat:@"%@", [label valueForKey:@"tag"]];
            if([labelTag isEqualToString:tag])
            {
                [label setValue:[self strFromDate:sender.date] forKey:@"text"];
            }
        }
    }
}

//选项卡点击事件
- (void)choose:(UIButton *)btn
{
    NSLog(@"0000000");
    //遍历labelArr数组，改变相应label的值
    for (id label in _labelArr)
    {
        for(id tag in _labelTagArr)
        {
            NSString *labelTag = [NSString stringWithFormat:@"%@", [label valueForKey:@"tag"]];
            if([labelTag isEqualToString:tag])
            {
                [label setValue:btn.titleLabel.text forKey:@"text"];
            }
        }
    }
    _partyStatus = btn.tag;
    _optionsView.hidden = YES;
}

//相机相册选择提示框
- (UIAlertController *)setAlert
{
    __weak typeof(self) weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            imgPicker.delegate = self;
            //设置当拍照完或在相册选完照片后，是否跳到编辑模式进行图片剪裁。只有当showsCameraControls属性为true时才有效果
            imgPicker.allowsEditing = YES;
            //指定使用照相机模式,可以指定使用相册／照片库   
            imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            if(weakSelf.delegate)
            {
                [weakSelf.delegate getImagePicker:imgPicker];
            }
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"相机不可用" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            if (weakSelf.delegate)
            {
                [weakSelf.delegate getAlert:alert];
            }
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        imgPicker.delegate = self;
        imgPicker.allowsEditing = YES;
        if(weakSelf.delegate)
        {
            [weakSelf.delegate getImagePicker:imgPicker];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    return alert;
}

#pragma mark -- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    self.imgViewHead.image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //保存图片
    UIImageWriteToSavedPhotosAlbum(self.imgViewHead.image, nil, nil, nil);
    if(_delegate)
    {
        [_delegate dismiss:self];
    }
}
@end
