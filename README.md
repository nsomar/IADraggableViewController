IADraggableViewController
=========================

Create an apple iOS5 camera like View Controllers container 

*IDDraggableViewController* is a container type view controller like *UINavigationBarController* and *UITabBarController*

**How To Use It:**

**First:**

Initialize an instance of *IADraggableViewController*

	IADraggableViewController *draggableViewController = [[IADraggableViewController alloc]                                                    initWithRootViewController:self.viewController                                                   andSecondViewController:secondController];

**Second:**

Create a dragging view and add it to the draggable view controller

	UIView *draggingView = [[UIView alloc] init];
	draggingView.backgroundColor = [UIColor redColor];
    [self.draggableViewController setDraggingView:draggingView];
	
**Third (optional):**

Select the dragging button location

	draggableViewController.draggingButtonPosition = IADraggableControllerToolbuttonCenter;

**Forth (optional):**

Set the dragging tool bar height

	draggableViewController.toolBarHeight = 30;
	