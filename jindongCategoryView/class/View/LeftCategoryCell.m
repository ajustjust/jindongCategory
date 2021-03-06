//
//  LeftCategoryCell.m
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/15.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import "LeftCategoryCell.h"
#import "LeftCategoryModel.h"

#define RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation LeftCategoryCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"leftCellView";
    
    LeftCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LeftCategoryCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
       
    }
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化操作
    
        // 2.初始化子控件
        [self setupSubviews];
        
    }return self;
}

-(UILabel *)titleLable{
    if(!_titleLable){
       self.titleLable = [[UILabel alloc]init];
        [self.contentView addSubview:_titleLable];
    }
    return _titleLable;


}
//这个里面写布局尺寸
-(void)layoutSubviews{
    self.titleLable.frame = self.bounds;
     self.bgselectView .frame=self.bounds;
}
//cell样式
- (void)setupSubviews{
    
    self.backgroundColor = RGB(242, 242, 242);
    self.bgselectView.backgroundColor = RGB(87, 155, 193);
    self.selectedBackgroundView = self.bgselectView;
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    
    }
      

-(UIView *)bgselectView
{

    if(!_bgselectView){

       self.bgselectView = [[UIView alloc]init];

    }
    return _bgselectView;
}

//重写set方法，在这直接吧数据和对应
-(void)setLeftItem:(LeftCategoryModel *)leftItem
{
    _leftItem = leftItem;
    self.titleLable.text = leftItem.name;

    if (leftItem.isSelected==NO) {
        self.titleLable.textColor = [UIColor blackColor];
    }else{
        self.titleLable.textColor = [UIColor whiteColor];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
