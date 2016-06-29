//
//  UIBarButtonItem+Jack.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "UIBarButtonItem+Jack.h"

@implementation UIBarButtonItem (Jack)
+ (UIBarButtonItem *)itemImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    // 1.创建一个UIButton
    UIButton *btn = [[UIButton alloc] init];
    // 设置默认状态图片
    [btn setImage:[UIImage imageWithNamed:image] forState:UIControlStateNormal];
    // 设置高亮状态图片
    [btn setImage:[UIImage imageWithNamed:highlightedImage] forState:UIControlStateHighlighted];
    // 设置size
    CGSize  currtenSize = CGSizeMake(40, 55/2);
    // btn.size = btn.currentImage.size;
    btn.size = currtenSize;
    // 监听点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 生成UIBarButtonItem
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
