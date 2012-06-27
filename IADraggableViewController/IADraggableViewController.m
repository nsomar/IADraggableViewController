//
//  IADraggableViewController.m
//  AppleSlideView
//
//  Created by Omar Subhi on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import "IADraggableViewController.h"
#import "IADraggableAnimationManager.h"

@interface IADraggableViewController ()
{
    BOOL wasMoved;
    UIBarButtonItem *buttonItem;
}

- (void)setupMainView;
- (void)createMainView;
- (void) addDraggingViewToButton;

@property (strong, nonatomic) UIView *draggingView;
@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIView *behindView;
@property (strong, nonatomic) UIToolbar *toolBar;

@property (strong, nonatomic) UIBarButtonItem *draggingButton;
@end

@implementation IADraggableViewController
@synthesize rootViewController;
@synthesize toolBarHeight;
@synthesize draggingButtonPosition;

//Privates
@synthesize mainView;
@synthesize toolBar;
@synthesize behindView;
@synthesize draggingButton;
@synthesize secondViewController;
@synthesize draggingView = _draggingView;

- (id)initWithRootViewController:(UIViewController*)rootController
         andSecondViewController:(UIViewController*)secondController
{
    self = [super init];
    if (self) {
        self.rootViewController = rootController;
        self.secondViewController = secondController;
        self.toolBarHeight = TOOL_BAR_HEIGHT;
        self.draggingButtonPosition = IADraggableControllerToolbuttonLeft;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [self createMainView];
    [self setupMainView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect mainRect = self.view.bounds;
    
    self.mainView.frame = mainRect;
    self.behindView.frame = mainRect;
    
    CGRect rootFrame = mainRect;
    rootFrame.size.height -= toolBarHeight;
    self.rootViewController.view.frame = rootFrame;
    
    CGRect secondFrame = mainRect;
    secondFrame.size.height -= toolBarHeight;
    secondFrame.origin.y = toolBarHeight;
    self.secondViewController.view.frame = secondFrame;
    
    CGRect toolbarRect = self.view.bounds;
    toolbarRect.size.height = toolBarHeight;
    toolbarRect.origin.y = self.view.bounds.size.height - toolBarHeight;
    self.toolBar.frame = toolbarRect;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setupMainView
{
    
}

- (UIBarButtonItem*) createDraggableBarButton
{
    UIView *vvv = [[UIView alloc] init];
    vvv.frame = CGRectMake(0, 0, toolBarHeight, toolBarHeight);
    vvv.backgroundColor = [UIColor greenColor];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:vvv];
    draggingButton = barButton;
    return barButton;
}

- (UIBarButtonItem*) createFlexibleBarButton
{
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
                                                                                   target:nil
                                                                                   action:nil];
    
    return flexibleSpace;
}

- (void)createToolbar
{
    self.toolBar = [[UIToolbar alloc] init];
 
    self.draggingButton = [self createDraggableBarButton];
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    switch (draggingButtonPosition) {
        case IADraggableControllerToolbuttonLeft:
        {
            [items addObject:self.draggingButton];
        }
            break;
            
        case IADraggableControllerToolbuttonRight:
        {
            UIBarButtonItem *flexibleRight = [self createFlexibleBarButton];
            [items addObject:flexibleRight];
            [items addObject:self.draggingButton];
        }
            break;
            
        case IADraggableControllerToolbuttonCenter:
        {
            UIBarButtonItem *flexibleRight = [self createFlexibleBarButton];
            UIBarButtonItem *flexibleLeft = [self createFlexibleBarButton];
            [items addObject:flexibleLeft];
            [items addObject:self.draggingButton];
            [items addObject:flexibleRight];
        }
            break;
            
        default:
            break;
    }
    
    [self.toolBar setItems:items];
    [self addDraggingViewToButton];
}

- (void)createMainView
{
    self.view = [[UIView alloc] init];
    self.mainView = [[UIView alloc] init];
    self.behindView = [[UIView alloc] init];
    
    [self.view addSubview:behindView];
    [self.view addSubview:mainView];
    
    [self createToolbar];

    self.rootViewController.view.frame = mainView.frame;
    [mainView addSubview:self.rootViewController.view];  
    [mainView addSubview:toolBar];
    [behindView addSubview:self.secondViewController.view];  
}

- (BOOL)isDraggableButton:(UIEvent*)event
{
    NSSet *set = [event touchesForView:draggingButton.customView];
    return set.count > 0;
}

- (void)ensureBoundaries
{
    CGRect rect = mainView.frame;
    
    int minimumYPosition = toolBarHeight - rect.size.height;
    
    if (rect.origin.y < minimumYPosition) {
        rect.origin.y = minimumYPosition;
        mainView.frame = rect;
    }
    if(0 < rect.origin.y)
    {
        rect.origin.y = 0;
        mainView.frame = rect;        
    }
}

- (void)moveViewToFinalPosition
{    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGRect rect = mainView.frame;
    int yPosition = abs(rect.origin.y);
    int limitingPoint = abs(rect.size.height / 2);
    
    if (yPosition > limitingPoint) {
        rect.origin.y = toolBarHeight - rect.size.height;
    }
    else {
        rect.origin.y = 0;
    }
    
    mainView.frame = rect;
        
    [self ensureBoundaries];

    [UIView commitAnimations];
}

- (BOOL) isSecondViewVisible
{
    return mainView.frame.origin.y != 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![self isDraggableButton:event])
        return;
    
    wasMoved = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![self isDraggableButton:event])
        return;
    
    CGPoint point = [((UITouch*)[touches anyObject]) locationInView:self.view];
    int viewHeight = self.view.bounds.size.height;
    
    int touchDisplacementFromBellow = viewHeight - point.y;
    int lastYPosition = -touchDisplacementFromBellow + (toolBarHeight/2);
    CGRect rect = mainView.frame;
    rect.origin.y = lastYPosition;
    mainView.frame = rect;
    wasMoved = YES;
    
    [self ensureBoundaries];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![self isDraggableButton:event])
        return;
    
    if (!wasMoved) {
        if([self isSecondViewVisible]){
            [IADraggableAnimationManager animateViewDescending:mainView toHeight:toolBarHeight];
        }
        else {
            [IADraggableAnimationManager animateViewVerticalJump:mainView toHeight:toolBarHeight];
        }
    }
    else {
        [self moveViewToFinalPosition];
    }
}

- (void)setDraggingView:(UIView*)draggingView
{
    [self.draggingView removeFromSuperview];
    _draggingView = draggingView;
    [self addDraggingViewToButton];
}

- (void) addDraggingViewToButton
{
    self.draggingView.frame = draggingButton.customView.bounds;
    [draggingButton.customView addSubview:self.draggingView];
}

@end
