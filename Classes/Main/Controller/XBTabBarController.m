//
//  XBTabBarController.m
//  xinlang
//
//  Created by 小白 on 15/10/21.
//  Copyright (c) 2015年 小白. All rights reserved.
//

#import "XBTabBarController.h"
#import "UIImage+Image.h"
#import "XBTabBar.h"
#import "XBDiscoverController.h"

@interface XBTabBarController () <XBTabBarDelegate>
@property (nonatomic,strong)NSMutableArray *items;
@end

@implementation XBTabBarController

//个人是这么理解的 bar的上层是tabbarcontroller 先把bar创建好，然后替换上，这个时候bar完全没有被使用，替换了后，xbtabbar的layoutsubviews才开始运行，这里肯定对tabbar做了赋值操作。所以在那里有4个subview

-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  NSLog(@"fun:%s 111 ",__func__);
    [self addAllChildViewController];
//    XBTabBar *bar = [[XBTabBar alloc] initWithFrame:self.tabBar.frame];
//        NSLog(@"fun:%s 222 ",__func__);
//    UITabBar *bar1 = [[UITabBar alloc]init];
//    [self setValue:bar forKeyPath:@"tabBar"];
//         NSLog(@"fun:%s 333 ",__func__);
    [self setUpTabBar];
}

-(void)setUpTabBar
{
    XBTabBar *bar = [[XBTabBar alloc] initWithFrame:self.tabBar.frame];
    bar.backgroundColor = [UIColor whiteColor];
    bar.delegate = self;
    bar.items = self.items;
    [self.view addSubview:bar];
    [self.tabBar removeFromSuperview];
    
    
}

-(void)tabBar:(UITabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}


//不清楚这个是在干啥

//+ (void)initialize{
//    
//    // 获取当前这个类下面的所有tabBarItem
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
//    
//    NSMutableDictionary *att = [NSMutableDictionary dictionary];
//    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    //    [att setObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
//    
//    [item setTitleTextAttributes:att forState:UIControlStateSelected];
//    
//}


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
    
    XBDiscoverController *discover = [[XBDiscoverController alloc] init];
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
    //controller.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",value];
    NSLog(@"test");
    [self.items addObject:controller.tabBarItem];
    
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
