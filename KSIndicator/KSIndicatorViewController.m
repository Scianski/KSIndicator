//
//  KSIndicatorViewController.m
//  KSIndicator
//
//  Created by Chris Smith on 17.03.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSIndicatorViewController.h"
#import "KSIndicatorView.h"

@interface KSIndicatorViewController ()
{
    KSIndicatorView* _indicatorView;
}
@end

@implementation KSIndicatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _indicatorView = [[KSIndicatorView alloc] initWithFrame:CGRectZero];
    _indicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    _indicatorView = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark -
#pragma mark Indicator methods

- (IBAction)barButtonPressed:(UIButton *)sender
{
    CGPoint point = CGPointMake(roundf(sender.frame.origin.x + sender.frame.size.width / 2), sender.frame.origin.y - 5);
    _indicatorView.label.text = [NSString stringWithFormat:@"%.0f", sender.frame.size.height];
    [self showIndicatorAtPoint:point];
}

- (void) showIndicatorAtPoint:(CGPoint)point
{
    _indicatorView.alpha = 0.0;
    
    CGSize indicatorFrameSize = [_indicatorView calculateFrameSize];
    
    CGFloat indicatorYPosition = point.y - indicatorFrameSize.height;
    CGFloat indicatorXPosition = roundf(point.x - indicatorFrameSize.width / 2);
    
    _indicatorView.frame = CGRectMake(indicatorXPosition, indicatorYPosition, indicatorFrameSize.width, indicatorFrameSize.height);
    
    [self.view addSubview:_indicatorView];
    
    [UIView beginAnimations:@"opacity" context:nil];
    [UIView setAnimationDuration:.5];
    _indicatorView.alpha = 1.0;
    [UIView commitAnimations];
}

- (void) hideIndicatorAnimated:(BOOL)animated
{
    if (animated)
    {
        
        [UIView animateWithDuration:0.2f 
                              delay:0.0f 
                            options:UIViewAnimationOptionBeginFromCurrentState 
                         animations:^{
                             _indicatorView.alpha = 0;
                         } 
                         completion:^(BOOL completed){
                             [_indicatorView removeFromSuperview];
                             
                         }];  
    }
    else
    {
        [_indicatorView removeFromSuperview];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_indicatorView superview])
    {
        [self hideIndicatorAnimated:YES];
    }
}

@end
