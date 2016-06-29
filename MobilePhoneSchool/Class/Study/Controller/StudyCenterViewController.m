//
//  StudyCenterViewController.m
//  MobilePhoneSchool
//  学习中心
//  Created by 李策 on 16/1/4.
//  Copyright © 2016年 mobilephoneschool. All rights reserved.
//

#import "StudyCenterViewController.h"
#import "SearchViewController.h"
#import "HistoryViewController.h"
#import "SDCycleScrollView.h"
#import "TipView.h"
#import "BannerDetailViewController.h"
#import "CourseViewController.h"
#import "InformationViewController.h"
#import "SepcaillyViewController.h"
#import "ClassViewController.h"
#import "VoteViewController.h"
#import "StudyCollectionView.h"
#import "StudyItemModel.h"
#import "StudyItem.h"
#import "StudyItemDetailViewController.h"
#import "StudyCenterItemCollectionViewCell.h"

@interface StudyCenterViewController ()<SDCycleScrollViewDelegate,UIScrollViewDelegate,TipViewDelegate,StudyCollectionViewDelegate>
@property (strong,nonatomic) UIScrollView * bgScrollView;//最底层滚动视图
@property (strong,nonatomic) StudyCollectionView * studyView;//内容网格视图
@property (strong,nonatomic) TipView * tipView;
@property (strong,nonatomic) NSArray * imageDataArr;

@end

@implementation StudyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1布局UI
    [self layoutMyUI];
    //2请求数据
    [self loadRequest];
    //3 block 回调
    [self blockClick];
    // Do any additional setup after loading the view.
}
#pragma mark - Request
- (void)loadRequest
{
    
}
#pragma mark - UI
/**
 *  布局UI
 */
- (void)layoutMyUI
{
    self.navigationItem.title = @"学习中心";
    self.view.backgroundColor = RGB_COLOR(246, 246, 246);
    //创建NavItem
    [self layoutNav];
    //布局其他
    [self layoutOther];

}

/**
 *  布局Nav
 */
- (void)layoutNav
{
    UIBarButtonItem * searchItem = [UIBarButtonItem itemImage:@"002.png" highlightedImage:@"search.png" target:self action:@selector(jumpToSearchVC:)];
    searchItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = searchItem;
    UIBarButtonItem * histroyItem = [UIBarButtonItem itemImage:@"001.png" highlightedImage:@"search.png" target:self action:@selector(jumpToHistoryVC:)];
    histroyItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = histroyItem;
}

/**
 *  布局其他
 */
- (void)layoutOther
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //1.创建最底部的滚动视图
    [self.view addSubview:self.bgScrollView];
    //2.创建轮播视图
    SDCycleScrollView * sdcyView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    sdcyView.infiniteLoop = YES;
    sdcyView.delegate = self;
    sdcyView.autoScrollTimeInterval = 1.0;
    sdcyView.currentPageDotColor = [UIColor whiteColor];
    sdcyView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    sdcyView.localizationImageNamesGroup = self.imageDataArr;
    [self.bgScrollView addSubview:sdcyView];
    self.tipView = [[TipView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, 107)];
    self.tipView.delegate = self;
    [self.bgScrollView addSubview:self.tipView];
    //创建网格
    self.studyView = [[StudyCollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tipView.frame), ScreenWidth, 1800)];
    self.studyView.delegate = self;
    self.studyView.backgroundColor = [UIColor cyanColor];
    [self.bgScrollView addSubview:self.studyView];
    self.bgScrollView.contentSize = CGSizeMake(ScreenWidth, 1800);
}

/**
 *  刷新UI,重置布局
 */
- (void)refreshMyUI
{
    
}
#pragma mark - Events
/**
 *  进入搜索页面
 *
 *  @param sender <#sender description#>
 */
- (void)jumpToSearchVC:(id)sender
{
    SearchViewController * searchVC = [[SearchViewController alloc]init];
    searchVC.navigationItem.title = @"搜索";
    [self.navigationController pushViewController:searchVC animated:YES];
}
/**
 *  进入浏览历史界面
 *
 *  @param sender <#sender description#>
 */
- (void)jumpToHistoryVC:(id)sender
{
    HistoryViewController * historyVC = [[HistoryViewController alloc]init];
    historyVC.navigationItem.title = @"浏览历史";
    [self.navigationController pushViewController:historyVC animated:YES];
}
/**
 *  block回调
 */
