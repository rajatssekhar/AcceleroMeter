//
//  AccelerometerAppDelegate.h
//  Accelerometer
//
//  Created by Raja T S Sekhar on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccelerometerViewController;

@interface AccelerometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerViewController *viewController;

@end

