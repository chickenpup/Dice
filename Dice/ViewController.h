//
//  ViewController.h
//  Dice
//
//  Created by Chris on 8/1/15.
//  Copyright (c) 2015 chuppy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (nonatomic,retain) UILabel *side1;
@property (nonatomic,retain) UILabel *side2;
@property (nonatomic,retain) UILabel *side3;
@property (nonatomic,retain) UILabel *side4;
@property (nonatomic,retain) UILabel *side5;
@property (nonatomic,retain) UILabel *side6;
@property (nonatomic,retain) UILabel *resultLabel;
@property (nonatomic,retain) UILabel *dieSelectorLabel;

@property BOOL screenIsPortrait;


@property long result;

@property (nonatomic,retain) NSMutableArray *arrayOfSides;

@property (nonatomic) NSUInteger currentNumberOfSides;
@property (nonatomic) NSUInteger startingSide;
@property (nonatomic) NSUInteger numberOfFlips;

@property (nonatomic,retain) UISegmentedControl *dieSelector;

@property (nonatomic,retain) UIButton *rollButton;

@end

