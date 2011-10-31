//
//  AppDelegate.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "PoiViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    [self setWindow: [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]];
    PoiViewController *viewController = [[[PoiViewController alloc] init] autorelease];    
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    [[self window] setRootViewController:navController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


@end
