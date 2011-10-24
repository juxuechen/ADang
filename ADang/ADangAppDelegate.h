//
//  ADangAppDelegate.h
//  ADang
//
//  Created by chenyang on 10/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface ADangAppDelegate : NSObject <UIApplicationDelegate>{
	UIWindow *window;
	MainViewController *viewController;
	UINavigationController *navigationController;
}


@end