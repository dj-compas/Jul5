//
//  Tile.m
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize cleared;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		
		// set gesture recognition
		UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUpHandler)];
		
		swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer:swipeUp];
		
		
		cleared = NO;
    }
    return self;
}

-(void) swipeUpHandler
{
	NSLog(@"swipeHandler");
	cleared = YES;
	[self setNeedsDisplay];
}

//- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//	NSLog(@"touch began");
//	startLocation = [[touches anyObject] locationInView:self];
//}
//
//- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
//	touchPoint = [[touches anyObject] locationInView: self];
//	
//	CGRect frame = self.frame;
//	frame.origin.x += touchPoint.x - startLocation.x;
//	frame.origin.y += touchPoint.y - startLocation.y;
//	[self setFrame: frame];
//}

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
