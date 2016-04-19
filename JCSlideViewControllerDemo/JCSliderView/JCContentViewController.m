//
//  JCContentViewController.m
//  JCSlideViewControllerDemo
//
//  Created by TsoiKaShing on 16/4/18.
//  Copyright © 2016年 Tosi. All rights reserved.
//

#import "JCContentViewController.h"

@interface JCContentViewController ()
@property (assign,nonatomic) BOOL isSlide;
@end

@implementation JCContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"nav = %@",self.navigationController);
    self.navigationController.title = @"主页面";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 40);
    [btn addTarget:self action:@selector(toleft) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    _isSlide = NO;
    
    // Do any additional setup after loading the view.
}
-(void)toleft{
    
    if([_delegate respondsToSelector:@selector(checkContentViewisSlide:)]){
       _isSlide = _isSlide == NO?YES:NO;
        [_delegate checkContentViewisSlide:_isSlide];
        
//        NSLog(@"isSlide == %d",_isSlide);
        
    }
    
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
