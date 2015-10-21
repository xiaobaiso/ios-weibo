//
//  XBTabBarController.m
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "XBTabBarController.h"
#import "UIImage+Image.h"
@interface XBTabBarController ()

@end

@implementation XBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addAllChildViewController];
}

#pragma 再次进行封装

// 在ios7之后，默认会把UITabBar上面的按钮图片渲染成蓝色 使用分类能够解决这个问题
// tabBarItem:决定着tabBars上按钮的内容
-(void)addAllChildViewController{

    UIViewController *home = [[UIViewController alloc] init];
    [self setUpOneChildViewControllerWithController:home andName:@"首页" andImage:@"tabbar_home" selectImage:@"tabbar_home_selected" andValue:3];
    home.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:home];
    
    UIViewController *message = [[UIViewController alloc] init];
    message.view.backgroundColor = [UIColor blueColor];
    [self setUpOneChildViewControllerWithController:message andName:@"消息" andImage:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected" andValue:33];
    [self addChildViewController:message];
    
    UIViewController *discover = [[UIViewController alloc] init];
    discover.view.backgroundColor = [UIColor blackColor];
    [self setUpOneChildViewControllerWithController:discover andName:@"发现" andImage:@"tabbar_discover" selectImage:@"tabbar_discover_selected" andValue:5];
    [self addChildViewController:discover];
    
    UIViewController *profile = [[UIViewController alloc] init];
    profile.view.backgroundColor = [UIColor greenColor];
    [self setUpOneChildViewControllerWithController:profile andName:@"我" andImage:@"tabbar_profile" selectImage:@"tabbar_profile_selected" andValue:2];
    [self addChildViewController:profile];
    
}

-(void)setUpOneChildViewControllerWithController:(UIViewController *)vc andName:(NSString *)name andImage:(NSString *)image  selectImage:(NSString *)selectImage andValue:(NSInteger )value
{
    UIViewController *controller = vc;
    controller.tabBarItem.title = name;
    controller.tabBarItem.image = [UIImage imageWithOriginalName:image];//这里用的就是真实地颜色了`
    controller.tabBarItem.selectedImage = [UIImage imageWithOriginalName:selectImage];;
    controller.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",value];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
