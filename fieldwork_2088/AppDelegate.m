//
//  AppDelegate.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "AppDelegate.h"

#import "RootVC.h"
#import "LoginVC.h"
#import "AllVC.h"
#import "StartVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[AllVC alloc] init];
     [self.window makeKeyAndVisible];
    
    // 配置地图app_key
    [AMapServices sharedServices].apiKey = App_Map_Key;
    
    [self fitstOpenApp];
    
    
    /*
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog( @"%ld",(long)status);
//    }];
    [manager startMonitoring];
//    
    NSLog(@"%ld",(long)manager.networkReachabilityStatus);
    if (!manager.isReachable) {
        if (manager.isReachableViaWiFi) {
            NSLog(@"wifi");
        }
        else if (manager.isReachableViaWWAN) {
            NSLog(@"wlan");
        }
        else {
            
        }
    }

*/
    return YES;
}

//  引导页
- (void)fitstOpenApp {
    NSString *lastversion = [[NSUserDefaults standardUserDefaults] objectForKey:App_Last_Version];
    NSString *currentversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    if ([ConfigFunction xfunc_emptyWithString:lastversion] || ![lastversion isEqualToString:currentversion]) {
        // 开启引导页
        [[NSUserDefaults standardUserDefaults] setObject:currentversion forKey:App_Last_Version];
        self.window.rootViewController = [[StartVC alloc] init];
    }
    else {
        self.window.rootViewController = [[LoginVC alloc] init];
    }
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
