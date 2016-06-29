//
//  NoResultPopView.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoResultPopView : UIView
@property (strong,nonatomic)NSString     * tipImgName;//标题图片的名称
@property (strong,nonatomic)NSString     * tipFirstStr;//标题1文字
@property (strong,nonatomic)NSString     * tipSecondStr;//标题2文字
@property (strong,nonatomic)UIImageView  * tipImgView;//标题img
@property (strong,nonatomic)UILabel      * tipFirstLab;//提示1
@property (strong,nonatomic)UILabel      * tipSecondLab;//提示2

- (instancetype)initWithFrame:(CGRect)frame withTipImgName:(NSString *)tipImgName withTipFirstStr:(NSString *)tipFirstStr withTipSecondStr:(NSString *)tipSecondStr;

@end
