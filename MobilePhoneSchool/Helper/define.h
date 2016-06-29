//
//  define.h
//  MobilePhoneSchool
//  一些宏定义
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#ifndef define_h
#define define_h
#define iOS6 [[[UIDevice currentDevice] systemVersion] floatValue]>=6.0
#define iOS7 [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0
#define iOS8 [[[UIDevice currentDevice] systemVersion] floatValue]>=8.0
#define iOS9 [[[UIDevice currentDevice] systemVersion] floatValue]>=9.0

//服务器名称
#define SECURITY_SERVICE_NAME @"mobilephoneschool"
//显示文件、函数、行数
# define DebugLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#pragma mark  调节RGB颜色值
/******************************************
 调节RGB颜色值
 *****************************************/
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/247.0 green:((float)((rgbValue & 0xFF00) >> 8))/247.0 blue:((float)(rgbValue & 0xFF))/247.0 alpha:1.0]

#define UIColorFromOtherPageRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.2]

/******************************************
 自定义的颜色值
 *****************************************/
#define MYGRAY_COLOR2 [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]

#define FontSize14 14
#define FontSize15 15
#define FontSize16 16
#define FontSize17 17

#endif /* define_h */
