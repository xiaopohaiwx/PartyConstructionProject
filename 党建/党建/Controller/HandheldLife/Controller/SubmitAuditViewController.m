//
//  SubmitAuditViewController.m
//  党建
//
//  Created by 邱敏 on 2018/11/3.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "SubmitAuditViewController.h"

#import "SubmitAuditView.h"
#import "SubmitCollectionViewCell.h"
#import "CommonAlertView.h"

@interface SubmitAuditViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SubmitAuditView *subView;
@property (nonatomic, strong) NSMutableArray *imgArray;

@end

@implementation SubmitAuditViewController

#define IMAGEXY ([UIScreen mainScreen].bounds.size.width - 50) / 3

-(NSMutableArray *)imgArray
{
    if(!_imgArray)
    {
        _imgArray = [[NSMutableArray alloc] initWithCapacity:1];
        
        UIImage *img = [UIImage imageNamed:@"AddPhoto"];
        [_imgArray addObject:img];
        
        
    }
    return _imgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"思想汇报";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 74, SCREENWIDTH - 20, SCREENHEIGHT - 174) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    //隐藏背景色
    _collectionView.backgroundColor = [UIColor clearColor];
    //隐藏滚动条
    _collectionView.showsVerticalScrollIndicator = NO;

    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[SubmitCollectionViewCell class] forCellWithReuseIdentifier:@"itemCell"];
    [self.view addSubview:_collectionView];
    
    //添加底部按钮
    [self getSubView];
}

-(void)getSubView
{
    _subView = [[SubmitAuditView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 100, SCREENWIDTH, 98)];
    _subView.block = ^(UIButton * _Nonnull btn) {
        
    };
    [self.view addSubview:_subView];
}

#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(IMAGEXY, IMAGEXY);
}

//定义每个UICollectionViewCell 横向的间距(上下)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}


//定义每个UICollectionViewCell 纵向的间距(左右)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imgArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubmitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
//    cell.imgView.image = [UIImage imageNamed:self.imgArray[indexPath.item]];
    cell.imgView.image = self.imgArray[indexPath.item];
    return cell;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择了第%ld个item", indexPath.row);
    if (indexPath.row != self.imgArray.count - 1)
    {
        return;
    }
    //调用相机相册
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            imgPicker.delegate = self;
            imgPicker.allowsEditing = YES;
            imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imgPicker animated:YES completion:nil];
        }
        else
        {
            [CommonAlertView initMessage:@"无法打开相机" andVC:self];
        }
    }];
    //打开相册
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    //取消
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    NSLog(@"%@", info);
    UIImage *img = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //插入数组中
    [self.imgArray insertObject:img atIndex:_imgArray.count - 1];
    [self.collectionView reloadData];
    //保存图片到本地内存
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
