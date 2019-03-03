//
//  AiTabBarController.m
//  AiBarBar
//
//  Created by Aiewing on 2019/3/4.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#import "AiTabBarController.h"
#import "AiController_1.h"
#import "AiController_2.h"
#import "AiController_3.h"
#import "AiController_4.h"

@interface AiTabBarController ()

@end

@implementation AiTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}

- (void)initUI {
    AiController_1 *ctl1 = [[AiController_1 alloc] init];
    ctl1.title = @"Aie1";
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:ctl1];
    ctl1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"开森" image:[[UIImage imageNamed:@"happy"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"happy_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    AiController_2 *ctl2 = [[AiController_2 alloc] init];
    ctl2.title = @"Aie2";
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:ctl2];
    ctl2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"南过" image:[[UIImage imageNamed:@"pumpkin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"pumpkin_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    AiController_3 *ctl3 = [[AiController_3 alloc] init];
    ctl3.title = @"Aie3";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:ctl3];
    ctl3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"桃厌" image:[[UIImage imageNamed:@"peach"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"peach_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    AiController_4 *ctl4 = [[AiController_4 alloc] init];
    ctl4.title = @"Aie4";
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:ctl4];
    ctl4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"西欢" image:[[UIImage imageNamed:@"watermelon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"watermelon_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4];
    
}

@end
