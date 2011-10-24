//
//  MainViewController.m
//  ADang
//
//  Created by chenyang on 10/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

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

- (void)action:(id)sender {
	UIButton *btn = sender;
	NSLog(@"sender %d",btn.tag);
}

@end
