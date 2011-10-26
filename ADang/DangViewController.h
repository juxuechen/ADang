//
//  DangViewController.h
//  ADang
//
//  Created by chenyang on 10/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define center1 CGPointMake(160+130*cos(1*6.26/5), 200+130*sin(1*6.26/5))
#define center2 CGPointMake(160+130*cos(2*6.26/5), 200+130*sin(2*6.26/5))
#define center3 CGPointMake(160+130*cos(3*6.26/5), 200+130*sin(3*6.26/5))
#define center4 CGPointMake(160+130*cos(4*6.26/5), 200+130*sin(4*6.26/5))
#define center5 CGPointMake(160+130*cos(5*6.26/5), 200+130*sin(5*6.26/5))
#define CW 1
#define CCW 2


#define dotCount 100 //100个点
#define iconCount 5//5个阿铛在转动

@interface DangViewController : UIViewController {
	UIImageView *view1;
	UIImageView *view2;
	UIImageView *view3;
	UIImageView *view4;
	UIImageView *view5;
	
	NSMutableArray *centersArray;
	float gap;
	int direction;
	
	NSString *type;
}

@property (nonatomic, retain) NSString *type;

@end
