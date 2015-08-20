//
//  YXTCollectionCell.m
//  YXT1
//
//  Created by xxzx on 15/4/2.
//  Copyright (c) 2015年 mac-yanghua. All rights reserved.
//

#import "RightCententCell.h"
#import "RightContentModel.h"
#import "UIImageView+WebCache.h"

 #define categoryimage   @"http://m.hxyxt.com/image/Category1/"
@implementation RightCententCell




 //1、初始化控件，在方法- (id)initWithFrame:(CGRect)frame中实现
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        self.backgroundColor = [UIColor whiteColor];
        
        /**
         图片
         */
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame))];
       // self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
//        /**
//         价格priceLabel
//         */
//        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame)-30, CGRectGetWidth(self.frame)-10, 30)];
//        self.priceLabel.backgroundColor = [UIColor clearColor];
//        self.priceLabel.textAlignment = NSTextAlignmentRight;
//        [self addSubview:self.priceLabel];
       
        /**
         名字nameLabel
         */

        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame),40)];
        self.nameLabel.backgroundColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
       self.nameLabel.textColor=[UIColor brownColor];
     [self addSubview:self.nameLabel];
    }
    return self;
}

-(void)setRightContentModel:(RightContentModel *)rightContentModel
{
   
    _rightContentModel = rightContentModel;
    self.nameLabel.text =rightContentModel.name;
    NSString *imagefeeder = rightContentModel.imageStr;
    NSString *imageStr =[NSString stringWithFormat:@"%@%@",categoryimage,imagefeeder];
    NSLog(@"imageStr是--%@",imageStr);
    
    [ self.imgView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
   // NSLog(@"imageStr是--%@",imageStr);
}

@end
