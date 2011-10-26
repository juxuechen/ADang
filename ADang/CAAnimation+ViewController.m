//
//  CAAnimation+ViewController.m
//  ADang
//
//  Created by chenyang on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CAAnimation+ViewController.h"
#import <QuartzCore/QuartzCore.h>


NSString *const kCATransitionCube = @"cube"; //立方体效果  
NSString *const kCATransitionSuckEffect = @"suckEffect"; //收缩效果，如一块布被抽走 
NSString *const kCATransitionOglFlip = @"oglFlip"; //上下翻转效果  
NSString *const kCATransitionRippleEffect = @"rippleEffect"; //滴水效果 
NSString *const kCATransitionPageCurl = @"pageCurl"; //向上翻一页   
NSString *const kCATransitionPageUnCurl = @"pageUnCurl"; //向下翻一页   
NSString *const kCATransitionCameraIrisHollowOpen = @"cameraIrisHollowOpen"; //相机盖打开
NSString *const kCATransitionCameraIrisHollowClose = @"cameraIrisHollowClose"; //相机盖关闭


@implementation UIViewController(CAAnimation_ViewController)

-(void)publicCATransition:(NSString *)type SubType:(NSString *)subtype RootController:(UINavigationController *)navigationController{
	CATransition *animation = [CATransition animation];
	animation.duration = 0.5f;
	//	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.type = type;
	animation.subtype = subtype;
	[navigationController.view.layer addAnimation:animation forKey:nil];
	[navigationController pushViewController:self animated:NO];
}

-(void)privateCATransition:(NSString *)type RootController:(UINavigationController *)navigationController{
	CATransition *animation = [CATransition animation];
	animation.duration = 0.5f;
	//	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.type = type;
	[navigationController.view.layer addAnimation:animation forKey:nil];
	[navigationController pushViewController:self animated:NO];
}

@end
