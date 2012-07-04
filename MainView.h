//
//  MainView.h
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tile;

@interface MainView : UIView
{
	id parent;
	NSString *msg;
}

- (id) initWithFrame:(CGRect)frame andDelegate:(id)viewDelegate;

@property (nonatomic, assign) NSString *text;
@property (nonatomic, assign) id type;

-(void) setSplash;
-(void) setMain;

@end
