//
//  RCImage.m
//  Rootscap
//
//  Created by vertex young on 13-4-3.
//  Copyright (c) 2013年 Roots Capital. All rights reserved.
//

#import "RCImage.h"

CGMutablePathRef DSRoundedRectCreate(CGRect rect, CGFloat radius, RCCorner corner)
{
	CGFloat
    x                   = rect.origin.x,
    y                   = rect.origin.y,
    x2                  = rect.size.width + x,
    y2                  = rect.size.height + y,
    topLeftRadius       = corner & RCCornerTopLeft ? radius : 0,
    bottomLeftRadius    = corner & RCCornerBottomLeft ? radius : 0,
    bottomRightRadius   = corner & RCCornerBottomRight ? radius : 0,
    topRightRadius      = corner & RCCornerTopRight ? radius : 0;
    
	CGMutablePathRef path = CGPathCreateMutable();
    
	CGPathMoveToPoint(path, NULL, topLeftRadius, y);
    
	// 1. Top Left
	CGPathAddLineToPoint(path, NULL, x2 - topLeftRadius, y);
	CGPathAddArcToPoint(path, NULL, x2, y, x2, topLeftRadius, topLeftRadius);
    
	// 2. Bottom Left
	CGPathAddLineToPoint(path, NULL, x2, y2 - bottomLeftRadius);
	CGPathAddArcToPoint(path, NULL, x2, y2, x2 - bottomLeftRadius, y2, bottomLeftRadius);
    
	// 3. Bottom Right
	CGPathAddLineToPoint(path, NULL, bottomRightRadius, y2);
	CGPathAddArcToPoint(path, NULL, x, y2, x, y2 - bottomRightRadius, bottomRightRadius);
    
	// 4. Top Right
	CGPathAddLineToPoint(path, NULL, x, topRightRadius);
	CGPathAddArcToPoint(path, NULL, x, y, topRightRadius, y, topRightRadius);
    
	CGPathCloseSubpath(path);
    
	return path;
}



void DSContextClipForRoundCorners(CGContextRef ctx, CGRect rect, CGFloat radius, RCCorner corner)
{
	CGPathRef path = DSRoundedRectCreate(rect, radius, corner);
	CGContextAddPath(ctx, path);
	CGPathRelease(path);
	CGContextClip(ctx);
}

void DSContextDrawVerticalGradient(CGContextRef ctx, CGFloat y, CGFloat height, CGColorRef color1, CGColorRef color2)
{
	CGPoint         start  = CGPointMake(0.0, y);
	CGPoint         stop   = CGPointMake(0.0, y + height);
	CGColorSpaceRef space  = CGColorSpaceCreateDeviceRGB();
	NSMutableArray *colors = [NSMutableArray arrayWithObjects:(id)color1, (id)color2, nil];
    
	CGGradientRef gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, NULL);
    
	CGContextDrawLinearGradient(ctx, gradient, start, stop, 0);
    
	CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
}

@implementation UIImage (Rootscap)

- (UIImage *)imageResizedToSize:(CGSize)size withCornerRadius:(CGFloat)radius corners:(RCCorner)corners transparency:(BOOL)transparency
{
	size = CGSizeMake(roundf(size.width), roundf(size.height));
    
	CGFloat
    imageXScale     = size.width / self.size.width,
    imageYScale     = size.height / self.size.height,
    imageScale      = MAX(imageXScale, imageYScale),
    imageDrawWidth  = imageScale * self.size.width,
    imageDrawHeight = imageScale * self.size.height,
    imageDrawX      = (size.width - imageDrawWidth) / 2,
    imageDrawY      = (size.height - imageDrawHeight) / 2;
    
	CGRect
    imageDrawRect = CGRectMake(imageDrawX, imageDrawY, imageDrawWidth, imageDrawHeight),
    bounds        = CGRectMake(0, 0, size.width, size.height);
    
	BOOL opaque = (CGImageGetAlphaInfo(self.CGImage) == kCGImageAlphaNone) && !radius && !transparency;
    
	UIGraphicsBeginImageContextWithOptions(size, opaque, 0.0f);
	CGContextSetInterpolationQuality(UIGraphicsGetCurrentContext(), kCGInterpolationHigh);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
	// Round rectangle clip
    CGContextSaveGState(ctx);
    
	if (radius)
        {
		DSContextClipForRoundCorners(ctx, bounds, radius, corners);
        }
    
	[self drawInRect:imageDrawRect];
    
	CGContextRestoreGState(ctx);
    
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return newImage;
}

-(UIImage *) imageWithCornerRadius:(CGFloat)radius forCornerType:(RCCorner)cornerType
{
    CGSize size = self.size;
    
    return [self imageResizedToSize:size withCornerRadius:radius corners:cornerType transparency:YES];
}

@end

@implementation RCImage

@end
