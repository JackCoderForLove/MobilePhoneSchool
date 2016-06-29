//
//  StudyCollectionView.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/7.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "StudyCollectionView.h"
#import "StudyCenterItemCollectionViewCell.h"
#import "StudyItemModel.h"
#import "StudyCollectionHeaderView.h"
#import "StudyItem.h"
#import <objc/runtime.h>
#import "JackButton.h"
#import "ItemSize.h"

static NSString * const collectionViewCellID = @"studyCellID";
static NSString * const collectionHeaderViewID = @"headerViewID";
NSString * headerIndex = @"headerindexPath";
NSString * headerData = @"headerData";

@implementation StudyCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    //调用布局
    [self layoutMyUI];
    return self;
}
#pragma mark - UI
//布局UI
- (void)layoutMyUI
{
    //获取数据
    NSString * studyPath = [[NSBundle mainBundle]pathForResource:@"StudyData" ofType:@"plist"];
    NSMutableArray * jackData = [NSMutableArray arrayWithContentsOfFile:studyPath];
//    DebugLog(@"我的数据:%@",jackData);
    //数据转模型
    self.studyData = [NSMutableArray array];
    self.studyData = [StudyItemModel mj_objectArrayWithKeyValuesArray:jackData];
//    DebugLog(@"我的数据:%@",self.studyData);
    //创建网格
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.contentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:flowLayout];
    [self addSubview:self.contentCollectionView];
    //实现代理
    self.contentCollectionView.delegate = self;
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.scrollEnabled = NO;
    //注册cell
    [self.contentCollectionView registerClass:[StudyCenterItemCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellID];
    //注册headerView
    [self.contentCollectionView registerClass:[StudyCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderViewID];
    //设置背景
    self.contentCollectionView.backgroundColor = [UIColor whiteColor];
    
}
#pragma mark - method
//刷新数据
- (void)reloadStudyData
{
    DebugLog(@"刷新数据");
    [self.contentCollectionView reloadData];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.studyData.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    StudyItemModel * item = [self.studyData objectAtIndex:section];
    NSArray * data = item.data;
    return data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StudyCenterItemCollectionViewCell * studyCell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
    StudyItemModel * item = [self.studyData objectAtIndex:indexPath.section];
    NSArray * data = item.data;
    StudyItem * jackItem = [data objectAtIndex:indexPath.row];
    studyCell.stuModel = jackItem;
    if (indexPath.section == 1&&indexPath.row == 1) {
        studyCell.imgBlock = ^(id title, UIImageView * img)
        {
            if (self.mainBlock) {
                self.mainBlock(self,title);
            }

        };
        studyCell.subimgBlock = ^(id subtitle,UIImageView * subImg)
        {
            if (self.subBlock) {
                self.subBlock(self,subtitle);
            }
        };
    }
    return studyCell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        StudyCollectionHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionHeaderViewID forIndexPath:indexPath];
        StudyItemModel * item = [self.studyData objectAtIndex:indexPath.section];
        headerView.stuyItem = item;
            objc_setAssociatedObject(headerView.moreJackButton,(__bridge const void *)(headerData),item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                objc_setAssociatedObject(headerView.moreJackButton, (__bridge const void *)(headerIndex), indexPath, OBJC_ASSOCIATION_ASSIGN);

        [headerView.moreJackButton addTarget:self action:@selector(headerClick:) forControlEvents:UIControlEventTouchUpInside];
        reusableView = headerView;
    }
    return reusableView;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(studyCollectionViewClickItem:withIndexPath:withData:)]) {
        StudyItemModel * item = [self.studyData objectAtIndex:indexPath.section];
        NSArray * data = item.data;
        StudyItem * jackItem = [data objectAtIndex:indexPath.row];
        [self.delegate studyCollectionViewClickItem:self withIndexPath:indexPath withData:jackItem];
    }
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [ItemSize getItemSize:indexPath];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edge;
    if (section == 1) {
        edge = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    else
    {
        edge = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return edge;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat inter;
    if (section == 1) {
        inter = 10;
    }
    else
    {
        inter = 5;
    }
    return inter;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 40);
}
#pragma mark - runtime
- (void)headerClick:(JackButton *)jackBtn
{
    
 //   DebugLog(@"sddds");
   StudyItemModel * itemMode = objc_getAssociatedObject(jackBtn, (__bridge const void *)(headerData));
    NSIndexPath * indexPath = objc_getAssociatedObject(jackBtn, (__bridge const void *)headerIndex);
   // DebugLog(@"我点击了头部:%@--%ld",itemMode.header,(long)indexPath.section);
    if ([self.delegate respondsToSelector:@selector(studyCollectionViewClickHederSection:withIndexPath:withHeaderData:)]) {
        [self.delegate studyCollectionViewClickHederSection:self withIndexPath:indexPath withHeaderData:itemMode];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
