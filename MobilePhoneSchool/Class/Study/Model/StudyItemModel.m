//
//  StudyItemModel.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/6.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "StudyItemModel.h"
#import "StudyItem.h"

@implementation StudyItemModel
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"statuses" : @"MJStatus",
             @"data" : @"StudyItem"
             };

}
@end
