//
//  TipView.h
//  MobilePhoneSchool
//  功能选项tip
//  Created by 李策 on 16/1/5.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JackButton;
@class TipView;
@protocol TipViewDelegate <NSObject>

- (void)clickTipView:(TipView *)tipView  withIndex:(NSInteger)index;

@end
@interface TipView : UIView
@property (strong,nonatomic) NSArray * imageData;
@property (strong,nonatomic) NSArray * titleData;
@property (strong,nonatomic) NSMutableArray * buttonArr;
@property (assign,nonatomic) id <TipViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame;
@end
