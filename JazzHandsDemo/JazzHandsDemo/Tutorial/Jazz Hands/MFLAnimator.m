//
//  MFLAnimator.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLAnimator.h"
#import "MFLAnimation.h"

@interface MFLAnimator ()

@property (nonatomic, strong) NSMutableArray *animations;

@end

@implementation MFLAnimator

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
    for (MFLAnimation *animation in self.animations) {
        [animation animate:time];
    }
}

- (void)addAnimation:(MFLAnimation *)animation
{
    [self.animations addObject:animation];
}

@end
