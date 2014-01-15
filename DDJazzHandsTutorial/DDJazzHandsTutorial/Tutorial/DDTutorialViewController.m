//
//  DDTutorialViewController.m
//  JazzHandsDemo
//
//  Created by teejay on 1/14/14.
//  Copyright (c) 2014 IFTTT Inc. All rights reserved.
//

#import "DDTutorialViewController.h"

#define NUMBER_OF_PAGES 8

#define timeForPage(page) (NSInteger)(self.view.frame.size.width * (page - 1))
#define xForPage(page) timeForPage(page)

@interface DDTutorialViewController ()

@property (weak) IBOutlet UIImageView *up;
@property (weak) IBOutlet UIImageView *down;
@property (weak) IBOutlet UIImageView *left;
@property (weak) IBOutlet UIImageView *right;

@property (weak) IBOutlet UIImageView *pageOne;

@property (weak) IBOutlet UIView *upTextView;
@property (weak) IBOutlet UIView *downTextView;
@property (weak) IBOutlet UIView *leftTextView;
@property (weak) IBOutlet UIView *rightTextView;

@property (weak) IBOutlet UIView *pageTwo;
@property (weak) IBOutlet UIView *gemView;

@property (weak) IBOutlet UIScrollView *scrollView;

@end

@implementation DDTutorialViewController

- (void)viewDidLoad
{
    self.scrollView.contentSize = CGSizeMake(
                                             NUMBER_OF_PAGES * self.view.frame.size.width,
                                             self.view.frame.size.height
                                             );
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    [self structureTutorial];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@", [self.scrollView description]);
}

- (void)structureTutorial
{
    [self pageOneAnimations];
    [self pageTwoAnimations];
}

- (void)pageOneAnimations
{
    JZHFrameAnimation *infoSlideAway = [JZHFrameAnimation animationWithView:self.pageOne];
    [self.animator addAnimation:infoSlideAway];
    
    [infoSlideAway addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                                 // number of keyframes to add
                                 2,
                                 
                                 // Start position
                                 timeForPage(1), self.pageOne.frame,
                                 // Slide away.
                                 timeForPage(2), CGRectMake(self.pageOne.frame.size.width, 0, 0, self.pageOne.frame.size.height)
                                 ]];
}

