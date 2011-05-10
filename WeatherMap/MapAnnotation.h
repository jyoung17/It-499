//
//  MapAnnotation.h
//  WeatherMap
//
//  Created by Susie on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject  <MKAnnotation> {
	CLLocationCoordinate2D coordinate; 
	NSString *title;
	NSString *subtitle;
}

//properties
@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *subtitle;

@end
