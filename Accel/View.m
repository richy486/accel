//
//  View.m
//  Accel
//
//  Created by Richard Adem on 1/08/13.
//  Copyright (c) 2013 Richard Adem. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGPoint centre = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    // X
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0, 1);
        CGContextMoveToPoint(ctx, centre.x - 100, centre.y);
        CGContextAddLineToPoint( ctx, centre.x + 100, centre.y);
        CGContextStrokePath(ctx);
    }
    {
        CGFloat xPos = centre.x + (100 * self.accelX); //(centre.x - 100) + (((centre.x + 100) - (centre.x - 100)) * self.accelX);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 0.0, 1.0, 0, 1);
        CGRect rectangle = CGRectMake(xPos - 10, centre.y-10, 20, 20);
        CGContextAddEllipseInRect(ctx, rectangle);
        CGContextStrokePath(ctx);
    }
    
    // Y
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
        CGContextMoveToPoint(ctx, centre.x, centre.y-100);
        CGContextAddLineToPoint( ctx, centre.x, centre.y + 100);
        CGContextStrokePath(ctx);
    }
    {
        CGFloat yPos = centre.y + (100 * self.accelY); //(centre.x - 100) + (((centre.x + 100) - (centre.x - 100)) * self.accelX);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
        CGRect rectangle = CGRectMake(centre.x - 10, yPos-10, 20, 20);
        CGContextAddEllipseInRect(ctx, rectangle);
        CGContextStrokePath(ctx);
    }
    
    
    // Z
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 0.0, 0, 1.0, 1);
        CGContextMoveToPoint(ctx, centre.x - 50, centre.y + 50);
        CGContextAddLineToPoint( ctx, centre.x + 50, centre.y - 50);
        CGContextStrokePath(ctx);
    }
    {
        CGFloat xPos = centre.x + (50 * self.accelZ);
        CGFloat yPos = centre.y - (50 * self.accelZ); //(centre.x - 100) + (((centre.x + 100) - (centre.x - 100)) * self.accelX);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(ctx, 0.0, 0, 1.0, 1);
        CGRect rectangle = CGRectMake(xPos - 10, yPos - 10, 20, 20);
        CGContextAddEllipseInRect(ctx, rectangle);
        CGContextStrokePath(ctx);
    }
}


@end
