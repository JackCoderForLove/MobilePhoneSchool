//
//  Helper.h
//  MobilePhoneSchool
//  帮助文件
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NoResultPopView;
@interface Helper : NSObject
// 生成6位验证码
+ (NSString *) makeVerifyCode;

+ (CGRect)calculateFrame:(CGRect)frame;

+ (NSString *)judgeStrValue:(NSString *)str;

//比较版本号version
+ (BOOL)compareVersion:(NSString*)oldVersion newVersion:(NSString*)newVersion;

//通过文件路径获得图片缩略图
+ (NSString *) getImageUrlByPath:(NSString *) path size:(NSString *) size;

//创建没有搜索结果页
+(void)createNoResultView:(CGRect)resultFrame withTitleImg:(NSString *)titleImgName withFirstStr:(NSString *)firstStr withSecondStr:(NSString *)secondStr withSuperView:(id)currentSuperView withTag:(NSInteger)tag;
//隐藏没有结果页
+(void)hideNoResultView:(id)currentSuperView withTag:(NSInteger)tag;

//正则表达式
//邮编
+ (BOOL) validateZipCode:(NSString *)zipCode;
//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
//判断ios的设备
+ (NSString*)deviceString;
#pragma mark -
#pragma mark 订单时间时间戳转换为标准时间
+ (NSString *)dateTransformTime:(NSString * )time dateWithFormat:(NSString  *)dateForMate;

//根据文字返回尺寸
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

#pragma mark -
#pragma mark 弹出信息
+ (void)showAlert:(NSString*)msg;


@end
