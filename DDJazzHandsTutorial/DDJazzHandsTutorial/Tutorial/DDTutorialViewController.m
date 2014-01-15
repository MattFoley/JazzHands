//
//  DDTutorialViewController.m
//  JazzHandsDemo
//
//  Created by teejay on 1/14/14.
//  Copyright (c) 2014 IFTTT Inc. All rights reserved.
//

#import "DDTutorialViewController.h"

#define NUMBER_OF_PAGES 6

#define timeForPage(page) (NSInteger)(self.view.frame.size.width * (page - 1))
#define xForPage(page) timeForPage(page)

@interface DDTutorialViewController ()

@property (weak) IBOutlet UIImageView *up;
@property (weak) IBOutlet UIImageView *down;
@property (weak) IBOutlet UIImageView *left;
@property (weak) IBOutlet UIImageView *right;

@property (strong, nonatomic) UILabel *lastLabel;

@property (weak) IBOutlet UIScrollView *scrollView;

@end

@implementation DDTutorialViewController

- (void)placeViews
{
    
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
    
    JZHHideAnimation *labelHideAnimation = [JZHHideAnimation animationWithView:self.lastLabel hideAt:timeForPage(4)];
    [self.animator addAnimation:labelHideAnimation];
}
@end
