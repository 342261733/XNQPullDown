//
//  XNQPullDownView.m
//  StoreSystem
//
//  Created by xunianqiang on 15/4/29.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQPullDownView.h"



@implementation XNQPullDownView


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XNQ_WIDTH, XNQ_HEITHT-frame.origin.y)];
        [bgView setBackgroundColor:[UIColor blackColor]];
        bgView.alpha = 0.5;
        [self addSubview:bgView];
        self.commonTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width/2, bgView.bounds.size.height/2)];
        [self addSubview:self.commonTableView];
        self.subTableView = [[UITableView alloc]initWithFrame:CGRectMake(frame.size.width/2, 0, frame.size.width/2, bgView.bounds.size.height/2)];
        [self addSubview:self.subTableView];
        
        [self setHidden:YES];

        
        
    }
    return self;
}


-(void)showView
{
    [self setHidden:NO];
    //        int sectionWidth = XNQ_WIDTH/2;
    CGRect rect = self.commonTableView.frame;
    rect.size.height = 0;
    CGRect rect2 = self.subTableView.frame;
    rect2.size.height = 0;
    self.commonTableView.frame = rect;
    self.subTableView.frame = rect2;
    
    //动画设置位置
    rect.size.height = self.bounds.size.height/2;
    rect2.size.height = rect.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.commonTableView.alpha = 0.2;
        self.subTableView.alpha = 0.2;
        
        self.commonTableView.alpha = 1.0;
        self.subTableView.alpha = 1.0;
        self.commonTableView.frame =  rect;
        self.subTableView.frame = rect2;
    } completion:^(BOOL finished) {}];
    //
}

-(void)hidenView
{
    CGRect rect = self.commonTableView.frame;
    CGRect rect2 = self.subTableView.frame;
    
    //动画设置位置
    rect.size.height = 0;
    rect2.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.commonTableView.alpha = 0.2;
        self.subTableView.alpha = 0.2;
        self.commonTableView.alpha = 1.0;
        self.subTableView.alpha = 1.0;
        self.commonTableView.frame =  rect;
        self.subTableView.frame = rect2;
    } completion:^(BOOL finished) {
        [NSThread sleepForTimeInterval:0.1];
        [self setHidden:YES];

//        [UIView animateWithDuration:0.001 animations:^{
//        } completion:^(BOOL finished) {
//            
//        }];
        
    }];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
