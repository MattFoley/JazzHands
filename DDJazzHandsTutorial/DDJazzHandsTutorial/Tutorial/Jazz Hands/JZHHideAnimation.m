//
//  JZHHideAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHHideAnimation.h"

@implementation JZHHideAnimation

+ (instancetype)animationWithView:(UIView *)view hideAt:(NSInteger)time
{
    JZHHideAnimation *animation = [[[self class] alloc] initWithView: view
                                                                hideAt: time];
    return animation;
}

+ (instancetype)animationWithView:(UIView *)view showAt:(NSInteger)time
{
    JZHHideAnimation *animation = [[[self class] alloc] initWithView: view
                                                                showAt: time];
    return animation;
}

- (id)initWithView:(UIView *)view hideAt:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.view = view;
        [self addKeyFrame:[[JZHAnimationKeyFrame alloc] initWithTime:time andHidden:NO]];
        [self addKeyFrame:[[JZHAnimationKeyFrame alloc] initWithTime:time + 1 andHidden:YES]];
    }
    
    return self;
}

- (id)initWithView:(UIView *)view showAt:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.view = view;
        [self addKeyFrame:[[JZHAnimationKeyFrame alloc] initWithTime:time andHidden:YES]];
        [self addKeyFrame:[[JZHAnimationKeyFrame alloc] initWithTime:time + 1 andHidden:NO]];
    }
    
    return self;
}

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    JZHAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.hidden = animationFrame.hidden;
}

- (JZHAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(JZHAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(JZHAnimationKeyFrame *)endKeyFrame
{
    JZHAnimationFrame *animationFrame = [JZHAnimationFrame new];
    animationFrame.hidden = (time == startKeyFrame.time ? startKeyFrame : endKeyFrame).hidden;    
    
    return animationFrame;
}

@end
