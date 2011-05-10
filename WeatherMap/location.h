//
//  location.h
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface location : NSObject {
	NSString *title;
	NSString *zipcode;
}


-(id)initWithTitle:(NSString *)newTitle
		   zipcode:(NSString *)newZipcode;



@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *zipcode;



@end
