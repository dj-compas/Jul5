//
//  SplashView.m
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "SplashView.h"

@implementation SplashView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andDelegate:(id)viewDelegate
{
	parent = viewDelegate;
	return [self initWithFrame:frame];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	UIFont *font = [UIFont systemFontOfSize:72];
	NSString *msg = @"splash";
	[msg drawAtPoint:CGPointMake(0, 0) withFont:font];
}


@end
