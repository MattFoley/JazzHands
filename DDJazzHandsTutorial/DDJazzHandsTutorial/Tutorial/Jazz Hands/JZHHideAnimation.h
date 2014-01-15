//
//  JZHHideAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHAnimation.h"

@interface JZHHideAnimation : JZHAnimation

+ (instancetype)animationWithView:(UIView *)view hideAt:(NSInteger)time;
+ (instancetype)animationWithView:(UIView *)view showAt:(NSInteger)time;

- (id)initWithView:(UIView *)view hideAt:(NSInteger)time;
- (id)initWithView:(UIView *)view showAt:(NSInteger)time;

@end
