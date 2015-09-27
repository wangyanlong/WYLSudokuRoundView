//
//  SudokuView.m
//  九宫格Button-demo
//
//  Created by 王颜龙 on 13-5-15.
//  Copyright (c) 2013年 longyan. All rights reserved.
//
#import "LBorderView.h"
#import "SudokuView.h"
#import "UIImageView+WebCache.h"

#define kWidth 5.0   //宽间距
#define kHeight 5.0  //高间距
#define ImageX frame.origin.x + kWidth   //位置 - x
#define ImageY frame.origin.y + kHeight  //位置 - y
#define ImageWidth (frame.size.width - (kWidth * 4))/3.0     //size - 宽
#define ImageHeight (frame.size.height - (kHeight * 4))/3.0  //size - 高

@implementation SudokuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame WithSubImageViewArray:(NSMutableArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        for (NSString *imageStr in array) {
            
            static int i = 0;
            
            UIImageView *subImageView = [[UIImageView alloc]init];
            [subImageView setImageWithURL:nil placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]]];
            subImageView.frame = CGRectMake((ImageX + i % 3 *(ImageX + ImageWidth)),(ImageY + i / 3 *(ImageY + ImageHeight)),ImageWidth,ImageHeight);
            [self addSubview:subImageView];
/*
//            LBorderView *borderView = [[LBorderView alloc] initWithFrame:CGRectMake((ImageX + i % 3 *(ImageX + ImageWidth)),(ImageY + i / 3 *(ImageY + ImageHeight)),ImageWidth,ImageHeight)];
//            borderView 
//            borderView.cornerRadius = 20;//圆角弧度
//            borderView.borderType = BorderTypeSolid;//边框类型
//            borderView.borderWidth = 2;//边框宽度
//            borderView.backgroundColor = [UIColor yellowColor];//背景颜色
//            borderView.borderColor = [UIColor blackColor];//边框颜色
//            borderView.dashPattern = 6;
//            borderView.spacePattern = 6;
//            [self addSubview:borderView];
            */
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
