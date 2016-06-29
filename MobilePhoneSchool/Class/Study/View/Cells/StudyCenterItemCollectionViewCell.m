//
//  StudyCenterItemCollectionViewCell.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/6.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "StudyCenterItemCollectionViewCell.h"
#import "StudyItem.h"

@implementation StudyCenterItemCollectionViewCell
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
//布局UI
- (void)layoutMyUI
{
    //创建imageView
    self.imgView = [[UIImageView alloc]init];
    [self addSubview:self.imgView];
    //布局
    self.imgView.frame = CGRectMake(0, 0, self.width, self.height-30);
    //创建label
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height-25, self.width, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:FontSize15];
    self.titleLabel.textColor = RGB_COLOR(78, 78, 78);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    //创建imageView
    self.subImgView = [[UIImageView alloc]init];
    [self addSubview:self.subImgView];
    self.subImgView.hidden = YES;
    //创建label
    self.subTitleLabel = [[UILabel alloc]init];
    self.subTitleLabel.font = [UIFont systemFontOfSize:FontSize15];
    self.subTitleLabel.textColor = RGB_COLOR(78, 78, 78);
    self.subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.subTitleLabel];
    
}
- (void)setStuModel:(StudyItem *)stuModel
{
    _stuModel = stuModel;
    if (_stuModel.subimagename.length == 0)
    {
        self.imgView.image = [UIImage imageNamed:_stuModel.imagename];
        self.titleLabel.text = _stuModel.title;

    }
    else
    {
        self.subImgView.hidden = NO;
        self.subTitleLabel.hidden = NO;
        //先赋值
        self.imgView.image = [UIImage imageNamed:_stuModel.imagename];
        self.titleLabel.text = _stuModel.title;
        self.subImgView.image = [UIImage imageNamed:_stuModel.subimagename];
        self.subTitleLabel.text = _stuModel.subtitle;
        //重新布局
        [self.imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
            make.left.mas_equalTo(self.mas_left);
            make.height.mas_equalTo(self.height/2-25);
            make.top.mas_equalTo(self.mas_top);
        }];
        UITapGestureRecognizer * imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapGesture:)];
        [self.imgView addGestureRecognizer:imgTap];
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
            make.left.mas_equalTo(self.mas_left);
            make.top.mas_equalTo(self.imgView.mas_bottom);
            make.height.mas_equalTo(20);
        }];
        [self.subImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
            make.left.mas_equalTo(self.mas_left);
            make.height.mas_equalTo(self.height/2-25);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        }];
        UITapGestureRecognizer * subimgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(subimageTapGesture:)];
        [self.subImgView addGestureRecognizer:subimgTap];
        [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
            make.left.mas_equalTo(self.mas_left);
            make.top.mas_equalTo(self.subImgView.mas_bottom);
            make.height.mas_equalTo(20);
        }];
        self.imgView.userInteractionEnabled = YES;
        self.subImgView.userInteractionEnabled = YES;
        
    }
    
}
- (void)imageTapGesture:(UITapGestureRecognizer *)ges
{
    if (self.imgBlock) {
        self.imgBlock(_stuModel.title,ges.view);
    }
}

- (void)subimageTapGesture:(UITapGestureRecognizer *)ges
{
    if (self.subimgBlock) {
        self.subimgBlock(_stuModel.subtitle,ges.view);
    }
}

@end
