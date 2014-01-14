//
//  MFLAnimatedScrollViewController.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLAnimator.h"

@interface MFLAnimatedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) MFLAnimator *animator;
@property (strong, nonatomic) UIScrollView *scrollView;

@end
