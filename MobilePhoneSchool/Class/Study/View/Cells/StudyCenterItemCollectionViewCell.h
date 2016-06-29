//
//  StudyCenterItemCollectionViewCell.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/6.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StudyItem;
typedef void(^imageBlock)(id title,id image);
typedef void(^subimageBlock) (id subtitle,id subimage);
@interface StudyCenterItemCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView  * imgView;
@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UIImageView  * subImgView;
@property (strong,nonatomic) UILabel *  subTitleLabel;
@property (copy,nonatomic)imageBlock  imgBlock;
@property (copy,nonatomic)subimageBlock  subimgBlock;


@property (strong,nonatomic) StudyItem * stuModel;

@end
