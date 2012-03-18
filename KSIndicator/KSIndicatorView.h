//
//  KSIndicatorView.h
//  KSIndicator
//
//  Created by Chris Scianski on 17.03.2012.
//  Copyright (c) 2012 www.scianski.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSIndicatorView : UIView
{
    UILabel         *_label;
    UIEdgeInsets     _labelInsets;
}

@property (nonatomic, strong) UILabel       *label;
@property (nonatomic, assign) UIEdgeInsets   labelInsets;

- (CGSize) calculateFrameSize;

@end
