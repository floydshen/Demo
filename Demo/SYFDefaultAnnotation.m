//
//  SYFDefaultAnnotation.m
//  Demo
//
//  Created by floyd on 13-5-20.
//  Copyright (c) 2013年 floydshen. All rights reserved.
//

#import "SYFDefaultAnnotation.h"

@implementation SYFDefaultAnnotation
+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate {
    return [[[self class] alloc] initWithCoordinate:coordinate];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    if(nil != self) {
        self.coordinate = coordinate;
    }
    return self;
}
@end
