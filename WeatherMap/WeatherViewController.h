//
//  WeatherViewController.h
//  WeatherMap
//
//  Created by Susie on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface WeatherViewController : UIViewController  <CLLocationManagerDelegate> {
	NSMutableData *responseData; 
	NSArray *forecasts;
	
	//current info
	UILabel *nowLocation;
	UILabel *nowLabel;
	UIImageView *nowImage;
	UILabel *nowTemp;
	UILabel *nowWind; //wind speed
	UILabel *nowWindDirection; // wind direction 
	UILabel *nowTempC;
	
	//day 2
	UIImageView *day2Image;
	UILabel *day2Temp;
	UILabel *day2TempC;
	
	//day 3
	UIImageView *day3Image;
	UILabel *day3Temp;
	UILabel *day3TempC;
	
	//day 4
	UIImageView *day4Image;
	UILabel *day4Temp;
	UILabel *day4TempC;
	
	//day 5
	UIImageView *day5Image;
	UILabel *day5Temp;
	UILabel *day5TempC;
}
@property (nonatomic, retain)  NSArray *forecasts;
@property (nonatomic, retain)  NSMutableData *responseData;

//current info
@property (nonatomic, retain)  IBOutlet UILabel *nowLocation;
@property (nonatomic, retain)  IBOutlet UILabel *nowLabel;
@property (nonatomic, retain)  IBOutlet UIImageView *nowImage;
@property (nonatomic, retain)  IBOutlet UILabel *nowTemp;
@property (nonatomic, retain)  IBOutlet UILabel *nowWind;
@property (nonatomic, retain)  IBOutlet UILabel *nowWindDirection;
@property (nonatomic, retain)  IBOutlet UILabel *nowTempC;

//day 2
@property (nonatomic, retain)  IBOutlet UIImageView *day2Image;
@property (nonatomic, retain)  IBOutlet UILabel *day2Temp;
@property (nonatomic, retain)  IBOutlet UILabel *day2;
@property (nonatomic, retain)  IBOutlet UILabel *day2TempC;

//day 3
@property (nonatomic, retain)  IBOutlet UIImageView *day3Image;
@property (nonatomic, retain)  IBOutlet UILabel *day3Temp;
@property (nonatomic, retain)  IBOutlet UILabel *day3;
@property (nonatomic, retain)  IBOutlet UILabel *day3TempC;

//day 4
@property (nonatomic, retain)  IBOutlet UIImageView *day4Image;
@property (nonatomic, retain)  IBOutlet UILabel *day4Temp;
@property (nonatomic, retain)  IBOutlet UILabel *day4;
@property (nonatomic, retain)  IBOutlet UILabel *day4TempC;

//day 5
@property (nonatomic, retain)  IBOutlet UIImageView *day5Image;
@property (nonatomic, retain)  IBOutlet UILabel *day5Temp;
@property (nonatomic, retain)  IBOutlet UILabel *day5;
@property (nonatomic, retain)  IBOutlet UILabel *day5TempC;


@end
