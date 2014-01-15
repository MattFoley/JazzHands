//
//  JZHAnimator.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAnimator.h"
#import "JZHAnimation.h"

@interface JZHAnimator ()

@property (nonatomic, strong) NSMutableArray *animations;

@end

@implementation JZHAnimator

- (id)init
{
    self = [super init];
    
    if (self) {
        self.animations = [NSMutableArray new];
    }
    
    return self;
}

- (void)animate:(NSInteger)time
{
    for (JZHAnimation *animation in self.animations) {
        [animation animate:time];
    }
}

- (void)addAnimation:(JZHAnimation *)animation
{
    [self.animations addObject:animation];
}

@end
