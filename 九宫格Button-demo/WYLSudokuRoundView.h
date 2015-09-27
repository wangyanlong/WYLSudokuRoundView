//
//  SudokuRoundView.h
//  九宫格Button-demo
//
//  Created by 王颜龙 on 13-5-16.
//  Copyright (c) 2013年 longyan. All rights reserved.
//

#import "LBorderView.h"

@interface WYLSudokuRoundView : LBorderView

//9宫格代码固定创建方法
- (id)initWithFrame:(CGRect)frame WithSubImageViewArray:(NSMutableArray *)array;

//9宫格xib减方法
- (id)initWithFrame:(CGRect)frame WithXIBSubImageViewArray:(NSMutableArray *)array WithMessageNotRead:(int)messgae;

//9宫格xib加方法
+ (WYLSudokuRoundView *)createSudokuRoundViewWithFrame:(CGRect)frame WithXIBSubImageViewArray:(NSMutableArray *)array WithMessageNotRead:(int)messgae;

@end
