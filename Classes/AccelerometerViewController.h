//
//  AccelerometerViewController.h
//  Accelerometer
//
//  Created by Raja T S Sekhar on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccelerometerViewController : UIViewController <UIAccelerometerDelegate> {

	IBOutlet UILabel *label;
}

@property (nonatomic, retain) UILabel *label;

@end

