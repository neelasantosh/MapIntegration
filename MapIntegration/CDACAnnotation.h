//
//  CDACAnnotation.h
//  MapIntegration
//
//  Created by Rajesh on 19/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CDACAnnotation : NSObject<MKAnnotation>

@property NSString *address;
@property NSString *courses;

-(id)initWithTitle:(NSString *)title address:(NSString *)address courses:(NSString *)course coordinate:(CLLocationCoordinate2D)coordinate;

@end
