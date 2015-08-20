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
#import "UIImageView+WebCache.h"

#define categoryimage   @"http://m.hxyxt.com/image/Category1/"

#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define MainScreenHight [UIScreen mainScreen].bounds.size.height

#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height-StatusBarHeight)

@interface ContentController ()
/** 最后展示在页面的数据 */
@property (strong, nonatomic) NSMutableArray *listArray;

@property (copy, nonatomic)NSMutableString* headerImageStr;
@end

@implementation ContentController

static NSString * const reuseIdentifier = @"Cell";



/**
 *  初始化
 */
- (id)init
{
    
    // UICollectionViewFlowLayout的初始化
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tode:) name:@"categorychange" object:nil];
    /**
    在Controller.m创建UICollectionView。需要使用UICollectionViewFlowLayout来创建，使用方法- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;如果只用普通的init方法，是实现不了的。
     */
    
    return [self initWithCollectionViewLayout:layout];
}


#pragma mark - 数据相关

- (NSMutableArray *)listArray
{
    /*
{
categoryimg
chinesemedicine
cloudflower
cross-bordershopping
electronicsmall
fashionglasses
infantmom
personalcare
professionalpharmacy
rawfood
sportspavilion
 http://m.hxyxt.com/image/Category1/infantmom/04.png
//http://m.hxyxt.com/image/Category1/personalcare/04.png
     头部图片
 http://m.hxyxt.com/image/Category1/categoryimg/01.jpg
  }
  */
    if (!_listArray) {
   
 self.listArray = [self getRightAllIamgeListDatawithCateNumber:0];
  
        
        }
    return _listArray;
}

//右边所有数据获取
- (NSMutableArray*) getRightAllIamgeListDatawithCateNumber:(int)number
{
    
    NSArray *groupIamge = @[@"infantmom",@"cloudflower",@"personalcare",@"fashionglasses",@"sportspavilion",@"rawfood",@"electronicsmall",@"professionalpharmacy",@"chinesemedicine",@"cross-bordershopping"];

//    
//    NSMutableArray *header = [NSMutableArray array];
//    NSMutableString *headerImageStr =nil;
//    for (int x=0; x<9; x++) {
//            headerImageStr = [NSMutableString stringWithFormat:@"categoryimg/0%d.png",x];
//       
//        [header addObject:headerImageStr];
//    }
//    
    
    
    
    NSMutableString *name = groupIamge[number];
    //一组的图片
     NSMutableArray *oneGroapItem =[NSMutableArray array];
    NSMutableString *imageStr = nil;
    for (int i=1; i<=12; i++) {
        if (i>9) {
        imageStr = [NSMutableString stringWithFormat:@"%@/%d.png",name,i];
        }else{
            imageStr = [NSMutableString stringWithFormat:@"%@/0%d.png",name,i];
        }
    RightContentModel*model = [[RightContentModel alloc]init];
    model.name = @"我去";
    model.imageStr =imageStr;
    [oneGroapItem addObject: model];
       
    }
    
    
    
    return  oneGroapItem;
}


//点击左边的，右边就改变
-(void)tode:(NSNotification*)notification{
    //每个分类里的图片
    NSMutableString *nuber= [NSMutableString stringWithFormat:@"%@",notification.userInfo[@"categoryRow"]];
    int i =[nuber intValue];
        //头部图片地址
    
    
    if (i>=9) {
        self.headerImageStr = [NSMutableString stringWithFormat:@"http://m.hxyxt.com/image/Category1/categoryimg/%d.jpg",i+1];
   
    }else{
     self.headerImageStr = [NSMutableString stringWithFormat:@"http://m.hxyxt.com/image/Category1/categoryimg/0%d.jpg",i+1];
    }
    self.listArray = [self getRightAllIamgeListDatawithCateNumber:i];
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];

     [self.collectionView registerClass:[RightCententCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
      
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return  self.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identify = @"cell";
    RightCententCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    RightContentModel*rightContentModel =self.listArray[indexPath.row];
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
    
    CGSize size={0,90};
    
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        
        UIImageView*dc =[[UIImageView alloc]init];
        dc.frame = headerView.bounds;
        
        if (!self.headerImageStr) {
           self.headerImageStr = [NSMutableString stringWithFormat:@"http://m.hxyxt.com/image/Category1/categoryimg/0%d.jpg",1];
        }
       [dc sd_setImageWithURL:[NSURL URLWithString:self.headerImageStr]];
        [headerView addSubview:dc];
    
        
        reusableview = headerView;
        
    }

//    if (kind == UICollectionElementKindSectionFooter){
//        
//        UICollectionReusableView *footerview = [collectionView dequeueResuableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
    
//        reusableview = footerview;
//        
//    }
    
    return reusableview;
    
    
    
}
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
