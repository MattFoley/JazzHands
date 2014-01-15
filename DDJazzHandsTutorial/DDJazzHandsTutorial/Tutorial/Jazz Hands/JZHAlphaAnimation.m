//
//  JZHAlphaAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAlphaAnimation.h"

@implementation JZHAlphaAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    JZHAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.alpha = animationFrame.alpha;
}

- (JZHAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(JZHAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(JZHAnimationKeyFrame *)endKeyFrame
{
    JZHAnimationFrame *animationFrame = [JZHAnimationFrame new];
    animationFrame.alpha = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.alpha
                                               endValue:endKeyFrame.alpha atTime:time];
    
    return animationFrame;
}

@end
