//
//  JackButton.h
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/5.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,JackButtonType)
{
    JackTypeTopBootom = 0,
    JackTypeLeftRight,
    JackTypeLTRIMG
};
@interface JackButton : UIButton
@property (assign,nonatomic)JackButtonType  jackbuttonType;
@end
