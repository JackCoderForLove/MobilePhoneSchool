//
//  UserInfo.m
//  MobilePhoneSchool
//  用户信息
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "UserInfo.h"
#import "SFHFKeychainUtils.h"

static NSString * _app_id;
static NSString * user_id;
static NSString * phoneNum;
static NSString * factory_id;
static NSString * password;
static NSString * company_name;
static NSString * contact;
static NSString * shop_id;
static NSString * shop_name;
static NSString * mobile;
static NSString * captcha_ver;
static NSString * region_id;
static NSString * user_name;
static NSString * shop_tel;
static NSString * detail_address;
static NSString * default_consign_id;
static NSString * current_version_id;
static NSString * channel_id;
static NSString * shopLogo;
@implementation UserInfo
//获取app_id
+(NSString *)getAppID {
    if (_app_id == nil|| !_app_id.length) {
        _app_id = [SFHFKeychainUtils getPasswordForUsername:@"app_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return _app_id;
}

//获取用户id
+(NSString *)getUserID{
    if (user_id == nil|| !user_id.length) {
        user_id = [SFHFKeychainUtils getPasswordForUsername:@"user_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return user_id;
}
+(NSString *)getPhoneNum{
    if (phoneNum == nil || !phoneNum.length) {
        phoneNum = [SFHFKeychainUtils getPasswordForUsername:@"phoneNum" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return phoneNum;
}
//获取用户id
+(NSString *)getFactoryID{
    if (factory_id == nil || !factory_id.length) {
        factory_id = [SFHFKeychainUtils getPasswordForUsername:@"factory_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return factory_id;
}

+(NSString *)getPassword {
    if (password == nil || !password.length) {
        password = [SFHFKeychainUtils getPasswordForUsername:@"password" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return password;
}

+(NSString *)getCompanyName{
    if (company_name == nil || !company_name.length) {
        company_name = [SFHFKeychainUtils getPasswordForUsername:@"company_name" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return company_name;
}

+(NSString *)getContract{
    if (contact == nil || !contact.length) {
        contact = [SFHFKeychainUtils getPasswordForUsername:@"contact" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return contact;
}

//获取店铺的shop_id
+(NSString *)getShopID
{
    if (shop_id == nil || !shop_id.length) {
        shop_id = [SFHFKeychainUtils getPasswordForUsername:@"shop_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return shop_id;
    
}
//获取店铺的名称
+(NSString *)getShopName
{
    if (shop_name == nil || !shop_name.length) {
        shop_name = [SFHFKeychainUtils getPasswordForUsername:@"shop_name" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return shop_name;
    
}
//获取手机号
+(NSString *)getMobile
{
    if (mobile == nil || !mobile.length) {
        mobile = [SFHFKeychainUtils getPasswordForUsername:@"mobile" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return mobile;
    
}

//获取本地缓存的验证码
+(NSString *)getCaptchaVer
{
    
    if (captcha_ver == nil || !captcha_ver.length) {
        captcha_ver = [SFHFKeychainUtils getPasswordForUsername:@"captcha" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return captcha_ver;
    
}

//获取本地缓存的地区ID
+(NSString *)getRegionID
{
    if (region_id == nil || !region_id.length) {
        region_id = [SFHFKeychainUtils getPasswordForUsername:@"region_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return region_id;
}


//获取联系人姓名
+(NSString *)getUserName
{
    if (user_name == nil || !user_name.length) {
        user_name = [SFHFKeychainUtils getPasswordForUsername:@"user_name" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return user_name;
    
}
//获取用户详细地址
+(NSString *)getDetalAddress
{
    if (detail_address == nil || !detail_address.length) {
        detail_address = [SFHFKeychainUtils getPasswordForUsername:@"detail_address" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return detail_address;
    
}
//获取店铺的座机
+(NSString *)getShopTel
{
    if (shop_tel == nil || !shop_tel.length) {
        shop_tel = [SFHFKeychainUtils getPasswordForUsername:@"shop_tel" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return shop_tel;
    
}

//获取默认的收货人ID
+(NSString *)getDefaultConsigneedID
{
    if (default_consign_id == nil || !default_consign_id.length) {
        default_consign_id = [SFHFKeychainUtils getPasswordForUsername:@"default_consign_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return default_consign_id;
    
}

//获取当前版本号
+(NSString *)getCurrentVersionID
{
    if (current_version_id == nil || !current_version_id.length) {
        current_version_id = [SFHFKeychainUtils getPasswordForUsername:@"current_version_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return current_version_id;
    
}

//获取channel_id
+(NSString *)getChannel_id
{
    if (channel_id == nil || !channel_id.length) {
        channel_id = [SFHFKeychainUtils getPasswordForUsername:@"channel_id" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return channel_id;
    
}

+(NSString *)getShoplogo
{
    if (shopLogo == nil || !shopLogo.length) {
        shopLogo = [SFHFKeychainUtils getPasswordForUsername:@"shopLogo" andServiceName:SECURITY_SERVICE_NAME error:nil];
    }
    return shopLogo;
    
}
//获取app_id
+(NSString *)setAppID:(NSString *) app_id {
    _app_id = app_id;
    if (_app_id == nil) {
        _app_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"app_id" andPassword:_app_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    return _app_id;
}

+(NSString *)setContract:(NSString *)contract{
    contact = contract;
    if (contact == nil) {
        contact = @"";
    }
    [SFHFKeychainUtils storeUsername:@"contact" andPassword:contact forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    return contact;
}

+(NSString *)setPassword:(NSString *) pwd {
    password = pwd;
    if (password == nil) {
        password = @"";
    }
    [SFHFKeychainUtils storeUsername:@"password" andPassword:password forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    return password;
}

+(NSString *)setUserID:(NSString *) userId {
    user_id = userId;
    if (user_id == nil) {
        user_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"user_id" andPassword:user_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return user_id;
}

+(NSString *)setphoneNum:(NSString *) phone_num {
    phoneNum = phone_num;
    if (phoneNum == nil) {
        phoneNum = @"";
    }
    [SFHFKeychainUtils storeUsername:@"phoneNum" andPassword:phoneNum forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return phoneNum;
}

+(NSString *)setFactoryID:(NSString *) factoryId {
    factory_id = factoryId;
    if (factory_id == nil) {
        factory_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"factory_id" andPassword:factory_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return factory_id;
}

+(NSString *)setCompanyName:(NSString *)companyName{
    company_name = companyName;
    if (company_name == nil) {
        company_name = @"";
    }
    [SFHFKeychainUtils storeUsername:@"company_name" andPassword:company_name forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return company_name;
}

//对店铺的shop_id进行缓存
+(NSString *)setShopID:(NSString *)shopId
{
    shop_id = shopId;
    if (shop_id == nil) {
        shop_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"shop_id" andPassword:shop_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return shop_id;
    
}
//对店铺的名称进行缓存
+(NSString *)setShopName:(NSString *)shopName
{
    shop_name = shopName;
    if (shop_name == nil) {
        shop_name = @"";
    }
    [SFHFKeychainUtils storeUsername:@"shop_name" andPassword:shop_name forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return shop_name;
}
//对手机号进行缓存
+(NSString *)setMobileNum:(NSString *)mobilel
{
    mobile = mobilel;
    if (mobile == nil)
    {
        mobile = @"";
    }
    [SFHFKeychainUtils storeUsername:@"mobile" andPassword:mobile forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return mobile;
    
}

//对验证码进行缓存
+(NSString *)setCaptchaVer:(NSString *)captchaver
{
    captcha_ver = captchaver;
    if (captcha_ver == nil)
    {
        captcha_ver = @"";
    }
    [SFHFKeychainUtils storeUsername:@"captcha" andPassword:captcha_ver forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return captcha_ver;
    
}

//对本地的地区ID进行缓存
+(NSString *)setRegionID:(NSString *)regionid
{
    region_id = region_id;
    if (region_id == nil)
    {
        region_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"region_id" andPassword:region_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return region_id;
    
}

//对联系人姓名进行缓存
+(NSString *)setUserName:(NSString *)username
{
    user_name = username;
    if (user_name == nil)
    {
        user_name = @"";
    }
    [SFHFKeychainUtils storeUsername:@"user_name" andPassword:user_name forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return user_name;
    
}
//对用户详细地址尽心缓存
+(NSString *)setDetailAddress:(NSString *)detailaddress
{
    detail_address = detailaddress;
    if (detail_address == nil)
    {
        detail_address = @"";
    }
    [SFHFKeychainUtils storeUsername:@"detail_address" andPassword:detail_address forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return detail_address;
    
}
//对店铺的座机进行缓存
+(NSString *)setShopTel:(NSString *)shoptel
{
    shop_tel = shoptel;
    if (shop_tel == nil)
    {
        shop_tel = @"";
    }
    [SFHFKeychainUtils storeUsername:@"shop_tel" andPassword:shop_tel forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return shop_tel;
}

//对默认的收获人ID进行缓存
+(NSString *)setDefaultCongsineeID:(NSString *)defaultconsigneedID
{
    default_consign_id = defaultconsigneedID;
    if (default_consign_id == nil)
    {
        default_consign_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"default_consign_id" andPassword:default_consign_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return default_consign_id;
    
}
//对当前版本号进行缓存
+(NSString *)setCurrentVersionID:(NSString *)currentVersionID
{
    current_version_id = currentVersionID;
    if (current_version_id == nil)
    {
        current_version_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"current_version_id" andPassword:current_version_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return current_version_id;
    
}

//对channel_id进行缓存
+(NSString *)setChannel_id:(NSString *)channel
{
    channel_id = channel;
    if (channel_id == nil)
    {
        channel_id = @"";
    }
    [SFHFKeychainUtils storeUsername:@"channel_id" andPassword:channel_id forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    
    return channel_id;
    
}
+(NSString *)setShoplogo:(NSString *)logo
{
    shopLogo =logo;
    if (shopLogo==nil) {
        shopLogo=@"";
    }
    [SFHFKeychainUtils storeUsername:@"shopLogo" andPassword:shopLogo forServiceName:SECURITY_SERVICE_NAME updateExisting:1 error:nil];
    return shopLogo;
    
    
}

@end
