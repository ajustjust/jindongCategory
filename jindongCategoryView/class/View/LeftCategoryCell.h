//
//  LeftCategoryCell.h
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/15.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftCategoryModel;
@interface LeftCategoryCell : UITableViewCell

@property (nonatomic, strong) LeftCategoryModel *leftItem;
@property (nonatomic, strong)UIView *bgselectView;
@property (nonatomic, strong)UILabel *titleLable;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
//提供来重写样式的
- (void)setupSubviews;
@end
