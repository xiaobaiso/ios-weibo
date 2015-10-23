//
//  XBTabBarButton.m
//  xinlang
//
//  Created by 小白 on 15/10/23.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "XBTabBarButton.h"

@interface XBTabBarButton ()

//@property (nonatomic,weak)

@end



@implementation XBTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}


//KVO观察者模式
/*
 在这里注册观察者，然后只要观察的对象出现了改变就立即通知观察者。

 
 */
-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
}


//这里继承了UIBUTTON 我们拖控件的时候都是title在button的正中间的，但是这里做了一个变化，一个按钮，70%是图片，30%是文字，而且这两者加一起就是整个按钮
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;//经验值
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height * 0.3;
    
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    
}
@end
