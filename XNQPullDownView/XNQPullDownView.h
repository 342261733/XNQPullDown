//
//  XNQPullDownView.h
//  StoreSystem
//
//  Created by xunianqiang on 15/4/29.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


#define XNQ_WIDTH [[UIScreen mainScreen] bounds].size.width
#define XNQ_HEITHT [[UIScreen mainScreen] bounds].size.height

@interface XNQPullDownView : UIView

@property (nonatomic,strong) UITableView *commonTableView;
@property (nonatomic,strong) UITableView *subTableView;


-(void)showView;
-(void)hidenView;


@end
