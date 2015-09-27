//
//  RCImage.h
//  Rootscap
//
//  Created by vertex young on 13-4-3.
//  Copyright (c) 2013年 Roots Capital. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    RCCornerNone = 0x00000000,
    RCCornerAll  = 0xFFFFFFFF,
    
    RCCornerTop    = 0x0000000F,
    RCCornerTopRight    = 1 << 0,
    RCCornerTopLeft     = 1 << 1,
    
    RCCornerBottom = 0x000000F0,
    RCCornerBottomLeft  = 1 << 4,
    RCCornerBottomRight = 1 << 5,
} RCCorner;

@interface UIImage (Rootscap)


- (UIImage *)imageWithCornerRadius:(CGFloat)radius
                     forCornerType:(RCCorner) cornerType;

- (UIImage *)imageResizedToSize:(CGSize)size
               withCornerRadius:(CGFloat)radius
                        corners:(RCCorner)corners
                   transparency:(BOOL)transparency;

@end

@interface RCImage : UIImage

@end
