//
//  MapOverlayView.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "MapOverlayView.h"
#import "MapOverlay.h"

@implementation MapOverlayView

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)ctx
{
    
    UIImage *image = [UIImage imageNamed:@"PHS_1st_floor_edited.png"];
    CGImageRef imageReference = image.CGImage;
    
    //Loading and setting the image
    MKMapRect theMapRect = [self.overlay boundingMapRect];
    CGRect theRect = [self rectForMapRect:theMapRect];
    
	
    // We need to flip and reposition the image here
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0.0, -theRect.size.height);
    
    //drawing the image to the context
    CGContextDrawImage(ctx, theRect, imageReference);
	
}


@end
