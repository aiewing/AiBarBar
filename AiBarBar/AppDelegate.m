//
//  AppDelegate.m
//  AiBarBar
//
//  Created by Aiewing on 2019/3/3.
//  Copyright © 2019 Aiewing. All rights reserved.
//

#import "AppDelegate.h"
#import "AiTabBarController.h"
#import "AiController_1.h"
#import "AiController_2.h"
#import "AiController_3.h"
#import "AiController_4.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)initUI {
    AiController_1 *ctl1 = [[AiController_1 alloc] init];
    ctl1.title = @"Aie1";
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:ctl1];
    
    AiController_2 *ctl2 = [[AiController_2 alloc] init];
    ctl2.title = @"Aie2";
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:ctl2];
    
    AiController_3 *ctl3 = [[AiController_3 alloc] init];
    ctl3.title = @"Aie3";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:ctl3];
    
    AiController_4 *ctl4 = [[AiController_4 alloc] init];
    ctl4.title = @"Aie4";
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:ctl4];
    
    AiTabBarController *ctl = [[AiTabBarController alloc] initTabBarWithControllers:@[nav1, nav2, nav3, nav4]
                            titles:@[@"开森", @"南过", @"桃厌", @"西欢"]
                       titleColors:nil
                 selectTitleColors:nil
                            images:@[[[UIImage imageNamed:@"happy"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"pumpkin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"peach"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"watermelon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]
                      selectImages:@[[[UIImage imageNamed:@"happy_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"pumpkin_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"peach_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
                                     [[UIImage imageNamed:@"watermelon_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    self.window.rootViewController = ctl;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window= [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    
    [self initUI];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
