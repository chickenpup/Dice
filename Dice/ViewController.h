//
//  ViewController.h
//  Dice
//
//  Created by Chris on 8/1/15.
//  Copyright (c) 2015 chuppy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,retain) UISegmentedControl *dieSelector;

@property (nonatomic,retain) UIButton *rollButton;

-(void) pushDieSelector;

@end

