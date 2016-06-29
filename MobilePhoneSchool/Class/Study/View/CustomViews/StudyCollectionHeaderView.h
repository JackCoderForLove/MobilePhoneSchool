//
//  StudyCollectionHeaderView.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/7.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JackButton;
@class StudyItemModel;
@interface StudyCollectionHeaderView : UICollectionReusableView
@property (strong,nonatomic) UIImageView * lineImageView;
@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) JackButton *  moreJackButton;
@property (strong,nonatomic) StudyItemModel *  stuyItem;
@end
