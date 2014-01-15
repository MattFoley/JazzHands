//
//  JZHJazzHandsViewController.m
//  JazzHandsDemo
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "JZHJazzHandsViewController.h"

@interface JZHJazzHandsViewController ()

@property (strong, nonatomic) UIImageView *up;
@property (strong, nonatomic) UIImageView *down;
@property (strong, nonatomic) UIImageView *left;
@property (strong, nonatomic) UIImageView *right;

@property (strong, nonatomic) UILabel *lastLabel;

@end

@implementation JZHJazzHandsViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.scrollView.contentSize = CGSizeMake(
                                                 NUMBER_OF_PAGES * self.view.frame.size.width,
                                                 self.view.frame.size.height
                                                 );
        
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        [self placeViews];
        [self configureAnimation];
    }
    
    return self;
}

- (void)placeViews
{

    // put a up in the middle of page two, hidden
    self.up = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_tutorial_down_gem"]];
    self.up.center = self.view.center;
    self.up.frame = CGRectOffset(
                                      self.up.frame,
                                      self.view.frame.size.width,
                                      -100
                                      );
    self.up.alpha = 0.0f;
    [self.scrollView addSubview:self.up];
    
    // put a logo on top of it
    self.down = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_tutorial_down_gem.png"]];
    self.down.center = self.view.center;
    self.down.frame = CGRectOffset(
                                       self.down.frame,
                                       self.view.frame.size.width,
                                       -100
                                       );
    
    
    [self.scrollView addSubview:self.down];
    
    
    UILabel *firstPageText = [[UILabel alloc] init];
    firstPageText.text = @"Introducing Jazz Hands";
    [firstPageText sizeToFit];
    firstPageText.center = self.view.center;
    [self.scrollView addSubview:firstPageText];
    
    UILabel *secondPageText = [[UILabel alloc] init];
    secondPageText.text = @"Brought to you by JZH";
    [secondPageText sizeToFit];
    secondPageText.center = self.view.center;
    secondPageText.frame = CGRectOffset(secondPageText.frame, xForPage(2), 180);
    [self.scrollView addSubview:secondPageText];
    
    UILabel *thirdPageText = [[UILabel alloc] init];
    thirdPageText.text = @"Simple keyframe animations";
    [thirdPageText sizeToFit];
    thirdPageText.center = self.view.center;
    thirdPageText.frame = CGRectOffset(thirdPageText.frame, xForPage(3), -100);
    [self.scrollView addSubview:thirdPageText];
    
    UILabel *fourthPageText = [[UILabel alloc] init];
    fourthPageText.text = @"Optimized for scrolling intros";
    [fourthPageText sizeToFit];
    fourthPageText.center = self.view.center;
    fourthPageText.frame = CGRectOffset(fourthPageText.frame, xForPage(4), 0);
    [self.scrollView addSubview:fourthPageText];
    
    self.lastLabel = fourthPageText;
}

- (void)configureAnimation
{
    CGFloat dy = 0;
    
    JZHColorAnimation *bgColorAnimation = [JZHColorAnimation animationWithView:self.scrollView];
    [self.animator addAnimation:bgColorAnimation];
    [bgColorAnimation addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndColors:// number of keyframes to add
                                    4,
                                    
                                    // move 200 pixels to the right for parallax effect
                                    timeForPage(1), [UIColor blueColor],
                                    
                                    // move to initial frame on page 2 for parallax effect
                                    timeForPage(2), [UIColor greenColor],
                                    
                                    // move down and to the right between pages 2 and 3
                                    timeForPage(3), [UIColor yellowColor],
                                    
                                    // move back to initial position on page 4 for parallax effect
                                    timeForPage(4), [UIColor purpleColor]
                                    ]];
    // first, let's animate the down
    JZHFrameAnimation *downFrameAnimation = [JZHFrameAnimation animationWithView:self.down];
    [self.animator addAnimation:downFrameAnimation];
    
    [downFrameAnimation addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                                          // number of keyframes to add
                                          4,
                                          
                                          // move 200 pixels to the right for parallax effect
                                          timeForPage(1), CGRectOffset(self.down.frame, 200, 0),
                                          
                                          // move to initial frame on page 2 for parallax effect
                                          timeForPage(2), self.down.frame,
                                          
                                          // move down and to the right between pages 2 and 3
                                          timeForPage(3), CGRectOffset(self.down.frame, self.view.frame.size.width, dy),
                                          
                                          // move back to initial position on page 4 for parallax effect
                                          timeForPage(4), CGRectOffset(self.down.frame, 0, dy)
                                          ]];
    
    
    JZHAngleAnimation *downRotationAnimation = [JZHAngleAnimation animationWithView:self.down];
    [self.animator addAnimation:downRotationAnimation];
    // Rotate a full circle from page 2 to 3
    [downRotationAnimation addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndAngles:
                                             2,
                                             timeForPage(2), 0.0f, // Important to use 0f and not just 0, will be cast via double later
                                             timeForPage(3), 2 * M_PI]];
    
    
    // now, we animate the up
    JZHFrameAnimation *upFrameAnimation = [JZHFrameAnimation animationWithView:self.up];
    [self.animator addAnimation:upFrameAnimation];
    
    CGFloat ds = 0;
    
    // move down and to the right, and shrink between pages 2 and 3
    [upFrameAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(2) andFrame:self.up.frame]];
    [upFrameAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(3)
                                                                       andFrame:CGRectOffset(CGRectInset(self.up.frame, ds, ds), xForPage(2), dy)]];
    // fade the up in on page 2 and out on page 4
    JZHAlphaAnimation *upAlphaAnimation = [JZHAlphaAnimation animationWithView:self.up];
    [self.animator addAnimation:upAlphaAnimation];
    
    [upAlphaAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(1) andAlpha:0.0f]];
    [upAlphaAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(2) andAlpha:1.0f]];
    [upAlphaAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(3) andAlpha:1.0f]];
    [upAlphaAnimation addKeyFrame:[JZHAnimationKeyFrame keyFrameWithTime:timeForPage(4) andAlpha:0.0f]];
    
    //JZHHideAnimation *labelHideAnimation = [JZHHideAnimation animationWithView:self.lastLabel hideAt:timeForPage(4)];
    //[self.animator addAnimation:labelHideAnimation];
}

@end
