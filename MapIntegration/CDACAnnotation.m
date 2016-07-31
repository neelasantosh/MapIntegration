//
//  CDACAnnotation.m
//  MapIntegration
//
//  Created by Rajesh on 19/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "CDACAnnotation.h"

@implementation CDACAnnotation
@synthesize courses,address,title,coordinate;


-(id)initWithTitle:(NSString *)title address:(NSString *)address courses:(NSString *)courses coordinate:(CLLocationCoordinate2D)coordinate
{
    
    self = [super init];
    self.address = address;
    self.courses = courses;
    self->coordinate = coordinate;
    self->title = title;
    return self;
}

@end
