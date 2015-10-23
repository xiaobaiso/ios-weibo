//
//  UIView+Frame.m
//  xinlang
//
//  Created by 小白 on 15/10/23.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeigth:(CGFloat)heigth
{
    CGRect frame = self.frame;
    frame.size.height = heigth;
    self.frame = frame;
}

-(CGFloat)heigth{
    return self.frame.size.height;
}

@end
