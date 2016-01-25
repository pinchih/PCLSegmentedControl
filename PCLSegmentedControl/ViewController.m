//
//  ViewController.m
//  PCLSegmentedControl
//
//  Created by Pin-Chih on 1/15/16.
//  Copyright © 2016 Pin-Chih. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (nonatomic) IBOutlet PCLSegmentedControl *segmentedControl1;
    @property (nonatomic) IBOutlet PCLSegmentedControl *segmentedControl2;
    @property (nonatomic) IBOutlet UILabel * label1;
    @property (nonatomic) IBOutlet UILabel * label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UIImage * logo1 = [UIImage imageNamed:@"logo1"];
    UIImage * logo2 = [UIImage imageNamed:@"logo2"];
    UIImage * logo3 = [UIImage imageNamed:@"logo3"];
    UIImage * logo4 = [UIImage imageNamed:@"logo4"];
    
    NSArray * inputArray = [[NSArray alloc] initWithObjects:logo1,logo2,logo3,logo4,nil];
    
    self.segmentedControl1 = [[PCLSegmentedControl alloc]initWithImages:inputArray andFrame:self.segmentedControl1.frame];
    self.segmentedControl1.backgroundColor = [UIColor colorWithWhite:0.698 alpha:1.000];
    self.segmentedControl1.roundedBackground = YES;
    self.segmentedControl1.lineWidthForSelection = 2;
    self.segmentedControl1.offSetInY = 5;
    self.segmentedControl1.fillColor = [UIColor blueColor];
    
    [self.segmentedControl1 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.segmentedControl2 = [[PCLSegmentedControl alloc]initWithImages:inputArray andFrame:self.segmentedControl2.frame];
    self.segmentedControl2.backgroundColor = [UIColor colorWithWhite:0.698 alpha:1.000];
    self.segmentedControl2.roundedBackground = NO;
    self.segmentedControl2.lineWidthForSelection = 5;
    self.segmentedControl2.fillColor = [UIColor blueColor];
    self.segmentedControl2.offSetInY = 5;
    self.segmentedControl2.underlineHeight = 5;
    self.segmentedControl2.Style = PCLSegmentedControlStyleUnderline;
    [self.segmentedControl2 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentedControl1];
    [self.view addSubview:self.segmentedControl2];
    
    
 
}


- (void)valueChanged:(PCLSegmentedControl *)segmentedControl {
    
    if (segmentedControl.roundedBackground == NO) {
        
        self.label2.text = [@"Selected index: " stringByAppendingString:[NSString stringWithFormat:@"%ld",segmentedControl.selectedSegmentIndex]];
        
    }else{
        
        self.label1.text = [@"Selected index: " stringByAppendingString:[NSString stringWithFormat:@"%ld",segmentedControl.selectedSegmentIndex]];
        
    }
    
}


@end
