//
//  Tile.h
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tile : UIView
{
	CGPoint startLocation;
	CGPoint touchPoint;
	UISwipeGestureRecognizer *swipeUp;
	id parent;
}

@property (nonatomic, assign) BOOL cleared;

-(id)initWithFrame:(CGRect)frame andDelegate:(id)viewDelegate;

@end
