//
//  SYFDefaultAnnotation.h
//  Demo
//
//  Created by floyd on 13-5-20.
//  Copyright (c) 2013年 floydshen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface SYFDefaultAnnotation : NSObject<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
@end
