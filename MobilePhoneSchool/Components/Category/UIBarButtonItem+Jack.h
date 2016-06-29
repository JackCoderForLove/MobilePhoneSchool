//
//  UIBarButtonItem+Jack.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Jack)
/**
 *  创建图片按钮
 *
 *  @param image            图片按钮默认状态的图片
 *  @param highlightedImage 图片按钮高亮状态的图片
 *  @param action           监听图片按钮点击时间
 *
 *  @return UIBarButtonItem
 */

+ (UIBarButtonItem *)itemImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;

@end
