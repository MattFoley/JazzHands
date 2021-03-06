//
//  JZHAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAnimationKeyFrame.h"

@interface JZHAnimation : NSObject

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) NSMutableArray *keyFrames;

+ (instancetype)animationWithView:(UIView *)view;

- (id)initWithView:(UIView *)view;

- (void)animate:(NSInteger)time;

- (void)addKeyFrames:(NSArray *)keyFrames;
- (void)addKeyFrame:(JZHAnimationKeyFrame *)keyFrame;

- (JZHAnimationFrame *)animationFrameForTime:(NSInteger)time;
- (CGFloat)tweenValueForStartTime:(NSInteger)startTime
                          endTime:(NSInteger)endTime
                       startValue:(CGFloat)startValue
                         endValue:(CGFloat)endValue
                           atTime:(CGFloat)time;

@end
