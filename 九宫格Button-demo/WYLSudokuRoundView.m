//
//  SudokuRoundView.m
//  九宫格Button-demo
//
//  Created by 王颜龙 on 13-5-16.
//  Copyright (c) 2013年 longyan. All rights reserved.
//

#import "WYLSudokuRoundView.h"
#import "UIImageView+WebCache.h"
#import "JSBadgeView.h"

#define kWidth  2.0   //宽间距
#define kHeight 2.0  //高间距
#define ImageX kWidth   //位置 - x
#define ImageY kHeight  //位置 - y
#define ImageWidth (frame.size.width - (kWidth * 4))/3.0     //size - 宽
#define ImageHeight (frame.size.height - (kHeight * 4))/3.0  //size - 高

@implementation SudokuRoundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//9宫格代码固定创建方法
- (id)initWithFrame:(CGRect)frame WithSubImageViewArray:(NSMutableArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        self.cornerRadius = 3;//圆角弧度
        self.borderType = BorderTypeSolid;//边框类型
        self.borderWidth = 1.5;//边框宽度
        self.backgroundColor = [UIColor whiteColor];//背景颜色
        self.borderColor = [UIColor blackColor];//边框颜色
        self.dashPattern = 6;
        self.spacePattern = 6;
        
        for (NSString *imageStr in array) {
            
            static int i = 0;
            
            UIImageView *subImageView = [[UIImageView alloc]init];
            [subImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageStr]] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]]];
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

/**
 *  frame : 图片范围
 *  array : 图像数据数组
 *  message : 未读消息数字
 */

- (id)initWithFrame:(CGRect)frame WithXIBSubImageViewArray:(NSMutableArray *)array WithMessageNotRead:(int)messgae{
    self = [super initWithFrame:frame];
    if (self) {
        
        //当url超过10条的时候，自动显示9个头像
        NSUInteger maxNum = 0;
        if (array.count > 9) {
            maxNum = 9;
        }else{
            maxNum = array.count;
        }
        
        //从xib中返回实例
        self = [self initWithME:maxNum -1];
        
        //进行判断加载
        /*
        switch (array.count) {
            case 1:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 2:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 3:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 4:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 5:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 6:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 7:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 8:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            case 9:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
            default:
            {
                [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
            }
                break;
        }*/
        if (array.count) {
            [self initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
        }
    }
    return self;
}

//返回对应实例
- (WYLSudokuRoundView *)initWithME:(NSUInteger)object
{
    return [[[NSBundle mainBundle]loadNibNamed:@"SudokuRoundView" owner:self options:nil]objectAtIndex:object];
}

//返回对应实例
+ (WYLSudokuRoundView *)initWithSudokuRoundView:(NSUInteger)object
{
    return [[[NSBundle mainBundle]loadNibNamed:@"SudokuRoundView" owner:self options:nil]objectAtIndex:object];
}

//加载图片
- (void)initWithTag:(NSUInteger)tag WithFrame:(CGRect)frame WithArray:(NSMutableArray *)array WithMessageNotRead:(int)messgae{
    
    //初始化数据
    [self makeView:frame];
    
    for (NSString *imageStr in array) {
        
        static int i = 0;
        
        UIImageView *imageView = (UIImageView *)[self viewWithTag:tag+i];
        //SDWebImage的方法
        [imageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageStr]]];
        
        //badge图标
        JSBadgeView *badgeView = [[JSBadgeView alloc] initWithParentView:self alignment:JSBadgeViewAlignmentTopRight];
        
        badgeView.badgeText = [NSString stringWithFormat:@"%d", messgae];

        i ++;
        
        //超过9次放弃加载
        if (i>=9) {
            break;
        }
    }
}

//初始化数据
- (void)makeView:(CGRect)frame
{
    self.cornerRadius = 3;//圆角弧度
    self.borderType = BorderTypeSolid;//边框类型
    self.borderWidth = 1.5;//边框宽度
    self.backgroundColor = [UIColor whiteColor];//背景颜色
    self.borderColor = [UIColor blackColor];//边框颜色
    self.dashPattern = 6;
    self.spacePattern = 6;
    self.frame = frame;
}

/** 9宫格xib加方法
 *  frame : 图片范围
 *  array : 图像数据数组
 *  message : 未读消息数字
 */
+ (WYLSudokuRoundView *)createSudokuRoundViewWithFrame:(CGRect)frame WithXIBSubImageViewArray:(NSMutableArray *)array WithMessageNotRead:(int)messgae{
    
    NSUInteger maxNum = 0;
    //判断最多9个头像
    if (array.count > 9) {
        maxNum = 9;
    }else{
        maxNum = array.count;
    }
    
    //加载对应的xib
    WYLSudokuRoundView *sudokuRoundView = [self initWithSudokuRoundView:maxNum -1];

    if (array.count) {
        [sudokuRoundView initWithTag:maxNum *100 WithFrame:frame WithArray:array WithMessageNotRead:messgae];
    }
    
    return sudokuRoundView;
}



@end
