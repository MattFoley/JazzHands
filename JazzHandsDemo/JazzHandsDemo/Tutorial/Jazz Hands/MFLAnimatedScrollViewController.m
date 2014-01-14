//
//  MFLAnimatedScrollViewController.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "MFLAnimatedScrollViewController.h"

@implementation MFLAnimatedScrollViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.animator = [MFLAnimator new];
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        self.scrollView.delegate = self;
        [self.view addSubview:self.scrollView];
    }
    
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    [self.animator animate:aScrollView.contentOffset.x];
}

@end
