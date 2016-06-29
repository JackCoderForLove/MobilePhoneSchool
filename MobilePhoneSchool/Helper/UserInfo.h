//
//  UserInfo.h
//  MobilePhoneSchool
//  用户信息
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
//存取user_id phoneNum password
+(NSString *)getUserID;
+(NSString *)getPhoneNum;
//获取生产厂商id
+(NSString *)getFactoryID;

//获取app_id
+(NSString *)getAppID;

+(NSString *)getPassword;
+(NSString *)getCompanyName;
+(NSString *)getContract;
//获取店铺的shop_id
+(NSString *)getShopID;
//获取店铺的名称
+(NSString *)getShopName;
//获取手机号
+(NSString *)getMobile;
//获取本地缓存的验证码
+(NSString *)getCaptchaVer;
//获取本地缓存的地区ID
+(NSString *)getRegionID;
//获取联系人姓名
+(NSString *)getUserName;
//获取用户详细地址
+(NSString *)getDetalAddress;
//获取店铺的座机
+(NSString *)getShopTel;
//获取默认的收货人ID
+(NSString *)getDefaultConsigneedID;
//获取当前版本号
+(NSString *)getCurrentVersionID;
//获取channel_id
+(NSString *)getChannel_id;

//获取店铺图片
+(NSString *)getShoplogo;


+(NSString *)setShoplogo:(NSString *)logo;
//获取app_id
+(NSString *)setAppID:(NSString *) app_id;

+(NSString *)setPassword:(NSString *) pwd;

+(NSString *)setUserID:(NSString *) userId;

+(NSString *)setphoneNum:(NSString *) phone_num;

+(NSString *)setFactoryID:(NSString *) factoryId;

+(NSString *)setCompanyName:(NSString *)companyName;

+(NSString *)setContract:(NSString *)contract;
//对店铺的shop_id进行缓存
+(NSString *)setShopID:(NSString *)shopId;
//对店铺的名称进行缓存
+(NSString *)setShopName:(NSString *)shopName;
//对手机号进行缓存
+(NSString *)setMobileNum:(NSString *)mobilel;
//对验证码进行缓存
+(NSString *)setCaptchaVer:(NSString *)captchaver;
//对本地的地区ID进行缓存
+(NSString *)setRegionID:(NSString *)regionid;
//对联系人姓名进行缓存
+(NSString *)setUserName:(NSString *)username;
//对用户详细地址尽心缓存
+(NSString *)setDetailAddress:(NSString *)detailaddress;
//对店铺的座机进行缓存
+(NSString *)setShopTel:(NSString *)shoptel;
//对默认的收获人ID进行缓存
+(NSString *)setDefaultCongsineeID:(NSString *)defaultconsigneedID;
//对当前版本号进行缓存
+(NSString *)setCurrentVersionID:(NSString *)currentVersionID;
//对channel_id进行缓存
+(NSString *)setChannel_id:(NSString *)channel;

@end
