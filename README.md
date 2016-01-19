# PCLSegmentedControl
A view-based segmentedControl with different style of indicator for selected segment.
# Features
* Supports images
* Supports auto and manual layout for the views
* Supports different style of selection indicator
* Supports animation for selection indicator

# Installation
* Add QuartzCore.framework to your project
* Add PCLSegmentedControl.h and PCLSegmentedControl.m to your porject
* Import PCLSegmentedControl.h to your view controller
* In the xib file of your view controller, drag a View object and link it to your view controller as an IBOutlet
* Under the identity inspector of this view, change the class to PCLSegmentedControl

# Usage
The following code shows how to setup a basic PCLSegmentedControl
```
self.segmentedControl = [[PCLSegmentedControl alloc]initWithImages:imagesArray andFrame:self.segmentedControl.frame];
self.segmentedControl.backgroundColor = [UIColor colorWithWhite:0.698 alpha:1.000];
self.segmentedControl.roundedBackground = YES;
self.segmentedControl.lineWidthForSelection = 2;
self.segmentedControl.offSetInY = 5;
self.segmentedControl.fillColor = [UIColor blueColor];
```

# Style and Animation
PCLSegmentedControl provides two kinds of indicator style, which are ```PCLSegmentedControlStyleDefault``` and ```PCLSegmentedControlStyleUnderline```, and two kind of animations, which are ```PCLSegmentedControlAnimationTypeNone``` and ```PCLSegmentedControlAnimationTypeDefault```. If not specified, both their values will be the defalut one.

# Screenshots

# License
PCLSegmentedControl is licensed under the terms of the MIT License. 
For more details, please see the [LICENSE Link](https://github.com/pinchih/PCLSegmentedControl/blob/master/LICENSE.md) file.


