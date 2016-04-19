//
//  JCRootViewController.h
//  JCSlideViewControllerDemo
//
//  Created by TsoiKaShing on 16/4/18.
//  Copyright © 2016年 Tosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JCContentViewController;
@class JCLeftTableViewController;
@interface JCRootViewController : UIViewController

- (instancetype)initWithContentViewController:(JCContentViewController *)contentViewController leftViewController:(JCLeftTableViewController *)leftViewController;
@end
