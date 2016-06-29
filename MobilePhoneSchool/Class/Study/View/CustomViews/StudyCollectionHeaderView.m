//
//  StudyCollectionHeaderView.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/7.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "StudyCollectionHeaderView.h"
#import "JackButton.h"
#import "StudyItemModel.h"

@implementation StudyCollectionHeaderView
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
    //创建竖线imgview
    self.lineImageView = [[UIImageView alloc]init];
    self.lineImageView.image = [UIImage imageNamed:@"blue.jpg"];
    [self addSubview:self.lineImageView];
    [self.lineImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(13);
        make.top.mas_equalTo(self.mas_top).with.offset(13);
        make.width.mas_equalTo(3);
        make.height.mas_equalTo(20);
    }];
    //创建标题
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:FontSize17];
    self.titleLabel.textColor = RGB_COLOR(47, 47, 47);
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineImageView.mas_right).with.offset(5);
        make.top.mas_equalTo(self.lineImageView.mas_top);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    //创建更多按钮
    self.moreJackButton = [JackButton buttonWithType:UIButtonTypeCustom];
    [self.moreJackButton setTitleColor:RGB_COLOR(215, 215, 215) forState:UIControlStateNormal];
    [self.moreJackButton setTitle:@"更多" forState:UIControlStateNormal];
    [self.moreJackButton setImage:[UIImage imageNamed:@"jackmore.png"] forState:UIControlStateNormal];
    self.moreJackButton.jackbuttonType = JackTypeLTRIMG;
    [self addSubview:self.moreJackButton];
    [self.moreJackButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).with.offset(-10);
        make.top.mas_equalTo(self.lineImageView.mas_top);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
}
- (void)setStuyItem:(StudyItemModel *)stuyItem
{
    _stuyItem = stuyItem;
    self.titleLabel.text = stuyItem.header;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lineImageView.mas_right).with.offset(8);
        make.top.mas_equalTo(self.lineImageView.mas_top);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];

}
@end
