//
//  PCLSegmentedControl.h
//  PCLSegmentedControl
//
//  Created by Pin-Chih on 1/15/16.
//  Copyright © 2016 Pin-Chih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <math.h>

#define degreesToRadians(x) ((x) * M_PI / 180.0)

typedef enum {
    
    PCLSegmentedControlStyleDefault = 0,
    PCLSegmentedControlStyleUnderline,
    
}PCLSegmentedControlStyle;

typedef enum {
    
    PCLSegmentedControlAnimationTypeDefault = 0,
    PCLSegmentedControlAnimationTypeDynamic,
    PCLSegmentedControlAnimationTypeNone,
    
}PCLSegmentedControlAnimationType;


@interface PCLSegmentedControl : UIControl

    @property (nonatomic) NSArray * imageArray;
    @property (nonatomic) PCLSegmentedControlStyle Style;
    @property (nonatomic) PCLSegmentedControlAnimationType animation;
    @property (nonatomic) NSInteger spacing;
    @property (nonatomic) NSInteger offSetInX;
    @property (nonatomic) NSInteger offSetInY;
    @property (nonatomic) NSInteger underlineHeight;
    @property (nonatomic) NSInteger lineWidthForSelection;
    @property (nonatomic) NSInteger numberOfSegments;
    @property (nonatomic) NSInteger selectedSegmentIndex;
    @property (nonatomic) BOOL roundedBackground;
    @property (nonatomic) BOOL equalSpacing;
    @property (nonatomic) UIColor * backgroundColor;
    @property (nonatomic) UIColor * fillColor;


-(instancetype)initWithImages:(NSArray*)imagesArray andFrame:(CGRect)frame;


@end
