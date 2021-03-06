//
//  JCRootViewController.m
//  JCSlideViewControllerDemo
//
//  Created by TsoiKaShing on 16/4/18.
//  Copyright © 2016年 Tosi. All rights reserved.
//

#import "JCRootViewController.h"
#import "JCContentViewController.h"
#import "JCLeftTableViewController.h"

static const CGFloat contentViewSlidePercentOfWidth = 0.6;

@interface JCRootViewController ()<JCContentViewDelegate>
//装内容控制器的UIView
@property (strong,nonatomic) UIView *contentView;
//装左侧侧栏的UIView
@property (strong,nonatomic) UIView *leftView;
//内容控制器
@property (strong,nonatomic) JCContentViewController *contentViewController;
//左侧侧滑控制器
@property (strong,nonatomic) JCLeftTableViewController *leftViewController;
@end

@implementation JCRootViewController

- (instancetype)initWithContentViewController:(JCContentViewController *)contentViewController leftViewController:(JCLeftTableViewController *)leftViewController {
    if ((self = [super init]) && contentViewController != nil && leftViewController != nil) {

        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:contentViewController];
        contentViewController.delegate = self;
        _contentViewController = (id)nav;//类型强转换
//        _contentViewController.delegate = self;
        _leftViewController = leftViewController;
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setContentView];
}
- (void)setContentView {
    _contentView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_contentView];
    _contentViewController.view.frame = _contentView.frame;
    _contentView.backgroundColor = [UIColor yellowColor];
    //装载contentViewController的View
    [_contentView addSubview:_contentViewController.view];
//    [self addChildViewController:_contentViewController];
    
}
- (void)prepareLeftView {
    CGFloat leftViewH = self.view.frame.size.height * 0.8;
    CGFloat leftY = self.view.frame.size.height * 0.2;
    
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x, leftY, self.view.frame.size.width * contentViewSlidePercentOfWidth, leftViewH)];
    _leftView.alpha = 0;
    _leftViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width * contentViewSlidePercentOfWidth, self.view.frame.size.height);
    [self.view insertSubview:_leftView belowSubview:_contentView];
    [_leftView addSubview:_leftViewController.view];
    
}
#pragma mark contentViewControllerDelegate
- (void)checkContentViewisSlide:(BOOL)isSlide {
    
    self.contentView.frame.origin.x == 0?[self openSlideView]:[self closeSlideView];
}

- (void)openSlideView {
    [self prepareLeftView];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _leftView.frame = CGRectMake(0, 0, self.view.frame.size.width * contentViewSlidePercentOfWidth, self.view.frame.size.height);
        _leftView.alpha = 1;
        _contentView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width * contentViewSlidePercentOfWidth, 0);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)closeSlideView {
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGFloat leftViewH = self.view.frame.size.height * 0.8;
        CGFloat leftY = self.view.frame.size.height * 0.2;

        _leftView.frame = CGRectMake(self.view.center.x, leftY, self.view.frame.size.width * contentViewSlidePercentOfWidth, leftViewH);
        _leftView.alpha = 0;
        _contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [_leftView removeFromSuperview];
        [_leftViewController removeFromParentViewController];
        
    }];
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
