# PCLSegmentedControl
A view-based segmentedControl with different style of indicator for selected segment.
# Features
* Support images
* Support auto and manual layout for the views
* Support different style of selection indicator
* Support animation for selection indicator
* Support target-action method

# Installation
* Add ```QuartzCore.framework``` to your project
* Add ```PCLSegmentedControl.h``` and ```PCLSegmentedControl.m``` to your porject
* Import ```PCLSegmentedControl.h``` to your view controller
* In the xib file of your view controller, drag a View object and link it to your view controller as an IBOutlet
* Under the identity inspector of this view, change the class to PCLSegmentedControl

# Usage
The following code shows how to setup a basic PCLSegmentedControl
```
// In your view controller
self.segmentedControl = [[PCLSegmentedControl alloc]initWithImages:imagesArray andFrame:self.segmentedControl.frame];
self.segmentedControl.backgroundColor = [UIColor colorWithWhite:0.698 alpha:1.000];
self.segmentedControl.roundedBackground = YES;
self.segmentedControl.lineWidthForSelection = 2;
self.segmentedControl.offSetInY = 5;
self.segmentedControl.fillColor = [UIColor blueColor];
[self.segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
[self.view addSubview:self.segmentedControl];
```
And if you need to get notified when selection changed , implement the  ```valueChanged``` method in your view controller:
```
- (void)valueChanged:(PCLSegmentedControl *)segmentedControl {
      // Your own code here...
      // For example, print the current index of selection
      NSLog(@"Selected index:%ld",segmentedControl.selectedSegmentIndex);
}
```

It's recommended to use a squre image as input, so that your contents can be shown properly. PCLSegmentedControl  automatically resizes and converts images to circle images based on the height of PCLSegmentedControl's view and the **offSetInY** property that you specified. If not specified, the distance of items in the view will be equal length, or, you can also set the **equalSpacing** property to NO and manually assign **spacing** and **offSetInX** properties.



# Style and Animation
PCLSegmentedControl provides two kinds of indicator style, which are ```PCLSegmentedControlStyleDefault``` and ```PCLSegmentedControlStyleUnderline```, and two kind of animations, which are ```PCLSegmentedControlAnimationTypeNone``` and ```PCLSegmentedControlAnimationTypeDefault```. If not specified, both their values will be the defalut one.

A picture shows how the properties are related to the layout:
![picture alt](https://cloud.githubusercontent.com/assets/12094516/12436056/a78099f4-bec6-11e5-8369-3de0354d4b8c.png )

# Screenshots
A screenshot shows two different style of selection indicator, ```PCLSegmentedControlStyleDefault``` on top and ```PCLSegmentedControlStyleUnderline``` on the bottom:
![picture alt](https://cloud.githubusercontent.com/assets/12094516/12562059/fbe48524-c357-11e5-9338-32c9f392acdc.png)

# Known issues
* If the total sum of width of all image items is greater than the view width itself. The view will not be displayed properly. To fix this, the ability to scroll for the view is considered to be implemented in the future.

# License
PCLSegmentedControl is licensed under the terms of the MIT License. 
For more details, please see the [LICENSE](https://github.com/pinchih/PCLSegmentedControl/blob/master/LICENSE.md) file.


