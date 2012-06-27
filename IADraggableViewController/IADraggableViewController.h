//
//  IADraggableViewController.h
//  AppleSlideView
//
//  Created by Omar Abdelhafith on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TOOL_BAR_HEIGHT 40

typedef enum
{
    IADraggableControllerToolbuttonLeft,
    IADraggableControllerToolbuttonCenter,
    IADraggableControllerToolbuttonRight, //Default
} DraggableButtonPosition;

#define AUTORESIZE_ALL     UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth

@interface IADraggableViewController : UIViewController

@property (strong, nonatomic) UIViewController *rootViewController;
@property (strong, nonatomic) UIViewController *secondViewController;
@property (nonatomic) float toolBarHeight;
@property (nonatomic) DraggableButtonPosition draggingButtonPosition;

- (void)setDraggingView:(UIView*)draggingView;
- (id)initWithRootViewController:(UIViewController*)rootController
         andSecondViewController:(UIViewController*)secondController;

@end
