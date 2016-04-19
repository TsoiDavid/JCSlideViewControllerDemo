//
//  JCContentViewController.h
//  JCSlideViewControllerDemo
//
//  Created by TsoiKaShing on 16/4/18.
//  Copyright © 2016年 Tosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JCContentViewDelegate <NSObject>

- (void)checkContentViewisSlide:(BOOL)isSlide;

@end

@interface JCContentViewController : UIViewController
@property (strong,nonatomic) id<JCContentViewDelegate> delegate;

@end
