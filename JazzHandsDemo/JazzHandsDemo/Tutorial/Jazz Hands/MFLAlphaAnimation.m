//
//  MFLAlphaAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLAlphaAnimation.h"

@implementation MFLAlphaAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    MFLAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.alpha = animationFrame.alpha;
}

- (MFLAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(MFLAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(MFLAnimationKeyFrame *)endKeyFrame
{
    MFLAnimationFrame *animationFrame = [MFLAnimationFrame new];
    animationFrame.alpha = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.alpha
                                               endValue:endKeyFrame.alpha atTime:time];
    
    return animationFrame;
}

@end
