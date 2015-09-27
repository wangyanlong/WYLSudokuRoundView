//
//  SudokuImageView.m
//  九宫格Button-demo
//
//  Created by 王颜龙 on 13-5-15.
//  Copyright (c) 2013年 longyan. All rights reserved.
//

#define kWidth 5.0   //宽间距
#define kHeight 5.0  //高间距
#define ImageX frame.origin.x + kWidth   //位置 - x
#define ImageY frame.origin.y + kHeight  //位置 - y
#define ImageWidth (frame.size.width - (kWidth * 4))/3.0     //size - 宽
#define ImageHeight (frame.size.height - (kHeight * 4))/3.0  //size - 高

#import "SudokuImageView.h"
#import "RCImage.h"
@implementation SudokuImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame WithSubImageViewArray:(NSMutableArray *)array{
    self = [super init];
    if (self) {
        for (NSString *imageStr in array) {
            static int i = 0;
            
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]];
            [image imageWithCornerRadius:20 forCornerType:RCCornerAll];
            UIImageView *subImageView = [[UIImageView alloc]initWithImage:image];
            subImageView.frame = CGRectMake((ImageX + i % 3 *(ImageX + ImageWidth)),(ImageY + i / 3 *(ImageY + ImageHeight)),ImageWidth,ImageHeight);
            [self addSubview:subImageView];
            i ++;
            if (i>=9) {
                break;
            }
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
