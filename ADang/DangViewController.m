//
//  DangViewController.m
//  ADang
//
//  Created by chenyang on 10/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DangViewController.h"

@implementation DangViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
		self.title = @"我来咯～";
		self.view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:251.0f/255.0f blue:246.0f/255.0f alpha:1];
    }
    
    return self;
}

- (void)imageViewWithImageName:(NSString *)imageName Frame:(CGRect)frame{
	UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
	view.frame = frame;
	[self.view addSubview:view];
}

- (UIImageView *)imageViewWithImageName:(NSString *)imageName{
	UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
	view.frame = CGRectMake(0, 0, 120/1.5, 138/1.5);
	[self.view addSubview:view];
	return view;
}

- (void) viewDidLoad{
	[super viewDidLoad];
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	titleLabel.text = @"我来咯～";
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.font = [UIFont fontWithName:@"DFPWaWaW5" size:28.0f];
	self.navigationItem.titleView = titleLabel;
	
	[self imageViewWithImageName:@"ad.png" Frame:CGRectMake((320-77)/2, 130, 77, 64)];
	[self imageViewWithImageName:@"b.png" Frame:CGRectMake(160-10-60, 210, 60, 60)];
	[self imageViewWithImageName:@"g.png" Frame:CGRectMake(160+10, 210, 60, 60)];
	
	centersArray = [[NSMutableArray alloc] initWithObjects:
					nil];
	
	for (int i = 0; i < dotCount; i++) {
		[centersArray addObject:NSStringFromCGPoint(CGPointMake(160+120*cos(i*6.26/dotCount), 200+120*sin(i*6.26/dotCount)))];
	}
	
	view1 = [self imageViewWithImageName:@"1.png"];
	view2 = [self imageViewWithImageName:@"2.png"];
	view3 = [self imageViewWithImageName:@"3.png"];
	view4 = [self imageViewWithImageName:@"4.png"];
	view5 = [self imageViewWithImageName:@"5.png"];
	view1.center = CGPointFromString([centersArray objectAtIndex:0*dotCount/iconCount]);
	view2.center = CGPointFromString([centersArray objectAtIndex:1*dotCount/iconCount]);
	view3.center = CGPointFromString([centersArray objectAtIndex:2*dotCount/iconCount]);
	view4.center = CGPointFromString([centersArray objectAtIndex:3*dotCount/iconCount]);
	view5.center = CGPointFromString([centersArray objectAtIndex:4*dotCount/iconCount]);
	 
	int j = rand();
	gap = (j%100)/1000.;
	if (gap == 0.0f) {
		gap = 0.05f;
	}
	NSLog(@"gar %f",gap);
	[self performSelector:@selector(center) withObject:nil afterDelay:gap];
}

- (void)center{
	id obj = [centersArray objectAtIndex:0];
	[centersArray removeObjectAtIndex:0];
	[centersArray addObject:obj];
	
	[UIView beginAnimations:@"center" context:nil];
    [UIView setAnimationDuration:0.5f];
	view1.center = CGPointFromString([centersArray objectAtIndex:0*dotCount/iconCount]);
	view2.center = CGPointFromString([centersArray objectAtIndex:1*dotCount/iconCount]);
	view3.center = CGPointFromString([centersArray objectAtIndex:2*dotCount/iconCount]);
	view4.center = CGPointFromString([centersArray objectAtIndex:3*dotCount/iconCount]);
	view5.center = CGPointFromString([centersArray objectAtIndex:4*dotCount/iconCount]);
    [UIView commitAnimations];
	
	[self performSelector:@selector(center) withObject:nil afterDelay:gap];
}


@end
