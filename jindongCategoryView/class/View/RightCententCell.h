//
//  YXTCollectionCell.h
//  YXT1
//
//  Created by xxzx on 15/4/2.
//  Copyright (c) 2015年 mac-yanghua. All rights reserved.
//创建自定义UICollectionViewCell

#import <UIKit/UIKit.h>
@class RightContentModel;
@interface RightCententCell : UICollectionViewCell
//1、自定义所需要的控件，比如UIImageView
@property(nonatomic ,strong)UIImageView *imgView;
@property(nonatomic ,strong)UILabel *priceLabel;
@property(nonatomic ,strong)UILabel *nameLabel;


@property(nonatomic ,strong)RightContentModel *rightContentModel;

@end
