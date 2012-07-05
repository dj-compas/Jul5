//
//  GameView.m
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "GameView.h"
#import "MainView.h"

@implementation GameView
@synthesize viewIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
		
		// init splash screen and game screen
		splash = [[MainView alloc] initWithFrame:frame andDelegate:self];
		//splash.text = @"splash screen";
		splash.type = @"splash";
		splash.backgroundColor = [UIColor grayColor];
		[splash setSplash];
		
		main = [[MainView alloc] initWithFrame:frame andDelegate:self];
		//main.text = @"main screen";
		main.type = @"main";
		main.backgroundColor = [UIColor blackColor];
		[main setMain];
		
		// define all subviews of THIS view in an array
		views = [NSArray arrayWithObjects: splash, main, nil ];
		NSLog(@"number of items in Array view: %d", [views count]);
		NSLog(@"%@", [[views objectAtIndex:viewIndex] text]);
		viewIndex = 0;
		
		[self addSubview:[views objectAtIndex:viewIndex]];
    }
    return self;
}

-(void)moveFromSplashToGame
{
	[UIView transitionFromView:splash 
						toView:main 
					  duration:1 
					   options:UIViewAnimationOptionTransitionFlipFromRight
					completion:^(BOOL finished){
						if(finished)
						{
							NSLog(@"now showing game screen");
							viewIndex = 1;
						}
					}
	 ];
}

-(void) backToTitleScreen
{
	[UIView transitionFromView:main 
						toView:splash 
					  duration:1 
					   options:UIViewAnimationOptionTransitionFlipFromLeft
					completion:^(BOOL finished){
						if(finished)
						{
							NSLog(@"now showing title screen");
							viewIndex = 0;
						}
					}
	 ];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
