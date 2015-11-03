//
//  ZHEntranceTabBarController.m
//  MMeiTuan
//
//  Created by Zheng on 15/10/30.
//  Copyright © 2015年 zhr. All rights reserved.
//
// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(152, 200, 60)
#define separaterColor RGB(200, 199, 204)
#define selectColor RGB(46, 158, 138)



#import "ZHEntranceTabBarController.h"

@interface ZHEntranceTabBarController ()

@end

@implementation ZHEntranceTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabbarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTabbarItem{
    UITabBar   * tabBar = self.tabBar;
    UITabBarItem   *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem   *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem   *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem   *item3 = [tabBar.items objectAtIndex:3];
    
    item0.selectedImage = [[UIImage imageNamed:@"selecte_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item1.selectedImage = [[UIImage imageNamed:@"select_onsite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"onsite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"selecte_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"selecte_misc"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"misc"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:navigationBarColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    
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
