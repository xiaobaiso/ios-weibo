//
//  UIImage+Image.m
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (instancetype)imageWithOriginalName:(NSString *)imageName{
    UIImage *name = [UIImage imageNamed:imageName];
    return [name imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
