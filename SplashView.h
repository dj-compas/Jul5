//
//  SplashView.h
//  Jul5
//
//  Created by Michael Compas on 7/3/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashView : UIView
{
	id parent;
}

- (id) initWithFrame:(CGRect)frame andDelegate:(id)viewDelegate;

@end
