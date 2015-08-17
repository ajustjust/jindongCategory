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
    
    NSMutableArray *itemArry = [NSMutableArray array];
  NSArray *dataArry = @[@"情趣",@"电器",@"衣服",@"吃的",@"左爱",@"情趣",@"电器",@"衣服",@"吃的",@"左爱",@"情趣",@"电器",@"衣服",@"吃的",@"左爱",@"衣服",@"吃的",@"左爱",@"情趣",@"电器",@"衣服",@"吃的"];
     for ( int i=0; i<dataArry.count; i++) {
    LeftCategoryModel *letfItem = [[LeftCategoryModel alloc]init];
         letfItem.name = dataArry[i];
         [itemArry addObject:letfItem];
         
     }
    
    leftCategoryVC.leftCategoryArray = itemArry;
    
    [self.view addSubview:leftCategoryVC.view];
    [self addChildViewController:leftCategoryVC];
       
    ContentController *contentVC = [[ContentController alloc]init];
    contentVC.view.frame = CGRectMake(self.leftWidth,64, MainScreenWidth-self.leftWidth,MainScreenHight);
    
    [self addChildViewController: contentVC];
    [self.view addSubview:contentVC.view];
}



@end