- (void)pageTwoAnimations
{
    JZHFrameAnimation *infoSlideWith = [JZHFrameAnimation animationWithView:self.pageTwo];
    [self.animator addAnimation:infoSlideWith];
    
    [infoSlideWith addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                                 // number of keyframes to add
                                 2,
                                 
                                 // Start position
                                 timeForPage(2), self.pageTwo.frame,
                                 // Slide away.
                                 timeForPage(3), CGRectOffset(self.pageTwo.frame, [UIScreen mainScreen].bounds.size.width, 0)
                                 ]];
    
    JZHFrameAnimation *upSlideIn = [JZHFrameAnimation animationWithView:self.up];
    [self.animator addAnimation:upSlideIn];
    
    CGRect upSnapIn = CGRectOffset(self.up.frame, 0, 47);
    [upSlideIn addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                                 // number of keyframes to add
                                 4,
                                 
                                 // Start position
                                 timeForPage(2), self.up.frame,
                                 // Slide away
                                 timeForPage(3), upSnapIn,
                                 timeForPage(5), upSnapIn,
                                 timeForPage(6), CGRectOffset(upSnapIn, 0, -(self.pageTwo.frame.size.height/2 + 60))
                                 //timeForPage(3), self.up.frame
                                 ]];
    
    
    JZHFrameAnimation *downSlideIn = [JZHFrameAnimation animationWithView:self.down];
    [self.animator addAnimation:downSlideIn];
    
    CGRect downSnapIn = CGRectOffset(self.down.frame, 0, -47);
    [downSlideIn addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                              // number of keyframes to add
                              4,
                              
                              // Start position
                              timeForPage(2.2), self.down.frame,
                              // Slide away.
                              timeForPage(3), downSnapIn,
                               timeForPage(4), downSnapIn,
                               timeForPage(5), CGRectOffset(downSnapIn, 0, self.pageTwo.frame.size.height/2 + 60)
                              ]];
    
    
    JZHFrameAnimation *leftSlideIn = [JZHFrameAnimation animationWithView:self.left];
    [self.animator addAnimation:leftSlideIn];
    
    CGRect leftSnapIn = CGRectOffset(self.left.frame, 47, 0);
    [leftSlideIn addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                              // number of keyframes to add
                              4,
                              
                              // Start position
                              timeForPage(2.3), self.left.frame,
                              // Slide away.
                              timeForPage(3), leftSnapIn,
                              timeForPage(6), leftSnapIn,
                              timeForPage(7), CGRectOffset(leftSnapIn, -(self.pageTwo.frame.size.width/2 + 60), 0)
                              ]];
    
    JZHFrameAnimation *rightSlideIn = [JZHFrameAnimation animationWithView:self.right];
    [self.animator addAnimation:rightSlideIn];
    
    CGRect rightSnapIn = CGRectOffset(self.right.frame, -47, 0);
    [rightSlideIn addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                              // number of keyframes to add
                              4,
                              
                              // Start position
                              timeForPage(2.4), self.right.frame,
                              // Slide away.
                                timeForPage(3), rightSnapIn,
                                timeForPage(7), rightSnapIn,
                                timeForPage(8), CGRectOffset(rightSnapIn, self.pageTwo.frame.size.width/2 + 60, 0)
                              ]];
    
    
    
    JZHFrameAnimation *gemSlideDown = [JZHFrameAnimation animationWithView:self.gemView];
    [self.animator addAnimation:gemSlideDown];
    
    CGRect slideDownRect = CGRectMake(self.gemView.frame.origin.x,
                                      387,self.gemView.frame.size.width,
                                      self.gemView.frame.size.height);
    [gemSlideDown addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndFrames:
                              // number of keyframes to add
                              8,
                              
                              // Start position
                              timeForPage(2), self.gemView.frame,
                              // Slide away.
                              timeForPage(3), slideDownRect,
                                
                              timeForPage(3.8), CGRectOffset(slideDownRect, 320, -140),
                              timeForPage(4), CGRectOffset(slideDownRect, 320, -140),
                              timeForPage(5), CGRectOffset(slideDownRect, 640, -140),
                              timeForPage(6), CGRectOffset(slideDownRect, 960, -140),
                              timeForPage(7), CGRectOffset(slideDownRect, 1280, -140),
                              timeForPage(8), CGRectOffset(slideDownRect, 1600, -140),
                                timeForPage(9), CGRectOffset(slideDownRect, 1920, -140)
                              ]];
    
    JZHColorAnimation *bgColorAnimation = [JZHColorAnimation animationWithView:self.scrollView];
    [self.animator addAnimation:bgColorAnimation];
    [bgColorAnimation addKeyFrames:[JZHAnimationKeyFrame keyFramesWithTimesAndColors:// number of keyframes to add
                                    5,
                                    
                                    // move 200 pixels to the right for parallax effect
                                    timeForPage(4), UIColorFromRGB(0xfaa833),
                                    
                                    // move to initial frame on page 2 for parallax effect
                                    timeForPage(5), UIColorFromRGB(0xa2ce38),
                                    
                                    // move down and to the right between pages 2 and 3
                                    timeForPage(6), UIColorFromRGB(0xe51d6a),
                                    
                                    // move back to initial position on page 4 for parallax effect
                                    timeForPage(7), UIColorFromRGB(0x0092d6),
                                    
                                    timeForPage(8), UIColorFromRGB(0x000002)
                                    ]];
    
    
    
    //gem view, 64 from bottom of screen page, iPhone 5. So 32 iPhone 4?
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
