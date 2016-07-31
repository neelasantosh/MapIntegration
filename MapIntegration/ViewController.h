//
//  ViewController.h
//  MapIntegration
//
//  Created by Rajesh on 19/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *labelData;
@property (strong, nonatomic) IBOutlet MKMapView *cdacMapView;

@property CLLocationManager *locManager;


-(void)onMapLongPress : (UILongPressGestureRecognizer *)gesture;
@end

