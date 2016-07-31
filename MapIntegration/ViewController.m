//
//  ViewController.m
//  MapIntegration
//
//  Created by Rajesh on 19/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "CDACAnnotation.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize cdacMapView,labelData,locManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locManager = [[CLLocationManager alloc]init];
    [locManager requestWhenInUseAuthorization];
    locManager = [[CLLocationManager alloc]init];
    locManager.delegate = self;

    
    //map properties
    cdacMapView.delegate = self;
    [cdacMapView setZoomEnabled:true];
    [cdacMapView setMapType:MKMapTypeStandard];
    
    [locManager requestWhenInUseAuthorization];
    [locManager startUpdatingLocation];
    
    //display some pics on map
    CLLocationCoordinate2D locPune = CLLocationCoordinate2DMake(18.56483,73.807518 );
    CLLocationCoordinate2D locMumbai = CLLocationCoordinate2DMake(19.0704, 72.8740);
    CLLocationCoordinate2D locBanglore= CLLocationCoordinate2DMake(12.9156,77.5590);
    
    CDACAnnotation *puneAnnotation = [[CDACAnnotation alloc]initWithTitle:@"CDAC Pune" address:@"Westend,Aundh" courses:@"DMC,DAC,VLSI" coordinate:locPune];

    
    CDACAnnotation *mumbaiAnnotation = [[CDACAnnotation alloc]initWithTitle:@"CDAC Mumbai" address:@"Juhu" courses:@"DMC,DAC" coordinate:locMumbai];

    
    CDACAnnotation *bangloreAnnotation = [[CDACAnnotation alloc]initWithTitle:@"CDAC Banglore" address:@"Ambedkar Veedhi" courses:@"DMC,DAC,WSDM" coordinate:locBanglore];
    
    [cdacMapView addAnnotation:puneAnnotation];
    [cdacMapView addAnnotation:mumbaiAnnotation];
    [cdacMapView addAnnotation:bangloreAnnotation];
    
    //attach longpress gesture recognizer with map
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onMapLongPress:)];

    
    [cdacMapView addGestureRecognizer:longPressRecognizer];
    
    [cdacMapView setUserInteractionEnabled:true];
    
    longPressRecognizer.minimumPressDuration = 1;//one second to press for
    
    
    
}//eof view did load

//handle pin selection
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    CDACAnnotation *selectedCDAC = [view annotation];
    labelData.text = selectedCDAC.courses;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)onMapLongPress : (UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint pointOfTouch = [gesture locationInView:cdacMapView];
        
        //convert x,y to lat,long
        CLLocationCoordinate2D loc= [cdacMapView convertPoint:pointOfTouch toCoordinateFromView:cdacMapView];
       // labelData.text = [NSString stringWithFormat:@"%f,%f",loc.latitude,loc.longitude];
        
       CLLocation *location1 = [[CLLocation alloc]initWithLatitude:loc.latitude longitude:loc.longitude];
       CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
        [geoCoder reverseGeocodeLocation:location1 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
        {
            CLPlacemark *place = [placemarks objectAtIndex:0];
            NSLog(@"Address:%@",[place.addressDictionary objectForKey:@"FormattedAddressLines"]);
            labelData.text = [place.addressDictionary objectForKey:@"State"];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Address" message:[place.addressDictionary objectForKey:@"FormattedAddressLines"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }];
        
    }
    
}
@end
