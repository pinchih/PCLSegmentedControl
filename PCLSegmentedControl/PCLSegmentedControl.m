//
//  PCLSegmentedControl.m
//  PCLSegmentedControl
//
//  Created by Pin-Chih on 1/15/16.
//  Copyright © 2016 Pin-Chih. All rights reserved.
//

#import "PCLSegmentedControl.h"

@interface PCLSegmentedControl()

    @property (nonatomic, strong) CALayer * backgroundLayer;
    @property (nonatomic, strong) CAShapeLayer * segmentedItemLayer;
    @property (nonatomic) CGFloat segmentIconHeight;
    @property (nonatomic) CGFloat autoSpacing;
    @property (nonatomic) NSMutableArray * positionArray;
    @property (nonatomic) NSMutableArray * arrayForItemCGRect;


@end



@implementation PCLSegmentedControl


#pragma mark - Initialization, setup
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self generalSetup];
        return self;
        
    }else{
        
        return nil;
        
    }
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self generalSetup];
        
        return self;
        
    }else{
        
        return nil;
        
    }
    
}


-(instancetype)initWithImages:(NSArray *)imagesArray andFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        

        self.imageArray = imagesArray;
        [self generalSetup];
        
        return  self;
        
    }else{
        
        return  nil;
        
    }
    
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self generalSetup];
    
}


-(void)generalSetup{
    
    
    self.roundedBackground = NO;
    self.equalSpacing = YES;
    
    self.lineWidthForSelection = 0;
    self.segmentIconHeight = 0;
    self.spacing = 0;
    self.selectedSegmentIndex = 0;
    self.underlineHeight = 0;
    
    self.numberOfSegments = [self.imageArray count];
    self.positionArray = [NSMutableArray new];
    self.arrayForItemCGRect = [NSMutableArray new];
    
    self.backgroundLayer = [CALayer layer];
    self.segmentedItemLayer = [CAShapeLayer layer];
    
    
    self.Style = PCLSegmentedControlStyleDefault;
    self.animation = PCLSegmentedControlAnimationTypeDefault;
    
    
}


#pragma mark - Self-Defined methods
-(UIImageView*)resizeWithInputImage:(UIImage *)image withWidth:(NSInteger)width andHeight:(NSInteger)height{
    
    CGSize originalImageSize = image.size;
    
    CGRect newImageSize = CGRectMake(0, 0, width, height);
    
    float ratio = MAX(newImageSize.size.width/originalImageSize.width, newImageSize.size.height/originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newImageSize.size,NO,0.0);
    
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newImageSize.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newImageSize.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    return [[UIImageView alloc] initWithImage:image];
    
}


-(UIImage*)returnShellLikeImageWithInputImage:(UIImage *)image withHeight:(NSInteger)height{
    
    CGSize originalImageSize = image.size;
    
    float ratio = height/originalImageSize.height;
    
    CGRect newImageSize = CGRectMake(0, 0,originalImageSize.width * ratio, height);
    
    
    UIGraphicsBeginImageContextWithOptions(newImageSize.size,NO,0.0);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(newImageSize.size.width/2, newImageSize.size.height/2)
                                                         radius:height/2
                                                     startAngle:degreesToRadians(35)
                                                       endAngle:degreesToRadians(145)
                                                      clockwise:NO];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = newImageSize.size.width;
    projectRect.size.height = height;
    projectRect.origin.x = (newImageSize.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newImageSize.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage * smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return smallImage;
    
}


-(UIImage*)returnRoundedImageWithInputImage:(UIImage *)image withHeight:(NSInteger)height{
    
    CGSize originalImageSize = image.size;
    
    float ratio = height/originalImageSize.height;
    
    CGRect newImageSize = CGRectMake(0, 0,originalImageSize.width * ratio, height);
    

    UIGraphicsBeginImageContextWithOptions(newImageSize.size,NO,0.0);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(newImageSize.size.width/2, newImageSize.size.height/2)
                                                         radius:height/2
                                                     startAngle:0
                                                       endAngle:360
                                                      clockwise:YES];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = newImageSize.size.width;
    projectRect.size.height = height;
    projectRect.origin.x = (newImageSize.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newImageSize.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage * smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return smallImage;
    
}

