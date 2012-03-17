//
//  KSIndicatorView.h
//  KSIndicator
//
//  Created by Chris Smith on 17.03.2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSIndicatorView : UIView

- (id) initWithString:(NSString *)string;
- (CGSize) calculateFrameSize;

@end
