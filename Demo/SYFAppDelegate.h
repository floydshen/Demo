//
//  SYFAppDelegate.h
//  Demo
//
//  Created by floyd on 13-5-15.
//  Copyright (c) 2013年 floyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYFAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
