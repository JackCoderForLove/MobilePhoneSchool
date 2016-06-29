//
//  Helper.m
//  MobilePhoneSchool
//  帮助文件
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "Helper.h"
#import "NoResultPopView.h"
#import <sys/utsname.h>
NoResultPopView  * popView;

@implementation Helper

// 生成6位验证码
+ (NSString *) makeVerifyCode
{
    NSTimeInterval random=[NSDate timeIntervalSinceReferenceDate];
    
    NSString *randomString = [NSString stringWithFormat:@"%.6f",random];
    
    NSString *code = [[randomString componentsSeparatedByString:@"."]objectAtIndex:1];
    
    return code;
}

//改变大小，起始点，宽高都变
+ (CGRect)calculateFrame:(CGRect)frame
{
    int originX = frame.origin.x;
    int originY = frame.origin.y;
    int currentHeight = frame.size.height;
    int currentWidth = frame.size.width;
    
    int width = ScreenWidth;
    int height = ScreenHeight;
    
    int scaleWidth = 320;
    int scaleHeight = 480;
    
    originX = frame.origin.x * width / scaleWidth ;
    originY = frame.origin.y * height / scaleHeight ;
    currentWidth = frame.size.width * width / scaleWidth ;
    currentHeight = frame.size.height * height / scaleHeight;
    CGRect returnRect = CGRectMake( originX, originY, currentWidth, currentHeight);
    return returnRect;
}

//如果字符串为nil或者@""
+ (NSString *)judgeStrValue:(NSString *)str
{
    if (str == nil || str.length == 0)
    {
        str = [NSString stringWithFormat:@""];
    }
    return str;
}

//比较版本号version
+ (BOOL)compareVersion:(NSString*)oldVersion newVersion:(NSString*)newVersion
{
    NSArray *arrayNow = [oldVersion componentsSeparatedByString:@"."];
    NSArray *arrayNew = [newVersion componentsSeparatedByString:@"."];
    BOOL isBigger = NO;
    NSInteger i = arrayNew.count > arrayNow.count? arrayNow.count : arrayNew.count;
    NSInteger j = 0;
    BOOL hasResult = NO;
    for (j = 0; j < i; j ++) {
        NSString* strNew = [arrayNew objectAtIndex:j];
        NSString* strNow = [arrayNow objectAtIndex:j];
        if ([strNew integerValue] > [strNow integerValue]) {
            hasResult = YES;
            isBigger = YES;
            break;
        }
        if ([strNew integerValue] < [strNow integerValue]) {
            hasResult = YES;
            isBigger = NO;
            break;
        }
    }
    if (!hasResult) {
        if (arrayNew.count > arrayNow.count) {
            NSInteger nTmp = 0;
            NSInteger k = 0;
            for (k = arrayNow.count; k < arrayNew.count; k++) {
                nTmp += [[arrayNew objectAtIndex:k]integerValue];
            }
            if (nTmp > 0) {
                isBigger = YES;
            }
        }
    }
    return isBigger;
}

//通过文件路径获得图片缩略图
+ (NSString *) getImageUrlByPath:(NSString *) path size:(NSString *) size
{
    if (!path.length) return @"";
    
    path = [path stringByReplacingOccurrencesOfString:@"org" withString:size];
    
    return [NSString stringWithFormat:@"%@%@", API_IMAGE_DOWN_URL, path];
}


//创建没有搜索结果页
+(void)createNoResultView:(CGRect)resultFrame withTitleImg:(NSString *)titleImgName withFirstStr:(NSString *)firstStr withSecondStr:(NSString *)secondStr withSuperView:(id)currentSuperView withTag:(NSInteger)tag
{
    UIView * currentView = [currentSuperView viewWithTag:tag];
    if (currentView) {
        return;
    }
    popView = [[NoResultPopView alloc]initWithFrame:resultFrame withTipImgName:titleImgName withTipFirstStr:firstStr withTipSecondStr:secondStr];
    popView.backgroundColor = RGB_COLOR(236, 236, 243);
    popView.tag = tag;
    [currentSuperView addSubview:popView];
    
}

//隐藏没有结果页
+(void)hideNoResultView:(id)currentSuperView withTag:(NSInteger)tag
{
    UIView * currentView = [currentSuperView viewWithTag:tag];
    [currentView removeFromSuperview];
    [currentSuperView setNeedsDisplay];
}


#pragma mark -
#pragma mark 订单时间时间戳转换为标准时间
+ (NSString *)dateTransformTime:(NSString * )time dateWithFormat:(NSString  *)dateForMate
{
    /*
     时间转时间戳的方法:
     NSString *timeSp = [NSString stringWithFormat:@"%d", (long)[datenow timeIntervalSince1970]];
     NSLog(@"timeSp:%@",timeSp); //时间戳的值
     时间戳转时间的方法
     NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1296035591];
     NSLog(@"1296035591  = %@",confromTimesp);
     NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
     NSLog(@"confromTimespStr =  %@",confromTimespStr);
     */
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateForMate];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}


/**
 *  iOS - 正则表达式判断邮箱、身份证..是否正确
 *
 *  @param BOOL
 *
 *  @return
 */


//邮编
+ (BOOL) validateZipCode:(NSString *)zipCode
{
    NSString *zipCodeRegex = @"^-?[0-9]{4,6}";
    NSPredicate *zipCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipCodeRegex];
    return [zipCodeTest evaluateWithObject:zipCode];
}

//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//车型
+ (BOOL) validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

//根据文字返回尺寸

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark -
#pragma mark 弹出信息
+ (void)showAlert:(NSString*)msg
{
    UIAlertView  * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
