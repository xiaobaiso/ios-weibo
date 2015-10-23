//
//  UIImage+Image.h
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIImage (Image)
// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;
+ (instancetype)imageWithStretchableName:(NSString *)imageName;
@end
