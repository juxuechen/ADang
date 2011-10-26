//
//  FTAnimationManager.m
//  ADang
//
//  Created by chenyang on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FTAnimationManager.h"


NSString *const kFTAnimationName = @"kFTAnimationName";
NSString *const kFTAnimationType = @"kFTAnimationType";
NSString *const kFTAnimationTypeIn = @"kFTAnimationTypeIn";
NSString *const kFTAnimationTypeOut = @"kFTAnimationTypeOut";

NSString *const kFTAnimationSlideOut = @"kFTAnimationNameSlideOut";
NSString *const kFTAnimationSlideIn = @"kFTAnimationNameSlideIn";
NSString *const kFTAnimationBackOut = @"kFTAnimationNameBackOut";
NSString *const kFTAnimationBackIn = @"kFTAnimationNameBackIn";
NSString *const kFTAnimationFadeOut = @"kFTAnimationFadeOut";
NSString *const kFTAnimationFadeIn = @"kFTAnimationFadeIn";
NSString *const kFTAnimationFadeBackgroundOut = @"kFTAnimationFadeBackgroundOut";
NSString *const kFTAnimationFadeBackgroundIn = @"kFTAnimationFadeBackgroundIn";
NSString *const kFTAnimationPopIn = @"kFTAnimationPopIn";
NSString *const kFTAnimationPopOut = @"kFTAnimationPopOut";
NSString *const kFTAnimationFallIn = @"kFTAnimationFallIn";
NSString *const kFTAnimationFallOut = @"kFTAnimationFallOut";
NSString *const kFTAnimationFlyOut = @"kFTAnimationFlyOut";

NSString *const kFTAnimationCallerDelegateKey = @"kFTAnimationCallerDelegateKey";
NSString *const kFTAnimationCallerStartSelectorKey = @"kFTAnimationCallerStartSelectorKey";
NSString *const kFTAnimationCallerStopSelectorKey = @"kFTAnimationCallerStopSelectorKey";
NSString *const kFTAnimationTargetViewKey = @"kFTAnimationTargetViewKey";
NSString *const kFTAnimationIsChainedKey = @"kFTAnimationIsChainedKey";
NSString *const kFTAnimationNextAnimationKey = @"kFTAnimationNextAnimationKey";
NSString *const kFTAnimationPrevAnimationKey = @"kFTAnimationPrevAnimationKey";
NSString *const kFTAnimationWasInteractionEnabledKey = @"kFTAnimationWasInteractionEnabledKey";



@implementation FTAnimationManager

#pragma mark Singleton

static FTAnimationManager *sharedAnimationManager = nil;

+ (FTAnimationManager *)sharedManager {
	@synchronized(self) {
		if (sharedAnimationManager == nil) {
			sharedAnimationManager = [[self alloc] init];
		}
	}
	return sharedAnimationManager;
}

#pragma mark -
#pragma mark Utility Methods
- (CAAnimationGroup *)animationGroupFor:(NSArray *)animations withView:(UIView *)view 
                               duration:(NSTimeInterval)duration delegate:(id)delegate 
                          startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
                                   name:(NSString *)name type:(NSString *)type {
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithArray:animations];
	group.delegate = self;
	group.duration = duration;
	group.removedOnCompletion = NO;
	if([type isEqualToString:kFTAnimationTypeOut]) {
		group.fillMode = kCAFillModeBoth;
	}
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[group setValue:view forKey:kFTAnimationTargetViewKey];
	[group setValue:delegate forKey:kFTAnimationCallerDelegateKey];
	if(!startSelector) {
		startSelector = @selector(animationDidStart:);
	}
	[group setValue:NSStringFromSelector(startSelector) forKey:kFTAnimationCallerStartSelectorKey];
	if(!stopSelector) {
		stopSelector = @selector(animationDidStop:finished:);
	}
	[group setValue:NSStringFromSelector(stopSelector) forKey:kFTAnimationCallerStopSelectorKey];
	[group setValue:name forKey:kFTAnimationName];
	[group setValue:type forKey:kFTAnimationType];
	return group;
}

#pragma mark -
#pragma mark Pop Animation Builders
- (CAAnimation *)popInAnimationFor:(UIView *)view duration:(NSTimeInterval)duration {
	CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	scale.duration = duration;
	scale.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:.3f],
					[NSNumber numberWithFloat:1.2f],
					[NSNumber numberWithFloat:.85f],
					[NSNumber numberWithFloat:1.f],
					nil];
	
	CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeIn.duration = duration * .4f;
	fadeIn.fromValue = [NSNumber numberWithFloat:0.f];
	fadeIn.toValue = [NSNumber numberWithFloat:1.f];
	fadeIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	fadeIn.fillMode = kCAFillModeForwards;
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:scale, fadeIn, nil]						   withView:view duration:duration 
											 delegate:nil 
										startSelector:nil 
										 stopSelector:nil 
												 name:kFTAnimationPopIn 
												 type:kFTAnimationTypeIn];
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	return group;
}

- (CAAnimation *)popOutAnimationFor:(UIView *)view duration:(NSTimeInterval)duration{
	CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	scale.duration = duration;
	scale.removedOnCompletion = NO;
	scale.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.f],
					[NSNumber numberWithFloat:.75f],
					[NSNumber numberWithFloat:1.2f],
					[NSNumber numberWithFloat:.3f],
					nil];
	
	CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeOut.duration = duration * .4f;
	fadeOut.fromValue = [NSNumber numberWithFloat:1.f];
	fadeOut.toValue = [NSNumber numberWithFloat:0.f];
	fadeOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	fadeOut.beginTime = duration * .6f;
	fadeOut.fillMode = kCAFillModeBoth;
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:scale, fadeOut, nil] 
						  withView:view duration:duration 
						  delegate:nil 
					 startSelector:nil 
					  stopSelector:nil 
							  name:kFTAnimationPopOut 
							  type:kFTAnimationTypeOut];
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	return group;
}

#pragma mark -
#pragma mark Fall In and Fly Out Builders
- (CAAnimation *)fallInAnimationFor:(UIView *)view duration:(NSTimeInterval)duration{
	
	CABasicAnimation *fall = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	fall.fromValue = [NSNumber numberWithFloat:2.f];
	fall.toValue = [NSNumber numberWithFloat:1.f];
	fall.duration = duration;
	
	CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fade.fromValue = [NSNumber numberWithFloat:0.f];
	fade.toValue = [NSNumber numberWithFloat:1.f];
	fade.duration = duration;
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:fall, fade, nil] 
											 withView:view duration:duration 
											 delegate:nil 
										startSelector:nil 
										 stopSelector:nil 
												 name:kFTAnimationFallIn 
												 type:kFTAnimationTypeIn];
	return group;
}

- (CAAnimation *)fallOutAnimationFor:(UIView *)view duration:(NSTimeInterval)duration{
	
	CABasicAnimation *fall = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	fall.fromValue = [NSNumber numberWithFloat:1.f];
	fall.toValue = [NSNumber numberWithFloat:.15f];
	fall.duration = duration;
	
	CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fade.fromValue = [NSNumber numberWithFloat:1.f];
	fade.toValue = [NSNumber numberWithFloat:0.f];
	fade.duration = duration;
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:fall, fade, nil] 
											 withView:view duration:duration 
											 delegate:nil 
										startSelector:nil 
										 stopSelector:nil 
												 name:kFTAnimationFallOut 
												 type:kFTAnimationTypeOut];
	return group;
}

@end
