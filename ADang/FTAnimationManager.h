//
//  FTAnimationManager.h
//  ADang
//
//  Created by chenyang on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#pragma mark String Constants
extern NSString *const kFTAnimationName;
extern NSString *const kFTAnimationType;
extern NSString *const kFTAnimationTypeIn;
extern NSString *const kFTAnimationTypeOut;

extern NSString *const kFTAnimationSlideIn;
extern NSString *const kFTAnimationSlideOut;
extern NSString *const kFTAnimationBackOut;
extern NSString *const kFTAnimationBackIn;
extern NSString *const kFTAnimationFadeOut;
extern NSString *const kFTAnimationFadeIn;
extern NSString *const kFTAnimationFadeBackgroundOut;
extern NSString *const kFTAnimationFadeBackgroundIn;
extern NSString *const kFTAnimationPopIn;
extern NSString *const kFTAnimationPopOut;
extern NSString *const kFTAnimationFallIn;
extern NSString *const kFTAnimationFallOut;
extern NSString *const kFTAnimationFlyOut;

extern NSString *const kFTAnimationTargetViewKey;

@interface FTAnimationManager : NSObject

+ (FTAnimationManager *)sharedManager;

- (CAAnimation *)popInAnimationFor:(UIView *)view duration:(NSTimeInterval)duration;
- (CAAnimation *)popOutAnimationFor:(UIView *)view duration:(NSTimeInterval)duration;

- (CAAnimation *)fallInAnimationFor:(UIView *)view duration:(NSTimeInterval)duration;
- (CAAnimation *)fallOutAnimationFor:(UIView *)view duration:(NSTimeInterval)duration;

@end
