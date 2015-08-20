//
//  LeftCategoryController.m
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/15.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import "LeftCategoryController.h"
#import "LeftCategoryCell.h"
#import "LeftCategoryModel.h"



@interface LeftCategoryController ()

@end

@implementation LeftCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.rowHeight = 60;
   }


-(NSMutableArray *)leftCategoryArray
{
    if ( !_leftCategoryArray ) {
        _leftCategoryArray = [[NSMutableArray alloc]init];
    }
    return _leftCategoryArray;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.leftCategoryArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建cell
    LeftCategoryCell *cell = [LeftCategoryCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    LeftCategoryModel *leftItem = self.leftCategoryArray[indexPath.row];
    cell.leftItem =leftItem;
    
    // 3.返回cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    LeftCategoryCell * cell=(LeftCategoryCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.titleLable.textColor=[UIColor redColor];
   
    // 2.给cell传递模型数据
    LeftCategoryModel *leftItem = self.leftCategoryArray[indexPath.row];
    leftItem.isSelected = YES;
    cell.leftItem = leftItem;
    

 [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
   NSInteger categoryRow = indexPath.row;
    NSLog(@"categoryRow是%ld",(long)categoryRow);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"categorychange" object:self userInfo:@{@"categoryRow":@(categoryRow)}];
    
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LeftCategoryCell * cell=(LeftCategoryCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.titleLable.textColor=[UIColor blackColor];
    // 2.给cell传递模型数据
    LeftCategoryModel *leftItem = self.leftCategoryArray[indexPath.row];
    leftItem.isSelected = NO;
    cell.leftItem = leftItem;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 70;
//}

@end
