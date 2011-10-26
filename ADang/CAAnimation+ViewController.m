//
//  CAAnimation+ViewController.m
//  ADang
//
//  Created by chenyang on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CAAnimation+ViewController.h"


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

- (CAAnimationGroup *)animationGroupFor:(NSArray *)animations 
							   withView:(UIView *)view 
                               duration:(NSTimeInterval)duration 
							   delegate:(id)delegate 
                          startSelector:(SEL)startSelector 
						   stopSelector:(SEL)stopSelector
                                   name:(NSString *)name 
								   type:(NSString *)type {
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithArray:animations];
	group.delegate = self;
	group.duration = duration;
	group.removedOnCompletion = NO;
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[group setValue:view forKey:@"kFTAnimationTargetViewKey"];
	[group setValue:delegate forKey:@"kFTAnimationCallerDelegateKey"];
	
	[group setValue:name forKey:@"kFTAnimationName"];
	[group setValue:type forKey:@"kFTAnimationType"];
	return group;
}

#pragma mark - Popping Animations
- (void)popInRootController:(UINavigationController *)navigationController{
	CAAnimation *anim = [[FTAnimationManager sharedManager] popInAnimationFor:self.view duration:Duration];
	[navigationController.view.layer addAnimation:anim forKey:kFTAnimationPopIn];
	[navigationController pushViewController:self animated:YES];
	
	/*CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	scale.duration = duration;
	scale.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:.3f],
					[NSNumber numberWithFloat:1.25f],
					[NSNumber numberWithFloat:.75f],
					[NSNumber numberWithFloat:1.1f],
					[NSNumber numberWithFloat:.9f],
					[NSNumber numberWithFloat:1.f],
					nil];
	
	CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeIn.duration = duration * .4f;
	fadeIn.fromValue = [NSNumber numberWithFloat:0.f];
	fadeIn.toValue = [NSNumber numberWithFloat:1.f];
	fadeIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	fadeIn.fillMode = kCAFillModeForwards;
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:scale, fadeIn, nil]										 withView:self.view	
											 duration:duration 
											 delegate:nil 
										startSelector:nil 
										 stopSelector:nil 
												 name:@"kFTAnimationPopIn" 
												 type:@"kFTAnimationTypeIn"];
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[navigationController.view.layer addAnimation:group forKey:nil];
	 [navigationController pushViewController:self animated:YES];*/
}

- (void)popOutRootController:(UINavigationController *)navigationController{
	CAAnimation *anim = [[FTAnimationManager sharedManager] popOutAnimationFor:self.view duration:Duration];
	
	[self.view.layer addAnimation:anim forKey:kFTAnimationPopOut];
}

@end