#pragma mark - Drawing methods

- (void)drawRect:(CGRect)rect {
    
    // Remove the old CGRect in the array
    [self.arrayForItemCGRect removeAllObjects];
    
    // Fill superview's background with white color
    [[UIColor whiteColor] setFill];
    UIRectFill([self bounds]);
    
    // Remove all sublayers
    self.layer.sublayers = nil;
    
    // Check whether it's rounded for background or not
    if (_roundedBackground) {
        
        [self.backgroundColor setFill];
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.frame.size.height/2] fill];
        
    }else{

        [self.backgroundColor setFill];
        [[UIBezierPath bezierPathWithRect:rect] fill];
        
    }

    // Check which style user has defined
    switch (self.Style) {
            

        case PCLSegmentedControlStyleDefault:{
            
            // Iterate through images and add them to the view
            [self.imageArray enumerateObjectsUsingBlock:^(UIImage * image, NSUInteger index, BOOL *stop){
                
                // Obtain a circle image from the orignial image
                UIImage * iconForSegmentedContorlItem = [self returnRoundedImageWithInputImage:image
                                                                                    withHeight:self.frame.size.height - 2*self.offSetInY -2*self.lineWidthForSelection];
                
                CGFloat iconWidth = iconForSegmentedContorlItem.size.width;
                CGFloat iconHeight = iconForSegmentedContorlItem.size.height;
                
                self.segmentIconHeight = iconHeight;
                
                CGFloat x,y;
                CGRect rect;
                
                
                // Different layout for equal spacing or manual spacing
                if (self.equalSpacing) {
                    
                    NSInteger numberOfGap = self.numberOfSegments+1;
                    self.autoSpacing = (self.frame.size.width - iconWidth*self.numberOfSegments - 2*self.lineWidthForSelection*self.numberOfSegments)/(float)numberOfGap;
                    
                    x = index*iconWidth + self.autoSpacing*(index+1) + 2*self.lineWidthForSelection*index;
                    y = self.frame.size.height/2 - iconHeight/2;
                    rect = CGRectMake(x, y, iconWidth, iconHeight);

                    
                }else{
                    
                    x = index*iconWidth + self.spacing*index + self.offSetInX + 2*self.lineWidthForSelection*index;
                    y = self.frame.size.height/2 - iconHeight/2;
                    rect = CGRectMake(x, y, iconWidth, iconHeight);

                }
                
                // Store the CGRect for each item, which are used for checking touch event
                [self.arrayForItemCGRect addObject:[NSValue valueWithCGRect:rect]];
                
                
                [self.positionArray addObject:[NSNumber numberWithFloat:x]];
                
                
                // This CALayer is for the circle image
                CALayer * imageLayer = [CALayer layer];
                imageLayer.contents = (id)iconForSegmentedContorlItem.CGImage;
                imageLayer.frame = rect;
                
                // If the imaged is selected, create a circle background layer and put it under image layer
                if (self.selectedSegmentIndex == index) {
                    
                    self.segmentedItemLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x+iconWidth/2, y+iconHeight/2)
                                                                                  radius:iconHeight/2 + self.lineWidthForSelection
                                                                              startAngle:0
                                                                                endAngle:2*M_PI
                                                                               clockwise:YES].CGPath;
                    self.segmentedItemLayer.fillColor = self.fillColor.CGColor;
                    
                    [self.layer addSublayer:self.segmentedItemLayer];
                }
                
                // Add image layer to the view
                [self.layer addSublayer:imageLayer];
            
            }];
            

            break;
            
            
        }case PCLSegmentedControlStyleUnderline:{
            
            
            self.animation = PCLSegmentedControlAnimationTypeNone;
            
            [self.imageArray enumerateObjectsUsingBlock:^(UIImage * image, NSUInteger index, BOOL *stop){
                
                UIImage * iconForSegmentedContorlItem;
                
                if (self.selectedSegmentIndex != index) {
                    
                    iconForSegmentedContorlItem = [self returnRoundedImageWithInputImage:image
                                                                              withHeight:self.frame.size.height - 2*self.offSetInY-2*self.lineWidthForSelection];
                }else{
                    
                    iconForSegmentedContorlItem = [self returnShellLikeImageWithInputImage:image
                                                  withHeight:self.frame.size.height - 2*self.offSetInY-2*self.lineWidthForSelection];

                    
                }
                
                CGFloat iconWidth = iconForSegmentedContorlItem.size.width;
                CGFloat iconHeight = iconForSegmentedContorlItem.size.height;
                
                self.segmentIconHeight = iconHeight;
                
                CGFloat x,y;
                CGRect rect;
                
                if (self.equalSpacing) {
                    
                    NSInteger numberOfGap = self.numberOfSegments+1;
                    self.autoSpacing = (self.frame.size.width - iconWidth*self.numberOfSegments - 2*self.lineWidthForSelection*self.numberOfSegments)/(float)numberOfGap;
                    
                    x = index*iconWidth + self.autoSpacing*(index+1) + 2*self.lineWidthForSelection*index;
                    y = self.frame.size.height/2 - iconHeight/2;
                    rect = CGRectMake(x, y, iconWidth, iconHeight);
                    
                    
                }else{
                    
                    x = index*iconWidth + self.spacing*index + self.offSetInX + 2*self.lineWidthForSelection*index;
                    y = self.frame.size.height/2 - iconHeight/2;
                    rect = CGRectMake(x, y, iconWidth, iconHeight);
                    
                }
                
                [self.arrayForItemCGRect addObject:[NSValue valueWithCGRect:rect]];

                CALayer * imageLayer = [CALayer layer];
                imageLayer.contents = (id)iconForSegmentedContorlItem.CGImage;
                imageLayer.frame = rect;
                
                
                
                if (self.selectedSegmentIndex == index) {
                    
                    
                    [self.layer addSublayer:imageLayer];
                    
                    CAShapeLayer * underlineSelectionLayer = [CAShapeLayer layer];
                    
                    CGRect indicator = CGRectMake(x, y + iconHeight-self.underlineHeight, iconWidth, self.underlineHeight);
                    
                    underlineSelectionLayer.path = [UIBezierPath bezierPathWithRoundedRect:indicator cornerRadius:self.underlineHeight/2].CGPath;
                    
                    underlineSelectionLayer.fillColor = self.fillColor.CGColor;
                    
                    [self.layer addSublayer:underlineSelectionLayer];
                    
                }else{
                    
                    [self.layer addSublayer:imageLayer];
                    
                }
                

                
            }];

            break;
            
        }default:
            
            break;
            
    }
    
    
    
    
}

