//
//  SYFMapViewController.m
//  Demo
//
//  Created by floyd on 13-5-16.
//  Copyright (c) 2013年 floyd. All rights reserved.
//

#import "SYFMapViewController.h"
#import "SYFDefaultAnnotation.h"

@interface SYFMapViewController () <MKMapViewDelegate>

@property (nonatomic, retain) MKMapView *mapView;

@end

@implementation SYFMapViewController

- (void)dealloc
{
    [super dealloc];
}

- (id)init
{
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Map", @"Map Comment");
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog([[NSString alloc] initWithFormat:@"---------height:%f, width:%f, x:%f, y:%f",self.view.bounds.size.height,self.view.bounds.size.width,self.view.bounds.origin.x, self.view.bounds.origin.y]);
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
//    CLLocationCoordinate2D coordinate = LLocationManager.
//    [self.mapView setRegion:MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(DEFAULT_MAP_SPAN, DEFAULT_MAP_SPAN)) animated:YES];
    
//    OCMapViewSampleHelpAnnotation *annotation = [[OCMapViewSampleHelpAnnotation alloc] initWithCoordinate:loc.coordinate];
//    [annotationsToAdd addObject:annotation];
    
//    [self getLocation];
    
    [self.view addSubview:self.mapView];
    
    for (NSInteger i = 0; i < 100; i++) {
        
        
        [self.mapView addAnnotation:@""];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//_____________________________
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"****************regionWillChangeAnimated");
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    DLog(@"****************regionDidChangeAnimated:%d", [mapView.annotations count]);
//    DLog(@"map region did changed, animated is %@", animated ? @"YES" : @"NO");
    [self requestForDate];
    
    
}

- (void)requestForDate
{
    // map api
    
}




//_____________________________
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    NSLog(@"****************mapViewWillStartLoadingMap");
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    NSLog(@"****************mapViewDidFinishLoadingMap");
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    NSLog(@"****************mapViewDidFailLoadingMap");
}

//_____________________________
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSLog(@"****************viewForAnnotation");
    MKAnnotationView *annView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    annView.annotation = annotation;
    annView.image = [UIImage imageNamed:@"marker-orange.png"];
    annView.canShowCallout = NO;
    return annView;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"****************didAddAnnotationViews");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"****************annotationView");
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"****************didSelectAnnotationView");
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"****************didDeselectAnnotationView");
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    NSLog(@"****************mapViewWillStartLocatingUser");
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    NSLog(@"****************mapViewDidStopLocatingUser");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"****************didUpdateUserLocation");
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"****************didFailToLocateUserWithError");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"****************didChangeDragState");
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    NSLog(@"****************viewForOverlay");
    return nil;
}

// Called after the provided overlay views have been added and positioned in the map.
- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews
{
    NSLog(@"****************didAddOverlayViews");
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    NSLog(@"****************didChangeUserTrackingMode");
}

- (CLLocation *)getLocation
{
    // Get random coordinates
    CLLocationDistance latitude = ((float)arc4random() / ARC4RANDOM_MAX) * 180.0 - 90.0;    // the latitude goes from +90° - 0 - -90°
    CLLocationDistance longitude = ((float)arc4random() / ARC4RANDOM_MAX) * 360.0 - 180.0;  // the longitude goes from +180° - 0 - -180°
    
    // This is a fix, because the randomizing above can fail
    latitude = MIN(90.0, latitude);
    latitude = MAX(-90.0, latitude);
    
    longitude = MIN(180.0, longitude);
    longitude = MAX(-180.0, longitude);
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    return loc;
}

@end
