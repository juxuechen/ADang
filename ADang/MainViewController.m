//
//  MainViewController.m
//  ADang
//
//  Created by chenyang on 10/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DangViewController.h"
#import "CAAnimation+ViewController.h"

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
		self.title = @"返回";
		self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	float size = 70.0f;
	float gap = 20.0f;
	for (int i = 0; i<3; i++) {
		for (int j = 0; j<3; j++) {
			UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
			[btn setImage:[UIImage imageNamed:@"icon.png"] forState:UIControlStateNormal];
			[btn setImage:[UIImage imageNamed:@"press.png"] forState:UIControlStateHighlighted];
			btn.frame = CGRectMake((320-size*3-gap*2)/2+(size+gap)*i, (416-size*3-gap*2)/2+(size+gap)*j, 70., 70.);
			[self.view addSubview:btn];
			btn.tag = 3*i + j +1;
			[btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
		}
	}
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	titleLabel.text = @"阿铛转圈圈了";
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.font = [UIFont fontWithName:@"DFPWaWaW5" size:25.0f];
	self.navigationItem.titleView = titleLabel;
	
	UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 50)];
	label1.text = @"我是口碑阿铛喔！";
	label1.font = [UIFont fontWithName:@"Jkaton" size:20.0f];
	[self.view addSubview:label1];

	UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 336, 300, 50)];
	label2.text = @"想看我转圈？点我的九个兄弟们！";
	label2.textColor = [UIColor orangeColor];
	label2.font = [UIFont fontWithName:@"Jkaton" size:20.0f];
	[self.view addSubview:label2];
	
	UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(230, 10, 70, 60)];
	label3.text = @"吃喝玩乐行，口碑我最行！";
	label3.textColor = [UIColor purpleColor];
	label3.font = [UIFont fontWithName:@"DFPWaWaW5" size:16.0f];
	label3.numberOfLines = 0 ;
	[self.view addSubview:label3];
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

- (void)showZoomInController:(UIViewController *)controller {
	float duration = 1.0f;
	
	CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
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
	
	CAAnimationGroup *group = [self animationGroupFor:[NSArray arrayWithObjects:scale, fadeIn, nil]										 withView:controller.view	
											 duration:duration 
											 delegate:nil 
										startSelector:nil 
										 stopSelector:nil 
												 name:@"kFTAnimationPopIn" 
												 type:@"kFTAnimationTypeIn"];
	group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	
	[self.navigationController.view.layer addAnimation:group forKey:nil];
	[self.navigationController pushViewController:controller animated:YES];
}

- (void)action:(id)sender {
	UIButton *btn = sender;
	NSLog(@"sender %d",btn.tag);
	DangViewController *viewController = [[DangViewController alloc] init];
	switch (btn.tag) {
		case 1:
			[viewController publicCATransition:kCATransitionMoveIn SubType:kCATransitionFromLeft RootController:self.navigationController];
			break;
		case 2:
			[viewController publicCATransition:kCATransitionReveal SubType:kCATransitionFromBottom RootController:self.navigationController];
			break;	
		case 3:
			[viewController privateCATransition:kCATransitionCube RootController:self.navigationController];
			break;
		case 4:
			[viewController privateCATransition:kCATransitionSuckEffect RootController:self.navigationController];
			break;
		case 5:
			[viewController privateCATransition:kCATransitionOglFlip RootController:self.navigationController];
			break;
		case 6:
			[viewController privateCATransition:kCATransitionRippleEffect RootController:self.navigationController];
			break;
		case 7:
			[viewController privateCATransition:kCATransitionPageCurl RootController:self.navigationController];
			break;
		case 8:
			[viewController privateCATransition:kCATransitionCameraIrisHollowOpen RootController:self.navigationController];
			break;
		case 9:
			[self showZoomInController:viewController];
			break;
		default:
			break;
	}
}

@end
