//
//  ViewController.m
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/15.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import "ViewController.h"
#import "LeftCategoryController.h"
#import "LeftCategoryModel.h"
#import "ContentController.h"
#import "RightContentModel.h"

#define MainScreenWidth [UIScreen mainScreen].bounds.size.width

#define MainScreenHight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.leftWidth = 100;
    
    LeftCategoryController *leftCategoryVC = [[LeftCategoryController alloc]initWithStyle:UITableViewStylePlain];
    leftCategoryVC.view.frame = CGRectMake(0, 0, self.leftWidth,MainScreenHight);

    
    leftCategoryVC.leftCategoryArray = [self getLeftListData];
    
    [self.view addSubview:leftCategoryVC.view];
    [self addChildViewController:leftCategoryVC];
       
    ContentController *contentVC = [[ContentController alloc]init];
    contentVC.view.frame = CGRectMake(self.leftWidth,64, MainScreenWidth-self.leftWidth,MainScreenHight);
    
    [self addChildViewController: contentVC];
    [self.view addSubview:contentVC.view];
}


- (NSMutableArray*)getLeftListData
{

    NSMutableArray *itemArry = [NSMutableArray array];
    NSArray *dataArry = @[@"母婴",@"云花卉",@"个人护理",@"时尚眼镜",@"运动馆",@"生鲜/美食",@"电器商城",@"专业药房",@"中药滋补",@"跨境购买"];
    for ( int i=0; i<dataArry.count; i++) {
        LeftCategoryModel *letfItem = [[LeftCategoryModel alloc]init];
        letfItem.name = dataArry[i];
        [itemArry addObject:letfItem];
        
    }
    return itemArry;
}

@end
