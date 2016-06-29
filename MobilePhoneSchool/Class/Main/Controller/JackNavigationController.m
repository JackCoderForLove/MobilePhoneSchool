//
//  JackNavigationController.m
//  MobilePhoneSchool
//  自定义导航
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "JackNavigationController.h"

@interface JackNavigationController ()

@end

@implementation JackNavigationController

+ (void)initialize
{
    //    IWLog(@"initialize");
    // 1.设置导航条的主题
    [self setupNavTheme];
    
    // 2.设置按钮的主题
    [self setupButtonTheme];
    
}
/**
 *  设置按钮的主题
 */
+ (void)setupButtonTheme
{
    // 1.拿到主题对象
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 2.设置属性
    //    if (!iOS7) {
    //        // 2.1设置按钮的背景图片
    //        [item setBackgroundImage:[UIImage imageWithNamed:@"black.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    }
    
    // 3设置按钮的文字属性
    // 3.1设置默认状态下的文字属性
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[UITextAttributeTextColor] = [UIColor whiteColor];
    md[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    md[UITextAttributeFont] = [UIFont systemFontOfSize:FontSize16];
    [item setTitleTextAttributes:md forState:UIControlStateNormal];
    
    //    // 3.2设置高亮状态下的文字属性
    //    NSMutableDictionary *mdHig = [NSMutableDictionary dictionaryWithDictionary:md];
    //    mdHig[UITextAttributeTextColor] = [UIColor redColor];
    //    [item setTitleTextAttributes:mdHig forState:UIControlStateHighlighted];
    
    // 设置图片
    // [item setBackButtonBackgroundImage:[UIImage imageWithNamed:@"navigationbar_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}
/**
 *  设置导航条的主题
 */
+ (void)setupNavTheme
{
    // 1.1.拿到appearance主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 1.2设置主题
    //if (!iOS7) {
    // 1.设置导航条背景图片
    [navBar setBackgroundColor:RGB_COLOR(36, 135, 222)];
    [navBar setBarTintColor:RGB_COLOR(36, 135, 222)];
    //        [navBar setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    
    // 2.设置导航条标题的属性
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    // 文字颜色
    md[UITextAttributeTextColor] = [UIColor whiteColor];
    // 文字偏移位
    md[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    // 文字字体大小
    md[UITextAttributeFont] = [UIFont systemFontOfSize:FontSize17];
    [navBar setTitleTextAttributes:md];
    //}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 1.只有栈中有控制器的情况才需要隐藏工具条
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 2.覆盖返回按钮
        // 只要覆盖了返回按钮, 系统自带的拖拽返回上一级的功能就会失效
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemImage:@"back@2x.png" highlightedImage:@"back@2x.png" target:self action:@selector(back)];
        
        // 3.添加更多按钮
        // viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemImage:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    // 第一次(根控制器)不需要隐藏工具条
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    //    IWLog(@"back");
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    //    IWLog(@"back");
    [self popToRootViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
