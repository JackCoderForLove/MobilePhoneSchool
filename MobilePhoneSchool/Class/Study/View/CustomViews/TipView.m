//
//  TipView.m
//  MobilePhoneSchool
//  功能选项tip
//  Created by 李策 on 16/1/5.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "TipView.h"
#import "JackButton.h"

@implementation TipView
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
/**
 *  布局UI
 */
- (void)layoutMyUI
{
    //1 先初始化数据
    self.imageData = [NSArray arrayWithObjects:@"01.png",@"02.png",@"03.png",@"04.png",@"05.png", nil];
    self.titleData = [NSArray arrayWithObjects:@"课程",@"资讯",@"专区",@"班级",@"投票", nil];
    self.buttonArr = [NSMutableArray array];
    self.backgroundColor = RGB_COLOR(249, 249, 249);
    //创建btn
    for (int i = 0; i<self.imageData.count; i++)
    {
        JackButton * jackBtn = [JackButton buttonWithType:UIButtonTypeCustom];
        [jackBtn setImage:[UIImage imageNamed:[self.imageData objectAtIndex:i]] forState:UIControlStateNormal];
        [jackBtn setTitle:[self.titleData objectAtIndex:i] forState:UIControlStateNormal];
        [jackBtn setTitleColor:RGB_COLOR(129, 129, 129) forState:UIControlStateNormal];
        if (i == 0) {
            jackBtn.jackbuttonType = JackTypeTopBootom;
        }
        else
        {
            jackBtn.jackbuttonType = JackTypeLeftRight;
        }
        jackBtn.tag = i+1000;
        jackBtn.backgroundColor = [UIColor whiteColor];
        [jackBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:jackBtn];
        [self.buttonArr addObject:jackBtn];

    }
    for (int i = 0; i <self.buttonArr.count; i++)
    {
        CGFloat  TBwidth = (self.width-2)*0.3;
        CGFloat  LRwidth = (self.width-2)*0.35;
        NSInteger  LineSpace = 1;
        CGFloat  x;
        CGFloat  y;
        CGFloat  w;
        CGFloat  h;
        NSInteger maxCount = 2;
        if (i == 0)
        {
            x  = 0;
            y  = 0;
            w  = TBwidth;
            h  = self.height;
        }
        else
        {
            //1 计算行
            CGFloat row = (i-LineSpace)/maxCount;
            //2 计算列
            CGFloat col = (i-LineSpace) % maxCount;
            CGFloat LRHeight = (self.height-LineSpace)/2;
            x = TBwidth+LineSpace+(LRwidth+LineSpace)*col;
            y = (LRHeight+LineSpace)*row;
            w = LRwidth;
            h = LRHeight;
            
        }
        JackButton * jkBtn = [self.buttonArr objectAtIndex:i];
        jkBtn.frame  = CGRectMake(x, y, w, h);
    }
    
}

- (void)buttonClick:(JackButton *)jackButton
{
    if ([self.delegate respondsToSelector:@selector(clickTipView:withIndex:)]) {
        [self.delegate clickTipView:self withIndex:jackButton.tag];
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
