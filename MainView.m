//
//  MainView.m
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "MainView.h"
#import "GameView.h"
#import "Tile.h"

@implementation MainView
@synthesize text;
@synthesize type;

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

//=======================================================================
-(void) setSplash
{
	// set as splash screen
	
	// define gesture recognizer
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(splashTapHandler)];
	
	// set the number of taps required to trigger the gesture recognizer
	singleTap.numberOfTapsRequired = 1;
	
	// add the gesture to the view
	[self addGestureRecognizer:singleTap];
}

-(void) splashTapHandler
{
	[parent moveFromSplashToGame];
}

//=======================================================================
-(void) setMain
{
	// set as main screen
	
	// make a new tile and add it to the view
	
	/*
	CGRect rect = CGRectMake(0, 0, 100, 100);
	Tile *arrow = [[Tile alloc] initWithFrame:rect];
	[self addSubview:arrow];
	*/
	
	// define size for width/height of tile frame
	NSUInteger size = 100;
	NSUInteger gridSize = 3;
	
	// make muteable set
	//NSMutableSet *tileSet = [[NSMutableSet alloc] init];
	
	// for loops to add sets to view
	for (int i = 0; i < gridSize; ++i) {
		// stuff
		for (int j = 0; j < gridSize; ++j) {
			Tile *arrow = [[Tile alloc] initWithFrame:CGRectMake(j*size, i*size, size, size)];
			
			// add arrow to set (why? I don't know...)
			//[tileSet addObject:arrow];
			
			NSLog(@"x:%f, y:%f | xx:%f, yy:%f", arrow.frame.origin.x, arrow.frame.origin.y, (float)(j*size), (float)(i*size));
			
			[self addSubview:arrow];
			
			
		}
	}
}

//=======================================================================
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Drawing code
	
	if (type == @"splash")
	{
		UIImage *img = [UIImage imageNamed:@"splash_screen.jpg"];
		[img drawAtPoint:CGPointZero];
	}
	
	// add text
	UIFont *font = [UIFont systemFontOfSize:72*.5];
	
	if (text)
	{
		msg = text;
	}
	else {
		NSLog(@"no text shown for this view: %@", [[self class] description]);
	}
	
	[msg drawAtPoint:CGPointMake(0, 0) withFont:font];
}


@end
