//
//  UIImage+Jack.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Jack)
/**
 *  创建一个已经适配好了iOS67的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)imageWithNamed:(NSString *)name;

/**
 *  创建一个拉伸不变形的图片
 *
 *  @param name 图片名称
 */
+ (instancetype)resizableImageNamed:(NSString *)name;

+ (instancetype)resizableImageNamed:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
