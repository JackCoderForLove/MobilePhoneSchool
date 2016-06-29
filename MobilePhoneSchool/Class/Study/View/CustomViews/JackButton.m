//
//  JackButton.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/5.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "JackButton.h"
#define jackWidth self.width
#define jackHeight self.height
#define jackTBImageHeight 35
#define jackTBImageWidth  35
#define jackLRImageHeight 30
#define jackLRImageWidth  35
#define jackTBTitleHeight 20
#define jackTBTitleWidth  self.width
#define jackLRTitleHeight 20
#define jackLRTitleWidth  self.width-60


@implementation JackButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置文字的颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 2.设置按钮的高亮图片
        // [self setBackgroundImage:[UIImage resizableImageNamed:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        // 3.设置图片不拉伸
        //  self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:FontSize14];
        // 让系统高亮状态不调整图片的样式
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}
- (void)setJackbuttonType:(JackButtonType)jackbuttonType
{
    _jackbuttonType = jackbuttonType;
}
// 标题的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY;
    CGFloat titleX;
    CGFloat titleW;
    CGFloat titleH;
    
    if (self.jackbuttonType == JackTypeTopBootom)
    {
        //图标在上边,标题在下边
        titleX = 0;
        titleY = jackTBImageHeight + ((jackHeight-jackTBImageHeight-jackTBTitleHeight)/3*2)-5;
        titleW = jackTBTitleWidth;
        titleH = jackTBTitleHeight;
        
    }
    else if(self.jackbuttonType == JackTypeLeftRight)
    {
        //图标在左边,标题在右边
        titleX = 60;
        titleY = (self.height-jackLRImageHeight)/2+5;
        titleW = jackLRTitleWidth;
        titleH = jackLRTitleHeight;

    }
    else if (self.jackbuttonType == JackTypeLTRIMG)
    {
        titleX = 0;
        titleY = 0;
        titleW = self.width-20;
        titleH = self.height;

    }
    return CGRectMake(titleX, titleY, titleW, titleH);
}
// 图标的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY;
    CGFloat imageW;
    CGFloat imageX;
    CGFloat imageH;
    if (self.jackbuttonType == JackTypeTopBootom) {
        //图标在上边,标题在下边
        imageX = (jackWidth-jackTBImageWidth)/2;
        imageY = (jackHeight-jackTBImageHeight-jackTBTitleHeight)/3;
        imageW = jackTBImageWidth;
        imageH = jackTBImageHeight;
    }
    else if(self.jackbuttonType == JackTypeLeftRight)
    {
        //图标在左边,标题在右边
        imageX = 20;
        imageY = (self.height-jackLRImageHeight)/2;
        imageW = jackLRImageWidth;
        imageH = jackLRImageHeight;
        
    }
    else if (self.jackbuttonType == JackTypeLTRIMG)
    {
        imageX = self.width-20;
        imageY = (self.height-15)/2;
        imageW = 15;
        imageH = 15;
    }
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
