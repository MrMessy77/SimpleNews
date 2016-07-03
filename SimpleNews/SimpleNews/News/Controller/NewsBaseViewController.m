//
//  NewsBaseViewController.m
//  SimpleNews
//
//  Created by MrMessy on 16/6/29.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

#import "NewsBaseViewController.h"
#import "Common.h"

@interface NewsBaseViewController () <UIScrollViewDelegate>
/** 顶部标题滚动视图 */
@property (nonatomic, weak) UIScrollView *titleScrollView;
/** 内容滚动视图 */
@property (nonatomic, weak) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *titleBtnArray;
@end

@implementation NewsBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableArray *) titleBtnArray {
    if (!_titleBtnArray) {
        _titleBtnArray = [[NSMutableArray alloc] init];
    }
    return _titleBtnArray;
}

#pragma mark - 设置视图控件
- (void)prepare {
    [self setTitleScrollView];
    [self setTitleButtons];
    [self setContentScrollView];
}

#pragma mark 设置标题滚动视图
- (void)setTitleScrollView {
    UIScrollView *titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, MMScreenW, 35)];
    titleScrollView.backgroundColor = [UIColor whiteColor];
    
    CGFloat W = self.childViewControllers.count * MMScreenW / 4;
    titleScrollView.contentSize = CGSizeMake(W, 0);
    titleScrollView.showsHorizontalScrollIndicator = NO;
    titleScrollView.showsVerticalScrollIndicator = NO;
    titleScrollView.scrollsToTop = YES;
    [self.view addSubview:titleScrollView];
    self.titleScrollView = titleScrollView;
}

#pragma mark 设置标题按钮
- (void)setTitleButtons {
    for (int i=0; i < self.childViewControllers.count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((MMScreenW/4)*i, 0, MMScreenW/4, 35)];
        btn.tag = i;
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleScrollView addSubview:btn];
    }
}

#pragma mark 设置内容滚动视图
- (void)setContentScrollView
{
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.delegate = self;
    contentScrollView.frame = CGRectMake(0, 0, MMScreenW, MMScreenH);
    contentScrollView.backgroundColor = [UIColor whiteColor];
    
    CGFloat contentW = self.childViewControllers.count * MMScreenW;
    contentScrollView.contentSize = CGSizeMake(contentW, 0);
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.showsVerticalScrollIndicator = NO;
    contentScrollView.pagingEnabled = YES;
    [self.view addSubview:contentScrollView];
    self.contentScrollView = contentScrollView;
}

- (void) clickTitleBtn:(UIButton *)sender {
}

#pragma mark - UIScrollViewDelegate
-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
}
@end
