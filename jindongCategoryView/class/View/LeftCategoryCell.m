//
//  LeftCategoryCell.m
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/15.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import "LeftCategoryCell.h"
#import "LeftCategoryModel.h"
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
        _titleLable = [[UILabel alloc]init];
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
    
    self.backgroundColor = [UIColor brownColor];
    self.bgselectView.backgroundColor =[UIColor whiteColor];
    self.selectedBackgroundView = self.bgselectView;
    self.titleLable.textAlignment = NSTextAlignmentCenter;
  
        self.titleLable.textColor = self.leftItem.titleColor;
 
    }
      

-(UIView *)bgselectView
{

    if(!_bgselectView){

        _bgselectView = [[UIView alloc]init];

    }
    return _bgselectView;
}

//重写set方法，在这直接吧数据和对应
-(void)setLeftItem:(LeftCategoryModel *)leftItem
{
    _leftItem = leftItem;
    self.titleLable.text = _leftItem.name;

    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end