//
//  KSIndicatorView.m
//  KSIndicator
//
//  Created by Chris Smith on 17.03.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KSIndicatorView.h"

#define LABEL_LEFT_MARGIN 7.0
#define LABEL_RIGHT_MARGIN 7.0
#define LABEL_TOP_MARGIN 3.0
#define LABEL_BOTTOM_MARGIN 3.0

#define INDICATOR_HEIGHT 32
#define ARROW_HEIGHT 8
#define ARROW_WIDTH 8
#define SHADOW_BOTTOM_SPACE 2

@interface KSIndicatorView ()
{
	UILabel                 *_label;
}

@end

@implementation KSIndicatorView

- (id) initWithString:(NSString *)string
{
    self = [super initWithFrame:CGRectZero];
    { 
        self.opaque = NO;
        
        _label = [[UILabel alloc] init];
        _label.text = string;
        
        _label.textColor = [UIColor whiteColor];
        _label.shadowColor = [UIColor blackColor];
        _label.shadowOffset = CGSizeMake(0.0, -1);
        _label.font = [UIFont boldSystemFontOfSize:14.0];
        _label.minimumFontSize = 10.0;
        _label.adjustsFontSizeToFitWidth = YES;
        _label.textAlignment = UITextAlignmentCenter;
        _label.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
    }
    return  self;
}

-(CGSize)calculateFrameSize
{
    CGSize labelSize = [_label.text sizeWithFont:_label.font];
    return CGSizeMake(round(LABEL_LEFT_MARGIN + labelSize.width + LABEL_RIGHT_MARGIN), INDICATOR_HEIGHT);
}

-(void)layoutSubviews
{

    CGSize labelSize = [_label.text sizeWithFont:_label.font];
    NSInteger x = roundf(self.bounds.size.width / 2 - labelSize.width / 2);
    _label.frame = CGRectMake(x, (self.bounds.size.height - ARROW_HEIGHT - SHADOW_BOTTOM_SPACE) / 2 - labelSize.height / 2, labelSize.width, labelSize.height);
}

- (void)drawPopoverShapeWith:(CGRect)rect context:(CGContextRef)context
{
    CGFloat radius = 4;
    
    CGRect bodyRect = rect;
    bodyRect.size.height = rect.size.height - ARROW_HEIGHT - SHADOW_BOTTOM_SPACE;
    
    CGFloat minx = CGRectGetMinX(bodyRect), midx = CGRectGetMidX(bodyRect), maxx = CGRectGetMaxX(bodyRect);
	CGFloat miny = CGRectGetMinY(bodyRect), midy = CGRectGetMidY(bodyRect), maxy = CGRectGetMaxY(bodyRect);
	CGContextSaveGState(context);
	CGMutablePathRef path = CGPathCreateMutable();
    
	CGPathMoveToPoint(path, NULL, minx, midy);
    CGPathAddArcToPoint(path, NULL, minx, miny, midx, miny, radius);
	CGPathAddArcToPoint(path, NULL, maxx, miny, maxx, midy, radius);
    CGPathAddArcToPoint(path, NULL, maxx, maxy, midx, maxy, radius);
    
    CGPathAddLineToPoint(path, NULL, midx + ARROW_WIDTH, maxy);
    CGPathAddLineToPoint(path, NULL, midx, rect.size.height - SHADOW_BOTTOM_SPACE);
    CGPathAddLineToPoint(path, NULL, midx - ARROW_WIDTH, maxy);
    
	CGPathAddArcToPoint(path, NULL, minx, maxy, minx, midy, radius);
    
	CGPathCloseSubpath(path);
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.0 alpha:0.6].CGColor);
	CGContextAddPath(context, path);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 2, [UIColor colorWithWhite:0.0 alpha:0.6].CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);    
    
    CFRelease(path);
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawPopoverShapeWith:rect context:context];
    
}

@end
