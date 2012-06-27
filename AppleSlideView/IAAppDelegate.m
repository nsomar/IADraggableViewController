//
//  IAAppDelegate.m
//  AppleSlideView
//
//  Created by Omar Abdelhafith on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import "IAAppDelegate.h"

#import "IAViewController.h"
#import "IADraggableViewController.h"

@implementation IAAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize draggableViewController = _draggableViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[IAViewController alloc] initWithNibName:@"IAViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[IAViewController alloc] initWithNibName:@"IAViewController_iPad" bundle:nil];
    }
    
    UIViewController *secondController = [[UIViewController alloc] initWithNibName:@"IASecondViewConroller" bundle:nil];
    
    //Create the Draggable View Controller
    //Pass in the RootViewController and the Second View Controller
    self.draggableViewController = [[IADraggableViewController alloc] 
                                    initWithRootViewController:self.viewController
                                    andSecondViewController:secondController];

    //Create the dragging view
    UIView *draggingView = [[UIView alloc] init];
    draggingView.backgroundColor = [UIColor redColor];
    
    //Set the dragging view
    [self.draggableViewController setDraggingView:draggingView];
    
    //Set the button position
    self.draggableViewController.draggingButtonPosition = IADraggableControllerToolbuttonCenter;
    
    //Set the tool bar height
    self.draggableViewController.toolBarHeight = 30;
    
    self.window.rootViewController = self.draggableViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