- (void)blockClick
{
    __weak typeof(self) weakself = self;
    
    self.studyView.mainBlock = ^(StudyCollectionView * stu,NSString * title)
    {
        StudyItemDetailViewController * studyDetailVC = [[StudyItemDetailViewController alloc]init];
        studyDetailVC.navigationItem.title =title;
        [weakself.navigationController pushViewController:studyDetailVC animated:YES];
    };
    self.studyView.subBlock = ^(StudyCollectionView * substu,NSString * subtitle)
    {
        StudyItemDetailViewController * studyDetailVC = [[StudyItemDetailViewController alloc]init];
        studyDetailVC.navigationItem.title =subtitle;
        [weakself.navigationController pushViewController:studyDetailVC animated:YES];
        
        
    };

}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    //DebugLog(@"滚动到了%ld",index);
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    DebugLog(@"点击到了%ld",index);
    BannerDetailViewController * bannerVC = [[BannerDetailViewController alloc]init];
    bannerVC.navigationItem.title = [NSString stringWithFormat:@"详情--%ld",index];
    [self.navigationController pushViewController:bannerVC animated:YES];

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
#pragma mark - TipViewDelegate
- (void)clickTipView:(TipView *)tipView withIndex:(NSInteger)index
{
    DebugLog(@"点击了哪个tip%ld",index);
    UIViewController * jackVC = nil;
    switch (index) {
        case 1000://点击了课程
        {
            jackVC = [[CourseViewController alloc]init];
            jackVC.navigationItem.title = @"课程";
            break;
        }
        case 1001:
        {
            jackVC = [[InformationViewController alloc]init];
            jackVC.navigationItem.title = @"资讯";
            break;
        }
        case 1002:
        {
            jackVC = [[SepcaillyViewController alloc]init];
            jackVC.navigationItem.title = @"专区";
            break;
        }
        case 1003:
        {
            jackVC = [[ClassViewController alloc]init];
            jackVC.navigationItem.title = @"班级";
            break;
        }
        case 1004:
        {
            jackVC = [[VoteViewController alloc]init];
            jackVC.navigationItem.title = @"投票";
            break;
        }
        default:
            break;
    }
    [self.navigationController pushViewController:jackVC animated:YES];
}
#pragma mark - StudyCollectionViewDelegate
//点击了网格的header
- (void)studyCollectionViewClickHederSection:(StudyCollectionView *)studyView withIndexPath:(NSIndexPath *)indexPath withHeaderData:(StudyItemModel *)headerData
{
    DebugLog(@"恭喜你点击了第%ld分区----%@内容",indexPath.section,headerData.header);
    UIViewController * jackVC = nil;

    switch (indexPath.section) {
        case 0:
        {
            jackVC = [[SepcaillyViewController alloc]init];
            jackVC.navigationItem.title = @"专区";

            break;
        }
        case 1:
        {
            jackVC = [[CourseViewController alloc]init];
            jackVC.navigationItem.title = @"课程";

            break;
        }
        case 2:
        {
            jackVC = [[InformationViewController alloc]init];
            jackVC.navigationItem.title = @"资讯";
            break;
        }
    
        default:
            break;
    }
  
    [self.navigationController pushViewController:jackVC animated:YES];
}

//点击了网格的item
- (void)studyCollectionViewClickItem:(StudyCollectionView *)studyView withIndexPath:(NSIndexPath *)indexPath withData:(StudyItem *)itemData
{
    DebugLog(@"恭喜你点击了第%ld分区----第%ld个-----%@内容",indexPath.section,indexPath.row,itemData.title);
    
    if (indexPath.section == 1 && indexPath.row == 1)
    {
        
    }
    else
    {
        StudyItemDetailViewController * studyDetailVC = [[StudyItemDetailViewController alloc]init];
        studyDetailVC.navigationItem.title = itemData.title;
        [self.navigationController pushViewController:studyDetailVC animated:YES];
    }
}
#pragma mark - 懒加载
- (NSArray *)imageDataArr
{
    if (_imageDataArr == nil) {
        _imageDataArr = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",nil];
    }
    return _imageDataArr;
}
- (UIScrollView *)bgScrollView
{
    if (_bgScrollView == nil) {
        _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
        self.bgScrollView.contentSize = CGSizeMake(ScreenWidth, 1415+64);
        self.bgScrollView.showsHorizontalScrollIndicator = NO;
        self.bgScrollView.backgroundColor = RGB_COLOR(249, 249, 249);
        self.bgScrollView.delegate = self;
    }
    return _bgScrollView;
}
- (void)didReceiveMemoryWarning {
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
