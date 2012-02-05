//
//  AccelerometerViewController.m
//  Accelerometer
//
//  Created by Raja T S Sekhar on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AccelerometerViewController.h"

@implementation AccelerometerViewController

@synthesize label;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
    acc.delegate = self;
    acc.updateInterval = 1.0f/60.0f;
    [super viewDidLoad];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    //NSLog(@"Starting accelerometer");
	static NSInteger shakeCount = 0; 
	static NSDate *shakeStart;
	NSDate *now = [[NSDate alloc] init]; 
	NSDate *checkDate = [[NSDate alloc] initWithTimeInterval:1.5f sinceDate:shakeStart]; 
	if ([now compare:checkDate] == NSOrderedDescending || shakeStart == nil) { 
		shakeCount = 0; 
		[shakeStart release]; 
		shakeStart = [[NSDate alloc] init];
	} 
	[now release]; 
	[checkDate release];
	if (fabsf(acceleration.x) > 2.0 || fabsf(acceleration.y) > 2.0 || fabsf(acceleration.z) > 2.0) { 
		shakeCount++; 
		if (shakeCount > 4) {
			shakeCount = 0; 
			[shakeStart release]; 
			shakeStart = [[NSDate alloc] init];
				NSLog(@"Shaked");
		}
	}

	NSString *newText = [[NSString alloc] initWithFormat:@"x: %g\ty:%g\tz:%g", acceleration.x, acceleration.y, acceleration.z];
	[label setText:newText]; 
	[newText release];
}

// Do something 




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
