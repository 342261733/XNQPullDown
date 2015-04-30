//
//  XNQSegmentView.h
//  StoreSystem
//
//  Created by xunianqiang on 15/4/29.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XNQSegmentDelegate <NSObject>

@optional
-(void)buttonClickIndex:(NSInteger)index;
@end


#define SECTION_BTN_TAG   1000
#define SECTION_IV_TAG   2000
#define SECTION_IVBar_TAG  3000
@interface XNQSegmentView : UIView

@property (nonatomic, assign) id<XNQSegmentDelegate> segmentDelegate;

//without arrow
- (id)initWithNormalFrame:(CGRect)frame Delegate:(id)delegate TitleArray:(NSArray *)titleArr Selected:(NSInteger)selected;
//with arrow
- (id)initWithFrame:(CGRect)frame Delegate:(id)delegate TitleArray:(NSArray *)titleArr Selected:(NSInteger)selected;

@end
