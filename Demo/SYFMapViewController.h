//
//  SYFMapViewController.h
//  Demo
//
//  Created by floyd on 13-5-16.
//  Copyright (c) 2013年 floyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s #%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

@interface SYFMapViewController : UIViewController

@end
