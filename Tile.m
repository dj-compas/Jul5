//
//  Tile.m
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "Tile.h"
#import "MainView.h"

@implementation Tile

@synthesize cleared;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		
		// set gesture recognition
		swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpHandler)];
		
		swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer:swipeUp];
		
		
		
		cleared = NO;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andDelegate:(id)viewDelegate
{
	parent = viewDelegate;
	return [self initWithFrame:frame];
}

-(void) swipeUpHandler
{
	NSLog(@"swipeHandler");
	
	[parent increaseCount];
	
	cleared = YES;
	[self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	
	NSString *file = @"arrow.png";
	
	if (cleared) {
		file = @"arrow_green.png";
	}
	
	UIImage *img = [UIImage imageNamed:file];
	CGRect frame = self.bounds;
	[img drawInRect:frame];
	
}


@end
