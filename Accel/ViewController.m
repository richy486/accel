//
//  ViewController.m
//  Accel
//
//  Created by Richard Adem on 1/08/13.
//  Copyright (c) 2013 Richard Adem. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

#define kAccelerometerFrequency        50.0 //Hz
#define kFilteringFactor 0.1

@interface ViewController () <UIAccelerometerDelegate>
{
    UIAccelerationValue accelX, accelY, accelZ;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIAccelerometer*  theAccelerometer = [UIAccelerometer sharedAccelerometer];
    theAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
    theAccelerometer.delegate = self;
    
    accelX = accelY = accelZ = 0.0;
}

#pragma mark - accelerometer delegate

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    UIAccelerationValue x, y, z;
    x = acceleration.x;
    y = acceleration.y;
    z = acceleration.z;
    // Do something with the values.
    
    
    // Use a basic low-pass filter to keep only the gravity component of each axis.
    accelX = (acceleration.x * kFilteringFactor) + (accelX * (1.0 - kFilteringFactor));
    accelY = (acceleration.y * kFilteringFactor) + (accelY * (1.0 - kFilteringFactor));
    accelZ = (acceleration.z * kFilteringFactor) + (accelZ * (1.0 - kFilteringFactor));
    // Use the acceleration data.
    
    View *view = (View*)self.view;
    [view setAccelX:accelX];
    [view setAccelY:accelY];
    [view setAccelZ:accelZ];
    
    [view setNeedsDisplay];
//    NSLog(@"x: %.02f accelX: %.02f", x, accelX);
}

#pragma mark - memory man

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
