//
//  JZHAngleAnimation.m
//  JazzHands
//
//  Created by Vahur Roosimaa on 12/7/13.
//

#import "JZHAngleAnimation.h"

@implementation JZHAngleAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    JZHAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.transform = CGAffineTransformMakeRotation(animationFrame.angle);

}

- (JZHAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(JZHAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(JZHAnimationKeyFrame *)endKeyFrame
{
    JZHAnimationFrame *animationFrame = [JZHAnimationFrame new];
    animationFrame.angle = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.angle
                                               endValue:endKeyFrame.angle atTime:time];

    return animationFrame;
}

@end
