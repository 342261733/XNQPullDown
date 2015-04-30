//
//  ViewController.m
//  XNQPullDownView
//
//  Created by xunianqiang on 15/4/30.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "ViewController.h"

#import "XNQPullDownView.h"
#import "XNQSegmentView.h"

@interface ViewController ()<XNQSegmentDelegate>
{
    XNQPullDownView *pullDownView ;
    NSInteger _lastClickIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationItem setTitle:@"hello"];
    
    
    [self.view setBackgroundColor:[UIColor colorWithRed:120.0/255 green:120.0/255 blue:120.0/255 alpha:1.0]];
    
    _lastClickIndex= -1;
    XNQSegmentView *mySegment = [[XNQSegmentView alloc]initWithFrame:CGRectMake(0, 64, XNQ_WIDTH, XNQ_WIDTH*30/320) Delegate:self TitleArray:@[@"哈哈哈哈",@"呵呵呵呵",@"嘿嘿嘿嘿",@"嘻嘻嘻嘻"] Selected:3];
    [self.view addSubview:mySegment];
    
    XNQSegmentView *mySegment2 = [[XNQSegmentView alloc]initWithNormalFrame:CGRectMake(0, 360, XNQ_WIDTH, XNQ_WIDTH*30/320) Delegate:self TitleArray:@[@"哈哈哈哈",@"呵呵呵呵",@"嘿嘿嘿嘿",@"嘻嘻嘻嘻"] Selected:3];
    [self.view addSubview:mySegment2];
    
    
    pullDownView = [[XNQPullDownView alloc]initWithFrame:CGRectMake(0,XNQ_WIDTH*30/320+64, XNQ_WIDTH, XNQ_HEITHT-64+XNQ_WIDTH*30/320)];
    [self.view addSubview:pullDownView];
    
}


#pragma mark -- XNQSegmentDelegate
-(void)buttonClickIndex:(NSInteger)index
{
    NSLog(@"cuurent button index is %lu",index);
    if (_lastClickIndex == index) {
        [pullDownView hidenView];
        _lastClickIndex = -1;
        return;
    }
    else{
        [pullDownView showView];
    }
    _lastClickIndex = index;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
