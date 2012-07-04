//
//  GameView.h
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface GameView : UIView
{
	MainView *splash;
	MainView *main;
	NSArray *views;
	NSUInteger viewIndex;
}

@property (nonatomic, assign) uint viewIndex;

-(void)moveFromSplashToGame;

@end
