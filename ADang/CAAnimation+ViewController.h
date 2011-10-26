//
//  CAAnimation+ViewController.h
//  ADang
//
//  Created by chenyang on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FTAnimationManager.h"

extern NSString *const kCATransitionCube; //立方体效果 
extern NSString *const kCATransitionSuckEffect; //收缩效果，如一块布被抽走  
extern NSString *const kCATransitionOglFlip; //上下翻转效果
extern NSString *const kCATransitionRippleEffect; //滴水效果 
extern NSString *const kCATransitionPageCurl; //向上翻一页   
extern NSString *const kCATransitionPageUnCurl; //向下翻一页   
extern NSString *const kCATransitionCameraIrisHollowOpen; //相机盖打开
extern NSString *const kCATransitionCameraIrisHollowClose; //相机盖关闭

@interface UIViewController(CAAnimation_ViewController)

/*
 kCATransitionFade;
 kCATransitionMoveIn;
 kCATransitionPush;
 kCATransitionReveal;
 */
/*
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 */
- (void)publicCATransition:(NSString *)type SubType:(NSString *)subtype RootController:(UINavigationController *)navigationController;

- (void)privateCATransition:(NSString *)type RootController:(UINavigationController *)navigationController;


- (void)popInRootController:(UINavigationController *)navigationController;
- (void)popOutRootController:(UINavigationController *)navigationController;

@end
