//
//  JackTabBarController.m
//  MobilePhoneSchool
//  自定义tabbar
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "JackTabBarController.h"
#import "MineViewController.h"
#import "StudyCenterViewController.h"
#import "JackNavigationController.h"

@interface JackTabBarController ()
{
    int index;
}
@end

@implementation JackTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //注册改变按钮的通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(changeTabBar:) name:@"changeTabBar" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addJackBagValue:) name:@"jackBadgeValue" object:nil];
    //  self.tabBar.translucent = NO;
    self.tabBar.hidden = NO;
    [self createViewControllers];
    [self createItems];
    
    // Do any additional setup after loading the view.
}

//设置bagValue
- (void)addJackBagValue:(NSNotification *)noti
{
    //获取字典
    NSDictionary * bageDic = [noti userInfo];
    //获取badgeValue
    NSString *  badgeVlaue = [bageDic objectForKey:@"bageValue"];
    //获取第几个Item
    int  badgeIndex = [[bageDic objectForKey:@"bageIndex"]intValue];
    //得到第几个Item
    UITabBarItem * badegItem = [self.tabBar.items objectAtIndex:badgeIndex];
    if ([badgeVlaue integerValue] == 0)
    {
        [badegItem setBadgeValue:nil];
    }
    else
    {
        if (badgeVlaue.integerValue >=99)
        {
            badgeVlaue = [NSString stringWithFormat:@"99+"];
        }
        //设置badgeValue
        [badegItem setBadgeValue:badgeVlaue];
    }
    
    
}
#pragma mark -
#pragma mark 改变tabbar的按钮
- (void)changeTabBar:(NSNotification *)notification
{
    index = [[notification object] intValue];
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:0.5f];
}

#pragma mark -
#pragma mark 改变索引
-(void)delayMethod
{
    self.selectedIndex = index;
}

- (void)createViewControllers
{
    //学习中心
    StudyCenterViewController * studyCenterVC = [[StudyCenterViewController alloc]init];
    JackNavigationController * studyNav = [[JackNavigationController alloc]initWithRootViewController:studyCenterVC];
    
    //我的
    MineViewController * mineVC = [[MineViewController alloc]init];
    JackNavigationController * mineNav = [[JackNavigationController alloc]initWithRootViewController:mineVC];
    
    
    self.viewControllers = @[studyNav,mineNav];
}

- (void)createItems
{
    NSArray * titleArray = @[@"学习中心",@"我的"];
    NSArray * selectImageArray = @[@"tab_home.png",@"nav1-blue.png"];
    NSArray * unseleceImageArray = @[@"tab_home_nor.png",@"nav1.png"];
    for (int i = 0; i<self.tabBar.items.count; i++) {
        UITabBarItem*item=self.tabBar.items[i];
        if (iOS7) {
            //需要对图片进行单独处理
            UIImage*selectImage=[UIImage imageNamed:selectImageArray[i]];
            selectImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIImage*unSelectImage=[UIImage imageNamed:unseleceImageArray[i]];
            unSelectImage=[unSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            //以上是防止在bar上显示为阴影而不是图片
            item.selectedImage=selectImage;
            item.image=unSelectImage;
            item.title=titleArray[i];
        }else{
            [item setFinishedSelectedImage:[UIImage imageNamed:selectImageArray[i]] withFinishedUnselectedImage:[UIImage imageNamed:unseleceImageArray[i]]];
            item.title=titleArray[i];
        }
        
    }
    if (iOS7) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB_COLOR(37, 182, 237)} forState:UIControlStateSelected];
    }else{
        [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:RGB_COLOR(37, 182, 237)} forState:UIControlStateSelected];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
