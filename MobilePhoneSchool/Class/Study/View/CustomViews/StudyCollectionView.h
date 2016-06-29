//
//  StudyCollectionView.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/7.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StudyItemModel;
@class StudyCollectionView;
@class StudyItem;
typedef void(^myBlock)(StudyCollectionView * view,id title);
typedef void(^mysubBlock) (StudyCollectionView * subview,id subtitle);
typedef void(^jackBlock)(id title,id view);
typedef void(^jacksubBlock) (id subtitle,id subview);
@protocol StudyCollectionViewDelegate <NSObject>
@optional
- (void)studyCollectionViewClickItem:(StudyCollectionView *)studyView withIndexPath:(NSIndexPath *)indexPath withData:(StudyItem *)itemData;
- (void)studyCollectionViewClickHederSection:(StudyCollectionView *)studyView withIndexPath:(NSIndexPath *)indexPath withHeaderData:(StudyItemModel *)headerData;
@end


@interface StudyCollectionView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (assign,nonatomic) CGFloat maxHeight;
@property (strong,nonatomic) UICollectionView  * contentCollectionView;
@property (strong,nonatomic) NSMutableArray * studyData;
@property (assign,nonatomic) id<StudyCollectionViewDelegate> delegate;
@property (copy,nonatomic)myBlock  mainBlock;
@property (copy,nonatomic)mysubBlock  subBlock;


- (void)reloadStudyData;

@end
