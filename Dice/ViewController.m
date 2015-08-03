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
    [self createDie];
    
    self.arrayOfSides = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) createDieSelector {
    // Init dieSelector
    self.dieSelector = [[[UISegmentedControl alloc] initWithFrame:CGRectMake(screenWidth/2 - 44, 60, 0, 40) ] initWithItems:[NSArray arrayWithObjects:@"Coin",@"Die", nil]];
    
    // Set default selected segment
    self.dieSelector.selectedSegmentIndex = 0;

    // Add action to dieSelector
    [self.dieSelector addTarget:self action:@selector(pushDieSelector:) forControlEvents:UIControlEventValueChanged];
    
    
    // Init Label for selector prompting user input
    UILabel *dieSelectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 100, 20, 200, 40)];
    dieSelectorLabel.text = @"Flip a coin or a roll a die?";
    dieSelectorLabel.textColor = [UIColor whiteColor];
    dieSelectorLabel.textAlignment = NSTextAlignmentCenter;
    
    
    // Add selector and label to view
    [self.view addSubview:self.dieSelector];
    [self.view addSubview:dieSelectorLabel];
    
}

-(void)createRollButton {
    self.rollButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 - 50, 100, 100, 40)];
    [self.rollButton setBackgroundColor:[UIColor blueColor]];
    [self.rollButton setTitle:@"Flip" forState:UIControlStateNormal];
    [self.rollButton addTarget:self action:@selector(pushRollButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.rollButton];
}

-(void)createDie {
    self.side1= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 160, 50, 20)];
    self.side2= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 190, 50, 20)];
    self.side3= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 220, 50, 20)];
    self.side4= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 250, 50, 20)];
    self.side5= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 280, 50, 20)];
    self.side6= [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 25, 310, 50, 20)];
    
    self.side1.text = @"1";
    self.side1.backgroundColor = [UIColor whiteColor];
    self.side1.textAlignment = NSTextAlignmentCenter;
    
    self.side2.text = @"2";
    self.side2.backgroundColor = [UIColor whiteColor];
    self.side2.textAlignment = NSTextAlignmentCenter;
    
    self.side3.text = @"3";
    self.side3.backgroundColor = [UIColor whiteColor];
    self.side3.textAlignment = NSTextAlignmentCenter;
    
    self.side4.text = @"4";
    self.side4.backgroundColor = [UIColor whiteColor];
    self.side4.textAlignment = NSTextAlignmentCenter;
    
    self.side5.text = @"5";
    self.side5.backgroundColor = [UIColor whiteColor];
    self.side5.textAlignment = NSTextAlignmentCenter;
    
    self.side6.text = @"6";
    self.side6.backgroundColor = [UIColor whiteColor];
    self.side6.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.side1];
    [self.view addSubview:self.side2];
//    [self.view addSubview:self.side3];
//    [self.view addSubview:self.side4];
//    [self.view addSubview:self.side5];
//    [self.view addSubview:self.side6];
}


-(IBAction)pushDieSelector:(id)sender{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            // Set rollButton's title appropriately
            [self.rollButton setTitle:@"Flip" forState:UIControlStateNormal];

            // Remove all labels from superview
            [self.side1 removeFromSuperview];
            [self.side2 removeFromSuperview];
            [self.side3 removeFromSuperview];
            [self.side4 removeFromSuperview];
            [self.side5 removeFromSuperview];
            [self.side6 removeFromSuperview];
            
            // Remove all objects from array
            [self.arrayOfSides removeAllObjects];
            
            // Add desired labels to view
            [self.view addSubview:self.side1];
            [self.view addSubview:self.side2];
            
            // Add labels to array
            [self.arrayOfSides addObject:self.side1];
            [self.arrayOfSides addObject:self.side2];
            
            // Set #sides property
            self.currentNumberOfSides = 2;
            
            break;
            
        case 1:
            // Set rollButton's title appropriately
            [self.rollButton setTitle:@"Roll" forState:UIControlStateNormal];
            
            // Remove all labels from superview
            [self.side1 removeFromSuperview];
            [self.side2 removeFromSuperview];
            
            // Remove all objects from array
            [self.arrayOfSides removeAllObjects];
            
            // Add desired labels to view
            [self.view addSubview:self.side1];
            [self.view addSubview:self.side2];
            [self.view addSubview:self.side3];
            [self.view addSubview:self.side4];
            [self.view addSubview:self.side5];
            [self.view addSubview:self.side6];
            
            // Add labels to array
            [self.arrayOfSides addObject:self.side1];
            [self.arrayOfSides addObject:self.side2];
            [self.arrayOfSides addObject:self.side3];
            [self.arrayOfSides addObject:self.side4];
            [self.arrayOfSides addObject:self.side5];
            [self.arrayOfSides addObject:self.side6];
            
            // Set #sides property
            self.currentNumberOfSides = 6;
            
            break;
            
            
        default:
            break;
    }
    
}

-(IBAction)pushRollButton:(id)sender{
    if (self.dieSelector.selectedSegmentIndex == 0){
       
        // Randomize starting side and set to j for readability
        self.startingSide = arc4random_uniform(self.currentNumberOfSides);
        long j = self.startingSide;
        
        // Randomize the number of flips
        self.numberOfFlips = arc4random_uniform(20) + 15;
        
        // Loop for each flip
        for (int i = 0; i <= self.numberOfFlips; i++) {
            UILabel *currentSide  = [self.arrayOfSides objectAtIndex:j];
            currentSide.backgroundColor = [UIColor redColor];
            if (i != self.numberOfFlips){
                currentSide.backgroundColor = [UIColor whiteColor];
            }
            
            j++;
            
            if (j > self.arrayOfSides.count - 1) {
                j = 0;
            }
        }
        
        self.result = j;
        if (self.result == 0) {
            NSLog(@"Heads");
        } else {
            NSLog(@"Tails");
            
        }
        
    } else {
        
        // Create a new array randomly sorted from regular array, then reassign regular array to random array. The purpose to to emulate the randomness of a die's bouncing pattern.
        if (self.arrayOfSides){
            NSMutableArray *randomArray = [NSMutableArray arrayWithArray:self.arrayOfSides];
            
            for (NSUInteger i = randomArray.count - 1; i > 0; --i) {
                [randomArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)(i + 1))];
            }
            self.arrayOfSides = randomArray;
        }
        

        self.startingSide = arc4random_uniform(self.currentNumberOfSides);
        long j = self.startingSide;
        
        self.numberOfFlips = arc4random_uniform(20) + 15;
        
        for (int i = 0; i <= self.numberOfFlips; i++) {
            
            UILabel *currentSide  = [self.arrayOfSides objectAtIndex:j];
            currentSide.backgroundColor = [UIColor redColor];
            if (i != self.numberOfFlips){
                currentSide.backgroundColor = [UIColor whiteColor];
            }
            
            j++;
            
            if (j > self.arrayOfSides.count - 1) {
                j = 0;
            }
        }
        
        // This needs work. self.result isn't the correct number
        self.result = [[[self.arrayOfSides objectAtIndex:j] text] integerValue];
        NSLog(@"Die landed on %li", self.result);
    }
    
    
}
@end
