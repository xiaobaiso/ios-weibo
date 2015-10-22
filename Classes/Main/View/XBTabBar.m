//
//  XBTabBar.m
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "XBTabBar.h"

@interface XBTabBar ()

@property (nonatomic,weak) UIButton *plusButton;

@end

@implementation XBTabBar

- (UIButton *)plusButton
{
    NSLog(@"fun:%s",__func__);
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];

        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}


//这里应该是5个  说明self.items.count = 4
-(void)layoutSubviews{
    NSLog(@"fun:%s   num:%d",__func__,self.items.count);
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = h;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    int i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            i++;
        }

    }
    self.plusButton.center = CGPointMake(0.5*w, 0.5*h);
}




@end
