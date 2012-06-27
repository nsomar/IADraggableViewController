//
//  IAAppDelegate.h
//  AppleSlideView
//
//  Created by Omar Abdelhafith on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IAViewController;
@class IADraggableViewController;

@interface IAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IAViewController *viewController;
@property (strong, nonatomic) IADraggableViewController *draggableViewController;

@end
