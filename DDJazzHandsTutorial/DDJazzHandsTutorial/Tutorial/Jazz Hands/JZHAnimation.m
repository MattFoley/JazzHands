//
//  JZHAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAnimation.h"

@interface JZHAnimation ()

@property (strong, nonatomic) NSMutableArray *timeline; // JZHAnimationFrames
@property (assign, nonatomic) NSInteger startTime; // in case timeline starts before t=0

@end

@implementation JZHAnimation

+ (instancetype)animationWithView:(UIView *)view
{
    JZHAnimation *animation = [[[self class] alloc] initWithView:view];
    return animation;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.keyFrames = [NSMutableArray new];
        self.timeline = [NSMutableArray new];
        self.startTime = 0;
    }
    
    return self;
}

- (id)initWithView:(UIView *)view
{
    self = [self.class new];
    self.view = view;
    return self;
}

- (void)addKeyFrames:(NSArray *)keyFrames
{
    for (JZHAnimationKeyFrame *keyFrame in keyFrames) {
        [self addKeyFrame:keyFrame];
    }
}

- (void)addKeyFrame:(JZHAnimationKeyFrame *)keyFrame
{
    if (self.keyFrames.count == 0) {
        [self.keyFrames addObject:keyFrame];
        return;
    }

    // because folks might add keyframes out of order, we have to sort here
    if (keyFrame.time > ((JZHAnimationKeyFrame *)self.keyFrames.lastObject).time) {
        [self.keyFrames addObject:keyFrame];
    } else {
        for (NSInteger i = 0; i < self.keyFrames.count; i++) {
            if (keyFrame.time < ((JZHAnimationKeyFrame *)[self.keyFrames objectAtIndex:i]).time) {
                [self.keyFrames insertObject:keyFrame atIndex:i];
                break;
            }
        }
    }
    
    self.timeline = [NSMutableArray new];
    for (NSInteger i = 0; i < self.keyFrames.count - 1; i++) {
        JZHAnimationKeyFrame *keyFrame = [self.keyFrames objectAtIndex:i];
        JZHAnimationKeyFrame *nextKeyFrame = [self.keyFrames objectAtIndex:i+1];
        
        for (NSInteger j = keyFrame.time; j <= nextKeyFrame.time; j++) {
            [self.timeline addObject:[self frameForTime:j startKeyFrame:keyFrame endKeyFrame:nextKeyFrame]];
        }
    }
    
    self.startTime = ((JZHAnimationKeyFrame *)[self.keyFrames objectAtIndex:0]).time;
}

- (JZHAnimationFrame *)animationFrameForTime:(NSInteger)time
{
    if (time < self.startTime) {
        return [self.timeline objectAtIndex:0];
    }

    if (time - self.startTime < self.timeline.count) {
        return [self.timeline objectAtIndex:time - self.startTime];
    }

    return [self.timeline lastObject];
}

- (void)animate:(NSInteger)time
{
    NSLog(@"Hey pal! You need to use a subclass of JZHAnimation.");
}

- (JZHAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(JZHAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(JZHAnimationKeyFrame *)endKeyFrame
{
    NSLog(@"Hey pal! You need to use a subclass of JZHAnimation.");
    return startKeyFrame;
}

- (CGFloat)tweenValueForStartTime:(NSInteger)startTime
                          endTime:(NSInteger)endTime
                       startValue:(CGFloat)startValue
                         endValue:(CGFloat)endValue
                           atTime:(CGFloat)time
{
    CGFloat dt = (endTime - startTime);
    CGFloat timePassed = (time - startTime);
    CGFloat dv = (endValue - startValue);
    CGFloat vv = dv / dt;
   
    if (isnan((timePassed * vv) + startValue)) {
        NSLog(@"nan");
    }
    
    return (timePassed * vv) + startValue;
}

@end
