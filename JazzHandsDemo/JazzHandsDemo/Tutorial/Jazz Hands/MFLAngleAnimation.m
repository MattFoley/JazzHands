//
//  MFLAngleAnimation.m
//  JazzHands
//
//  Created by Vahur Roosimaa on 12/7/13.
//

#import "MFLAngleAnimation.h"

@implementation MFLAngleAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    MFLAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.transform = CGAffineTransformMakeRotation(animationFrame.angle);

}

- (MFLAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(MFLAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(MFLAnimationKeyFrame *)endKeyFrame
{
    MFLAnimationFrame *animationFrame = [MFLAnimationFrame new];
    animationFrame.angle = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.angle
                                               endValue:endKeyFrame.angle atTime:time];

    return animationFrame;
}

@end
