//
//  MFLFrameAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLFrameAnimation.h"

@implementation MFLFrameAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    MFLAnimationFrame *animationFrame = [self animationFrameForTime:time];

    // Store the current transform
    CGAffineTransform tempTransform = self.view.transform;

    // Reset rotation to 0 to avoid warping
    self.view.transform = CGAffineTransformMakeRotation(0);
    self.view.frame = animationFrame.frame;

    // Return to original transform
    self.view.transform = tempTransform;
}

- (MFLAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(MFLAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(MFLAnimationKeyFrame *)endKeyFrame
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

    MFLAnimationFrame *animationFrame = [MFLAnimationFrame new];
    animationFrame.frame = CGRectIntegral(frame);
    
    return animationFrame;
}

@end
