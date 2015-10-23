//
//  XBTabBar.h
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XBTabBar;
@protocol XBTabBarDelegate <NSObject>

@optional
-(void)tabBar:(XBTabBar *)tabBar didClickButton:(NSInteger)index;
@end


@interface XBTabBar : UIView
@property (nonatomic,strong)NSArray *items;
@property (nonatomic,weak)id <XBTabBarDelegate> delegate;
@end
