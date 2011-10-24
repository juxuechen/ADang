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

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
		self.title = @"阿铛诈尸了";
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
}

-(void)showTypeAnimation:(NSString *)type withSubType:(NSString *)subtype pushController:(UIViewController *)controller{
	CATransition *animation = [CATransition animation];
	animation.duration = 0.5f;
	//	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.type = type;
	animation.subtype = subtype;
	[self.navigationController.view.layer addAnimation:animation forKey:nil];
	if ([subtype length]) {
		[self.navigationController pushViewController:controller animated:YES];
	}
	else {
		[self.navigationController pushViewController:controller animated:NO];
	}
}

- (void)action:(id)sender {
	UIButton *btn = sender;
	NSLog(@"sender %d",btn.tag);
	DangViewController *viewController = [[DangViewController alloc] init];
	switch (btn.tag) {
		case 1:
			[self showTypeAnimation:kCATransitionMoveIn withSubType:kCATransitionFromLeft pushController:viewController];
			break;
		case 2:
			[self showTypeAnimation:kCATransitionFade withSubType:kCATransitionFromRight
					 pushController:viewController];
			break;	
		case 3:
			[self showTypeAnimation:@"cube" withSubType:nil pushController:viewController];
			break;
		case 4:
			[self showTypeAnimation:@"suckEffect" withSubType:nil pushController:viewController];
			break;
		case 5:
			[self showTypeAnimation:@"oglFlip" withSubType:nil pushController:viewController];
			break;
		case 6:
			[self showTypeAnimation:@"rippleEffect" withSubType:nil pushController:viewController];
			break;
		case 7:
			[self showTypeAnimation:@"pageCurl" withSubType:nil pushController:viewController];
			break;
		case 8:
			[self showTypeAnimation:@"cameraIrisHollowOpen " withSubType:nil pushController:viewController];
			break;
		case 9:
			[self showTypeAnimation:kCATransitionReveal	withSubType:kCATransitionFromTop pushController:viewController];
			break;
		default:
			break;
	}
}

@end
