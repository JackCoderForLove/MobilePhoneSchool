//
//  ItemSize.m
//  MobilePhoneSchool
//
//  Created by 李策 on 16/1/7.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "ItemSize.h"

@implementation ItemSize
+(CGSize)getItemSize:(NSIndexPath *)indexPath
{
    CGSize  itemSize ;
    switch (indexPath.section) {
        case 0:
        {
            
            itemSize = CGSizeMake((ScreenWidth-20)/2, 160);
            break;
        }
        case 1:
        {
            CGFloat commonWidth = (ScreenWidth-20)/2;
            if (indexPath.row == 0||indexPath.row == 1) {
                itemSize = CGSizeMake(commonWidth, 280);
            }
            else
            {
                itemSize = CGSizeMake(commonWidth, 135);

            }
            break;
        }
        case 2:
        {
            CGFloat commonWidth = (ScreenWidth-20)/3;

            if (indexPath.row == 0) {
                
                itemSize = CGSizeMake(commonWidth*2, 180);

            }
            else
            {
                itemSize = CGSizeMake(commonWidth, 180);

            }
            break;
        }
        default:
        {
            CGFloat commonWidth = (ScreenWidth-20)/2;
             itemSize = CGSizeMake(commonWidth, 135);
            break;
        }
    }
    return itemSize;
}
//+(CGSize)getItemSize:(NSIndexPath *)indexPath
//{
//    CGSize  itemSize ;
//    switch (indexPath.section) {
//        case 0:
//        {
//            itemSize = CGSizeMake((ScreenWidth-20)/2, 160);
//            break;
//        }
//        case 1:
//        {
//            CGFloat commonWidth = (ScreenWidth-30)/2;
//            if (indexPath.row == 0) {
//                itemSize = CGSizeMake(commonWidth, 230);
//            }
//            else
//            {
//                itemSize = CGSizeMake(commonWidth, 130);
//                
//            }
//            break;
//        }
//        case 2:
//        {
//            CGFloat commonWidth = (ScreenWidth-20)/3;
//            
//            if (indexPath.row == 0) {
//                
//                itemSize = CGSizeMake(commonWidth*2, 180);
//                
//            }
//            else
//            {
//                itemSize = CGSizeMake(commonWidth, 180);
//                
//            }
//            break;
//        }
//        default:
//        {
//            CGFloat commonWidth = (ScreenWidth-15)/2;
//            itemSize = CGSizeMake(commonWidth, 135);
//            break;
//        }
//    }
//    return itemSize;
//}

@end
