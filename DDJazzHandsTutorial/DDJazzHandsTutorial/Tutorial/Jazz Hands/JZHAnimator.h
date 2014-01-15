//
//  JZHAnimator.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAnimation.h"

@interface JZHAnimator : NSObject

- (void)addAnimation:(JZHAnimation *)animation;
- (void)animate:(NSInteger)time;

@end
