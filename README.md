# PCLSegmentedControl
A view-based segmentedControl with different style of indicator for selected segment.
# Features
* Supports images
* Supports auto and manual layout for the views
* Supports different style of selection indicator
* Supports animation for selection indicator

# Installation
* Add ```QuartzCore.framework``` to your project
* Add ```PCLSegmentedControl.h``` and ```PCLSegmentedControl.m``` to your porject
* Import ```PCLSegmentedControl.h``` to your view controller
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
It's recommended to use a squre image as input, so that your contents can be shown properly. PCLSegmentedControl  automatically resizes and converts images to circle images based on the height of PCLSegmentedControl's view and the **offSetInY** property that you specified. If not specified, the distance of items in the view will be equal length, otherwise, you can set the **equalSpacing** property to NO and manually assign **spacing** and **offSetInX** properties.



# Style and Animation
PCLSegmentedControl provides two kinds of indicator style, which are ```PCLSegmentedControlStyleDefault``` and ```PCLSegmentedControlStyleUnderline```, and two kind of animations, which are ```PCLSegmentedControlAnimationTypeNone``` and ```PCLSegmentedControlAnimationTypeDefault```. If not specified, both their values will be the defalut one.

A picture shows how the properties are related to the layout:
![picture alt](https://cloud.githubusercontent.com/assets/12094516/12436056/a78099f4-bec6-11e5-8369-3de0354d4b8c.png )

# Screenshots
A screenshot shows two different style of selection indicator, ```PCLSegmentedControlStyleDefault``` on top and ```PCLSegmentedControlStyleUnderline``` on the bottom:
![picture alt](https://cloud.githubusercontent.com/assets/12094516/12442612/36af7a5c-bf06-11e5-811a-69d6eb089ff2.png)


# License
PCLSegmentedControl is licensed under the terms of the MIT License. 
For more details, please see the [LICENSE](https://github.com/pinchih/PCLSegmentedControl/blob/master/LICENSE.md) file.


