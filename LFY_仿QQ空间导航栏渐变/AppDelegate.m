//
//  AppDelegate.m
//  LFY_仿QQ空间导航栏渐变
//
//  Created by apple on 17/4/17.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[RootViewController new]];
    _window.rootViewController = nav;
    [self setNavigationBarBackgroudImage:nav];
    [_window makeKeyAndVisible];
    return YES;
}
//设置导航栏的背景图
- (void)setNavigationBarBackgroudImage:(UINavigationController *)nav{
    [nav.navigationBar setTintColor:[UIColor whiteColor]];
    UIImage *backgroundImage =   [UIImage imageNamed:@"jinan_nav_bg"];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNavigation = nav.navigationBar.frame;
    CGSize titleSize = CGSizeMake(rectNavigation.size.width, rectStatus.size.height + rectNavigation.size.height);
    
    UIGraphicsBeginImageContext(titleSize);
    [backgroundImage drawInRect:CGRectMake(0, 0, titleSize.width, titleSize.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    backgroundImage = scaledImage;//设置图片的大小与Navigation Bar相同
    [nav.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];  //设置背景
    
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
