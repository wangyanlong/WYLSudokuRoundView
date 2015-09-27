//
//  ViewController.m
//  九宫格Button-demo
//
//  Created by 王颜龙 on 13-5-15.
//  Copyright (c) 2013年 longyan. All rights reserved.
//

#import "ViewController.h"
#import "LBorderView.h"
#import "WYLSudokuRoundView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //需要传入一个数组，arr.count对应头像数量，最多显示9个
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [array addObject:@"1"];
    [array addObject:@"2"];
    [array addObject:@"3"];
    [array addObject:@"4"];
    [array addObject:@"5"];
    [array addObject:@"6"];
    [array addObject:@"7"];
    [array addObject:@"8"];
    [array addObject:@"9"];

    
//    SudokuRoundView *headView = [[SudokuRoundView alloc]initWithFrame:CGRectMake(220, 110, 70, 70) WithXIBSubImageViewArray:array];
//    [self.view addSubview:headView];
    
    //加方法调用群组头像功能
    WYLSudokuRoundView *view = [WYLSudokuRoundView createSudokuRoundViewWithFrame:CGRectMake(20, 110, 70, 70) WithXIBSubImageViewArray:array WithMessageNotRead:0];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
