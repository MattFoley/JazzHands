//
//  JZHFrameAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHFrameAnimation.h"

@implementation JZHFrameAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    JZHAnimationFrame *animationFrame = [self animationFrameForTime:time];

    // Store the current transform
    CGAffineTransform tempTransform = self.view.transform;

    // Reset rotation to 0 to avoid warping
    self.view.transform = CGAffineTransformIdentity;
    self.view.frame = animationFrame.frame;

    // Return to original transform
    self.view.transform = tempTransform;
}

- (JZHAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(JZHAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(JZHAnimationKeyFrame *)endKeyFrame
{
    NSInteger startTime = startKeyFrame.time;
    NSInteger endTime = endKeyFrame.time;
    CGRect startLocation = startKeyFrame.frame;
    CGRect endLocation = endKeyFrame.frame;
    
    CGRect frame = self.view.frame;
    frame.origin.x = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetMinX(startLocation) endValue:CGRectGetMinX(endLocation) atTime:time];
    frame.origin.y = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetMinY(startLocation) endValue:CGRectGetMinY(endLocation) atTime:time];
    frame.size.width = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetWidth(startLocation) endValue:CGRectGetWidth(endLocation) atTime:time];
    frame.size.height = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetHeight(startLocation) endValue:CGRectGetHeight(endLocation) atTime:time];

    JZHAnimationFrame *animationFrame = [JZHAnimationFrame new];
    animationFrame.frame = CGRectIntegral(frame);
    
    if (isnan(animationFrame.frame.origin.x )) {
        NSLog(@"nan");
    }
    return animationFrame;
}

@end
