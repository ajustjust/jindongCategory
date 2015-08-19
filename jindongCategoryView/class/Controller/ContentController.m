//
//  ContentController.m
//  jindongCategoryView
//
//  Created by MAC-yanghua on 15/8/17.
//  Copyright (c) 2015年 MAC-yanghua. All rights reserved.
//

#import "ContentController.h"
#import "RightCententCell.h"
#import "RightContentModel.h"

#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define MainScreenHight [UIScreen mainScreen].bounds.size.height

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height-StatusBarHeight)

@interface ContentController ()
/** 最后展示在页面的数据 */
@property (strong, nonatomic) NSMutableArray *listArray;


@end

@implementation ContentController

static NSString * const reuseIdentifier = @"Cell";



/**
 *  初始化
 */
- (id)init
{
    // UICollectionViewFlowLayout的初始化
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(80, 80);
//    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    layout.minimumInteritemSpacing = 20;
//    layout.minimumLineSpacing = 20;
    
    
    
    
    /**
     2、在Controller.m创建UICollectionView。需要使用UICollectionViewFlowLayout来创建，使用方法- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;如果只用普通的init方法，是实现不了的。
     */
    
    float height = 0;//顶部高度
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(fDeviceWidth, height+10);//头部
//    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height) collectionViewLayout:flowLayout];
    //self.collectionView.backgroundColor=blackgroundColor;
    
//    // 3、代理授权并添加至视图。
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
  //  [self addSubview:self.collectionView];
    
    
    
    
    //注册cell和ReusableView（相当于头部）1、注册CollectionViewCell，添加cell需要在这里实现。方法：- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
//    [self.collectionView registerClass:[YXTCollectionCell class] forCellWithReuseIdentifier:@"cell"];
//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    
    
    
    
    return [self initWithCollectionViewLayout:flowLayout];
}


#pragma mark - 数据相关

- (NSMutableArray *)goodsListArray
{
    if (!_listArray) {
        self.listArray = [NSMutableArray array];
    }
    return _listArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
        /**
     右边的视图
     */
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
  
    // Do any additional setup after loading the view.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 6;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

   // static NSString *identify = @"cell";
//    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];

    static NSString *identify = @"cell";
    RightCententCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    RightContentModel*rightContentModel = self.listArray[indexPath.row];
    //设置数据源
    cell.rightContentModel =rightContentModel;
    
    return cell;
}

//设置元素的的大小框

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    UIEdgeInsets top = {5,2.5,5,5};
    
    return top;
    
}
//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size={0,70};
    
    return size;
    
}

//设置元素大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    //NSLog(@"%f",(kDeviceHeight-88-49)/4.0);
    
    return CGSizeMake((MainScreenWidth-100-50)/3,(MainScreenWidth-100-20)/3+20);
    
}


//点击元素触发事件

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",indexPath);
    
//    DetailVideoViewController *detailVC = [[DetailVideoViewControlleralloc]init];
//    
//    [self.navigationController pushViewController:detailVCanimated:YES];
//
    
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    UICollectionReusableView *reusableview = nil;
//    
//    if (kind == UICollectionElementKindSectionHeader){
//        
//        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerview" forIndexPath:indexPath];
//        
//        
//        headerView.backgroundColor= [UIColor blueColor];
//        
//       // UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
//        
//      //  headerView.b = headerImage;
//        
//        reusableview = headerView;
//        
//    }

//    if (kind == UICollectionElementKindSectionFooter){
//        
//        UICollectionReusableView *footerview = [collectionView dequeueResuableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
//        
//        reusableview = footerview;
//        
//    }
    
//    return reusableview;
//    
//    
//    
//}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}




//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark <UICollectionViewDelegate>
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
