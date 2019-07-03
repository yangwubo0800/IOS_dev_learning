//
//  AppDelegate.m
//  BaseWebviewApp
//
//  Created by hongbo ni on 2019/5/31.
//  Copyright © 2019 hongbo ni. All rights reserved.
//

#import "AppDelegate.h"
#import "Webview/WebviewController.h"
#import "UserGuide/UserGuideView.h"
#import "Utils/Reachability.h"

#define MainScreen_width  [UIScreen mainScreen].bounds.size.width//宽
#define MainScreen_height [UIScreen mainScreen].bounds.size.height//高

@interface AppDelegate ()

@property (nonatomic, strong) Reachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //监听网络状态变化
    [self observerNetworkStatus];

    //window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // controller
    WebviewController *vc = [WebviewController shareInstance] ;
    
    //navigate controller
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];

    //root view
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    // add user guide view
    [self addUserGuideView];
    
    return YES;
}


-(void)addUserGuideView{
    /**
     可以在这里进行一个判断的设置，如果是app第一次启动就加载启动页，如果不是，则直接进入首页
     **/
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        // 这里判断是否第一次
        
        UserGuideView *hvc = [[UserGuideView alloc]initWithFrame:CGRectMake(0, 0, MainScreen_width, MainScreen_height)];
        
        [self.window.rootViewController.view addSubview:hvc];
        
        [UIView animateWithDuration:0.25 animations:^{
            hvc.frame = CGRectMake(0, 0, MainScreen_width, MainScreen_height);
            
        }];
        
    }
}

//监听网络状态变化
-(void) observerNetworkStatus{
    // 设置网络检测的站点
    NSString *remoteHostName = @"www.apple.com";
    //注册监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.reachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.reachability startNotifier];
    [self updateInterfaceWithReachability:self.reachability];
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.reachability)
    {
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        switch (netStatus)
        {
            case NotReachable:   {
                NSLog(@"没有网络！");
                break;
            }
            case ReachableViaWWAN: {
                NSLog(@"4G/3G");
                break;
            }
            case ReachableViaWiFi: {
                NSLog(@"WiFi");
                break;
            }
        }
    }
}


- (void)dealloc
{
    [self.reachability stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
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
