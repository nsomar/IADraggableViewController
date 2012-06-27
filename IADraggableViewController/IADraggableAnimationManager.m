//
//  IADraggableAnimationManager.m
//  AppleSlideView
//
//  Created by Omar Subhi on 6/23/12.
//  Copyright (c) 2012 Infusion Apps. All rights reserved.
//

#import "IADraggableAnimationManager.h"

@implementation IADraggableAnimationManager

+ (void) animateViewDescending:(UIView*)view toHeight:(float)height
{
    CGRect rect = view.frame;
    
    //For more info please refer to https://github.com/Infusion-apps/IASequenceAnimations
    AnimationBlock animationNumber1 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber2 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = -10;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber3 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber4 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = -5;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber5 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber6 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = -3;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber7 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };
    
    
    //For more info please refer to https://github.com/Infusion-apps/IASequenceAnimations
    IASequenceAnimations *sequence = [[IASequenceAnimations alloc] init];
    
    [sequence addAnimation:animationNumber1 
         duration:.35
             delay:0
     andAnimationID:nil];
    
    [sequence addAnimation:animationNumber2 
                  duration:.1
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber3
                  duration:.1
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber4
                  duration:.1
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber5
                  duration:.05
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber6
                  duration:.05
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber7
                  duration:.05
                     delay:0
            andAnimationID:nil];
    
    [sequence startAnimation];

}

+ (void) animateViewVerticalJump:(UIView*)view 
                        toHeight:(float)height
{
    CGRect rect = view.frame;
    rect.origin.y -= height;
    

    //For more info please refer to https://github.com/Infusion-apps/IASequenceAnimations
    AnimationBlock animationNumber1 = ^()
    {
         view.frame = rect;
    };
    
    AnimationBlock animationNumber2 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y += height;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber3 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = -5;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber4 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };

    AnimationBlock animationNumber5 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = -3;
        view.frame = internalRect;
    };
    
    AnimationBlock animationNumber6 = ^()
    {
        CGRect internalRect = rect;
        internalRect.origin.y = 0;
        view.frame = internalRect;
    };

    //For more info please refer to https://github.com/Infusion-apps/IASequenceAnimations
    IASequenceAnimations *sequence = [[IASequenceAnimations alloc] init];
    
    [sequence addAnimation:animationNumber1
                  duration:.2
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber2
                  duration:.2
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber3
                  duration:.05
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber4
                  duration:.1
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber5
                  duration:.05
                     delay:0
            andAnimationID:nil];
    
    [sequence addAnimation:animationNumber6
                  duration:.1
                     delay:0
            andAnimationID:nil];
    
    [sequence startAnimation];
}

@end