#pragma mark - Touch event

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if ( CGRectContainsPoint(self.bounds, touchLocation)) {
        
        
        for (NSValue * value in self.arrayForItemCGRect) {
            
            if (CGRectContainsPoint([value CGRectValue], touchLocation)) {
                
                self.selectedSegmentIndex = [self.arrayForItemCGRect indexOfObject:value];

                [self sendActionsForControlEvents:UIControlEventValueChanged];
                
            }
            
            
        }
        

        switch (self.animation) {
            case PCLSegmentedControlAnimationTypeDefault:{
            
                [self setNeedsDisplay];
                
                [UIView transitionWithView:self duration:0.5
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    [self.layer displayIfNeeded];
                                } completion:nil];
                
                break;
            }case PCLSegmentedControlAnimationTypeNone:{
                
                [self setNeedsDisplay];
                
                break;
                
            }case PCLSegmentedControlAnimationTypeDynamic:{
                
                [self setNeedsDisplay];
                
                /*
                
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
            
                CGFloat x = [self.positionArray[segmentIndex-1] floatValue];
                
                [animation setFromValue:[NSNumber numberWithFloat:0.0f]];
                [animation setToValue:[NSNumber numberWithFloat:x]];
                [animation setDuration:0.25f];
                
                [self.segmentedItemLayer addAnimation:animation forKey:@"transform.translation.x"];
                
                 */
                 
                break;
                
            }default:
                
                break;
            
                
        }
        
        
    
        
    }
    
    
    
    
}




@end
