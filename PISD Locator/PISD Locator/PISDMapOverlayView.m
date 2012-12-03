//
//  MapOverlayView.m
//  PISD Locator
//
//  Created by Cole Hecht on 9/30/12.
//  Copyright (c) 2012 Hechtic Development. All rights reserved.
//

#import "PISDMapOverlayView.h"
#import "PISDCampus.h"

@implementation PISDMapOverlayView

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)ctx
{
	
	PISDCampus *campus = (PISDCampus *)self.overlay;
	UIImage *image = campus.image;
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
