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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSMutableArray *)leftCategoryArray
{
    if ( !_leftCategoryArray ) {
        _leftCategoryArray = [[NSMutableArray alloc]init];
    }
    return _leftCategoryArray;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    LeftCategoryCell * cell=(LeftCategoryCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.titleLable.textColor=[UIColor blackColor];
    // 2.给cell传递模型数据
    LeftCategoryModel *leftItem = self.leftCategoryArray[indexPath.row];
    leftItem.isSelected = NO;
    cell.leftItem = leftItem;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
