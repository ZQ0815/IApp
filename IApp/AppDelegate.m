//
//  AppDelegate.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VideoController/VideoController.h"
#import "RecommendController/RecommendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置c初始window，作用代替Main.storyboard
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    //定义UITabBar
    UITabBarController * tabController = [[UITabBarController alloc] init];
    //新闻页面、初始页面
    ViewController * newsController = [[ViewController alloc] init];
    //视屏页面
    VideoController * videController = [[VideoController alloc] init];
    //推荐页面
    RecommendViewController *recommentController = [[RecommendViewController alloc] init];
    
    //往tabController中添加导航页面
    [tabController setViewControllers:@[videController, newsController, recommentController]];
    
    //指定UINavigationController为rootViewController，并且指定viewController为UITabBarController的第一个视图控制器
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:tabController];
    //指定初始rootViewController为navController，
    self.window.rootViewController = navController;
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
