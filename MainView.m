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
	
	count = 0;
	
	// define size for width/height of tile frame
	NSUInteger size = 100;
	NSUInteger gridSize = 3;
	
	// make muteable set
	tileSet = [[NSMutableSet alloc] init];
	
	// create an offset point for starting the tile placement in the center of the screen
	CGFloat offsetX = self.bounds.size.width/2 - (size * gridSize)/2;
	CGFloat offsetY = self.bounds.size.height/2 - (size * gridSize)/2;
	
	// for loops to add tiles to view
	for (int i = 0; i < gridSize; ++i) {
		// stuff
		for (int j = 0; j < gridSize; ++j) {
			Tile *arrow = [[Tile alloc] initWithFrame:CGRectMake(j*size + offsetX, i*size + offsetY, size, size) andDelegate:self];
			
			// add arrow to muteable set
			[tileSet addObject:arrow];
			
			NSUInteger direction = arc4random_uniform(4) * 90;
			NSLog(@"random: %u", direction);
			
			arrow.transform = CGAffineTransformMakeRotation(direction * (M_PI/180));
			
			//NSLog(@"x:%f, y:%f | xx:%f, yy:%f", arrow.frame.origin.x, arrow.frame.origin.y, (float)(j*size), (float)(i*size));
			
			[self addSubview:arrow];
			
			
		}
	}
	
	// add a refresh button to refresh the tiles
	
	UIButton *refresh = [UIButton buttonWithType:UIButtonTypeContactAdd];
	
	// move button to the right side of the screen
	CGRect buttonFrame = refresh.frame;
	buttonFrame.origin.x = self.frame.size.width - buttonFrame.size.width;
	[refresh setFrame:buttonFrame];
	
	[refresh addTarget:self action:@selector(clearTiles) forControlEvents:UIControlEventTouchUpInside];
	
	[self addSubview:refresh];
	
	// add a back button to go back to the title screen
	
	UIButton *quit = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	[quit addTarget:self action:@selector(backToTitleScreen) forControlEvents:UIControlEventTouchUpInside];
	
	quit.transform = CGAffineTransformMakeRotation(180 * (M_PI/180));
	[self addSubview:quit];
}

-(void)increaseCount
{
	++count;
	
	if (count == 9)
	{
		NSLog(@"all clear!!");
		[self clearTiles];
	}
	
}

-(void) clearTiles
{
	for (Tile *t in tileSet) {
		[t removeFromSuperview];
	}
	
	[self setMain];
}

-(void) backToTitleScreen
{
	[parent backToTitleScreen];
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
