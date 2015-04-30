//
//  XNQSegmentView.m
//  StoreSystem
//
//  Created by xunianqiang on 15/4/29.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQSegmentView.h"

@implementation XNQSegmentView
{
    NSInteger currentSection;
    CGFloat sectionWidth;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithNormalFrame:(CGRect)frame Delegate:(id)delegate TitleArray:(NSArray *)titleArr Selected:(NSInteger)selected
{
    self = [super initWithFrame:frame];
    if (self) {
        currentSection = titleArr.count;
        self.backgroundColor = [UIColor whiteColor];
        self.segmentDelegate = delegate;
        
        if (titleArr.count == 0) {
            self = nil;
        }
        NSInteger sectionNum = titleArr.count;
        sectionWidth = (1.0*(frame.size.width)/sectionNum);
        for (int i = 0; i <sectionNum; i++) {
            UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(sectionWidth*i, 1, sectionWidth, frame.size.height-2)];
            sectionBtn.tag = SECTION_BTN_TAG + i;
            [sectionBtn addTarget:self action:@selector(sectionBtnClickNormal:) forControlEvents:UIControlEventTouchUpInside];
            [sectionBtn  setTitle:titleArr[i] forState:UIControlStateNormal];
            [sectionBtn setTitleColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0] forState:UIControlStateNormal];
            sectionBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
            [self addSubview:sectionBtn];
            
            
            
            if (i == selected) {
                [sectionBtn setTitleColor:[UIColor colorWithRed:21.0/255 green:183.0/255 blue:78.0/255 alpha:1.0] forState:UIControlStateNormal];
            }
            
        }
        
        UIImageView *sectionBarIv = [[UIImageView alloc] initWithFrame:CGRectMake(sectionWidth*selected, self.frame.size.height-2, sectionWidth, 2)];
        [sectionBarIv setImage:[UIImage imageNamed:@"rectangularpressed"]];
        sectionBarIv.tag = SECTION_IVBar_TAG;
        [self addSubview: sectionBarIv];
        
    }
    return self;
}

-(void)sectionBtnClickNormal:(UIButton *)btn
{
    NSInteger section = btn.tag - SECTION_BTN_TAG;
    if ([self.segmentDelegate respondsToSelector:@selector(buttonClickIndex:)]) {
        [self.segmentDelegate buttonClickIndex:section];
    }
    
    for (int i = 0; i<currentSection; i++) {
        if (i == section) {
            [btn setTitleColor:[UIColor colorWithRed:21.0/255 green:183.0/255 blue:78.0/255 alpha:1.0] forState:UIControlStateNormal];
        }
        else{
            UIButton *otherBtn = (UIButton *)[self viewWithTag:(i+SECTION_BTN_TAG)];
            [otherBtn setTitleColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0] forState:UIControlStateNormal];
        }
    }
    UIImageView *sectionBarIv = (UIImageView *)[self viewWithTag:SECTION_IVBar_TAG];
    [UIView animateWithDuration:0.25 animations:^{
        [sectionBarIv setFrame:CGRectMake(section*sectionWidth, sectionBarIv.frame.origin.y, sectionBarIv.bounds.size.width, sectionBarIv.bounds.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}


- (id)initWithFrame:(CGRect)frame Delegate:(id)delegate TitleArray:(NSArray *)titleArr Selected:(NSInteger)selected
{
    self = [super initWithFrame:frame];
    if (self) {
        currentSection = titleArr.count;
        self.backgroundColor = [UIColor whiteColor];
        self.segmentDelegate = delegate;
        
        if (titleArr.count == 0) {
            self = nil;
        }
        NSInteger sectionNum = titleArr.count;
        sectionWidth = (1.0*(frame.size.width)/sectionNum);
        for (int i = 0; i <sectionNum; i++) {
            UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(sectionWidth*i, 1, sectionWidth-13*sectionWidth/80, frame.size.height-2)];
            sectionBtn.tag = SECTION_BTN_TAG + i;
            [sectionBtn addTarget:self action:@selector(sectionBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
            [sectionBtn  setTitle:titleArr[i] forState:UIControlStateNormal];
            sectionBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
            [sectionBtn setTitleColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0] forState:UIControlStateNormal];
            sectionBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
            [self addSubview:sectionBtn];
            
            
            UIImageView *sectionIv = [[UIImageView alloc] initWithFrame:CGRectMake(sectionWidth*i +(sectionWidth - 16.5*sectionWidth/80), (self.frame.size.height-7/2)/2, 13/2, 7/2)];
            [sectionIv setImage:[UIImage imageNamed:@"triangle_normal"]];
            [sectionIv setContentMode:UIViewContentModeScaleToFill];
            sectionIv.tag = SECTION_IV_TAG + i;
            [self addSubview: sectionIv];
            
            
            if (i == selected) {
                [sectionBtn setTitleColor:[UIColor colorWithRed:21.0/255 green:183.0/255 blue:78.0/255 alpha:1.0] forState:UIControlStateNormal];
                [sectionIv setImage:[UIImage imageNamed:@"triangle_pressed"]];
            }
            
        }
        
        UIImageView *sectionBarIv = [[UIImageView alloc] initWithFrame:CGRectMake(sectionWidth*selected, self.frame.size.height-2, sectionWidth, 2)];
        [sectionBarIv setImage:[UIImage imageNamed:@"rectangularpressed"]];
        sectionBarIv.tag = SECTION_IVBar_TAG;
        [self addSubview: sectionBarIv];
        
    }
    return self;
}

-(void)sectionBtnTouch:(UIButton *)btn
{
    NSInteger section = btn.tag - SECTION_BTN_TAG;
    if ([self.segmentDelegate respondsToSelector:@selector(buttonClickIndex:)]) {
        [self.segmentDelegate buttonClickIndex:section];
    }
    
    for (int i = 0; i<currentSection; i++) {
        if (i == section) {
            [btn setTitleColor:[UIColor colorWithRed:21.0/255 green:183.0/255 blue:78.0/255 alpha:1.0] forState:UIControlStateNormal];
            UIImageView *currentIV= (UIImageView *)[self viewWithTag:(SECTION_IV_TAG +section)];
            [currentIV setImage:[UIImage imageNamed:@"triangle_pressed"]];
        }
        else{
            UIButton *otherBtn = (UIButton *)[self viewWithTag:(i+SECTION_BTN_TAG)];
            [otherBtn setTitleColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0] forState:UIControlStateNormal];
            UIImageView *currentIV= (UIImageView *)[self viewWithTag:(i+SECTION_IV_TAG)];
            [currentIV setImage:[UIImage imageNamed:@"triangle_normal"]];
        }
    }
    UIImageView *sectionBarIv = (UIImageView *)[self viewWithTag:SECTION_IVBar_TAG];
    [UIView animateWithDuration:0.25 animations:^{
        [sectionBarIv setFrame:CGRectMake(section*sectionWidth, sectionBarIv.frame.origin.y, sectionBarIv.bounds.size.width, sectionBarIv.bounds.size.height)];
 

    } completion:^(BOOL finished) {
        
    }];

    
}




@end
