//
//  ViewController.m
//  PCLSegmentedControl
//
//  Created by Pin-Chih on 1/15/16.
//  Copyright © 2016 Pin-Chih. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (nonatomic) IBOutlet PCLSegmentedControl *containerView;
    @property (nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UIImage * logo1 = [UIImage imageNamed:@"logo1"];
    UIImage * logo2 = [UIImage imageNamed:@"logo2"];
    UIImage * logo3 = [UIImage imageNamed:@"logo3"];
    UIImage * logo4 = [UIImage imageNamed:@"logo4"];
    
    NSArray * inputArray = [[NSArray alloc] initWithObjects:logo1,logo2,logo3,logo4,nil];
    
    _containerView = [[PCLSegmentedControl alloc]initWithImages:inputArray andFrame:self.containerView.frame];
    
    
    
    _containerView.backgroundColor = [UIColor colorWithWhite:0.698 alpha:1.000];
    _containerView.roundedBackground = YES;
    _containerView.spacing = 5;
    _containerView.offSetInX = 10;
    _containerView.offSetInY = 5;
    _containerView.lineWidthForSelection = 4;
    _containerView.fillColor = [UIColor blueColor];
    //_containerView.equalSpacing = NO;
    _containerView.Style = PCLSegmentedControlStyleUnderline;
    
    
    [self.view addSubview:_containerView];
    
 
}

-(IBAction)getValue:(id)sender{
    
    self.label.text = [NSString stringWithFormat:@"%ld",(long)_containerView.selectedSegmentIndex];
    
}


@end
