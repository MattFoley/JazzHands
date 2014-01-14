//
//  MFLAnimator.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLAnimation.h"

@interface MFLAnimator : NSObject

- (void)addAnimation:(MFLAnimation *)animation;
- (void)animate:(NSInteger)time;

@end
