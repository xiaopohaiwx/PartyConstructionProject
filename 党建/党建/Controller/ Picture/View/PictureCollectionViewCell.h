//
//  PictureCollectionViewCell.h
//  党建
//
//  Created by apple on 2018/10/25.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//图片宽，（屏幕-缝隙）/2
#define IMGWHIDTH (SCREENWIDTH-60)/2

@interface PictureCollectionViewCell : UICollectionViewCell

@property(nonatomic , strong) UIImageView * imgView;
@property(nonatomic , strong) UILabel * titleLab;

@end

NS_ASSUME_NONNULL_END
