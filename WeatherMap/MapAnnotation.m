//
//  MapAnnotation.m
//  WeatherMap
//
//  Created by Susie on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"


@implementation MapAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;


-(void)dealloc{
	[super dealloc];
	self.title = nil;
	self.subtitle = nil;
}


@end
