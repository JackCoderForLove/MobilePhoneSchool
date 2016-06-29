//
//  NoResultPopView.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "NoResultPopView.h"

@implementation NoResultPopView
- (instancetype)initWithFrame:(CGRect)frame withTipImgName:(NSString *)tipImgName withTipFirstStr:(NSString *)tipFirstStr withTipSecondStr:(NSString *)tipSecondStr
{
    self = [super initWithFrame:frame];
    if (!self)
    {
        return nil;
    }
    if (tipImgName == nil || tipFirstStr == nil ||  tipSecondStr == nil)
    {
        return nil;
    }
    self.tipImgName = tipImgName;
    self.tipFirstStr = tipFirstStr;
    self.tipSecondStr = tipSecondStr;
    //布局我的UI
    [self layoutMyUI];
    return self;
    
}

//布局我的UI
- (void)layoutMyUI
{
    //创建tipImg
    self.tipImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.tipImgView.image = [UIImage imageNamed:self.tipImgName];
    [self addSubview:self.tipImgView];
    //适配
    [self.tipImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(76);
        make.height.mas_equalTo(76);
        make.left.mas_equalTo(self.mas_left).with.offset((ScreenWidth-76)/2);
        make.top.mas_equalTo(self.mas_top).with.offset(80+60);
    }];
    
    //创建提示1
    self.tipFirstLab = [[UILabel alloc]initWithFrame:CGRectZero];
    self.tipFirstLab.font = [UIFont systemFontOfSize:16];
    [self.tipFirstLab setTextColor:RGB_COLOR(123, 124, 125)];
    [self.tipFirstLab setText:self.tipFirstStr];
    self.tipFirstLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.tipFirstLab];
    
    //适配
    [self.tipFirstLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(16);
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.tipImgView.mas_bottom).with.offset(12);
    }];
    
    //创建提示2
    self.tipSecondLab = [[UILabel alloc]initWithFrame:CGRectZero];
    self.tipSecondLab.font = [UIFont systemFontOfSize:13];
    [self.tipSecondLab setTextColor:MYGRAY_COLOR2];
    [self.tipSecondLab setText:self.tipSecondStr];
    self.tipSecondLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.tipSecondLab];
    
    //适配
    [self.tipSecondLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(12);
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.tipFirstLab.mas_bottom).with.offset(12);
    }];
    
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
