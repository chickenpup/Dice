//
//  ViewController.m
//  Dice
//
//  Created by Chris on 8/1/15.
//  Copyright (c) 2015 chuppy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
}

@end

@implementation ViewController

-(void) loadView {
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    self.view = [[UIView alloc]initWithFrame:screenRect];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDieSelector];
    [self createRollButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) createDieSelector {
    // Init dieSelector
    self.dieSelector = [[[UISegmentedControl alloc] initWithFrame:CGRectMake(screenWidth/4, 60, 200, 40) ] initWithItems:[NSArray arrayWithObjects:@"2",@"6",@"12", nil]];
    
    
    // Add action to dieSelector
    [self.dieSelector addTarget:self action:@selector(pushDieSelector:) forControlEvents:UIControlEventValueChanged];

    
    // Init Label for selector prompting user input
    UILabel *dieSelectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/4, 20, 200, 40)];
    dieSelectorLabel.text = @"Select number of sides";
    dieSelectorLabel.textColor = [UIColor whiteColor];
    dieSelectorLabel.textAlignment = NSTextAlignmentCenter;
    
    // Add selector and label to view
    [self.view addSubview:self.dieSelector];
    [self.view addSubview:dieSelectorLabel];
    
}

-(void)createRollButton {
    self.rollButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/4, 100, 200, 40)];
    
    [self.view addSubview:self.rollButton];
}



-(IBAction)pushDieSelector:(id)sender{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            break;
            
        case 1:
            break;
            
        case 2:
            break;
            
        default:
            break;
    }
    
}

@end
