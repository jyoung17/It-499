//
//  location.m
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "location.h"


@implementation location

@synthesize title, zipcode;

-(id)initWithTitle:(NSString *)newTitle zipcode:(NSString *)newZipcode{
	
	self=[super init];
	
	//if it is not equal set the title and zipcode
	if (nil != self) {
		self.title = newTitle;
		self.zipcode = newZipcode;
	}
	
	//return the values
	return self;
	
}

-(void) dealloc{
	
	//clear out the values
	self.title = nil;
	self.zipcode = nil;
	[super dealloc];
	
}

@end
