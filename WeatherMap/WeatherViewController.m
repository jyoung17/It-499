//
//  WeatherViewController.m
//  WeatherMap
//
//  Created by Susie on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WeatherViewController.h"


@implementation WeatherViewController

@synthesize forecasts;
@synthesize responseData;
@synthesize zipcode;

@synthesize nowLocation;
@synthesize nowLabel;
@synthesize nowImage;
@synthesize nowTemp;
@synthesize nowWind;
@synthesize nowWindDirection;
@synthesize nowTempC;

//day 2
@synthesize day2;
@synthesize day2Image;
@synthesize day2Temp;
@synthesize day2TempC;

//day 3
@synthesize day3;
@synthesize day3Image;
@synthesize day3Temp;
@synthesize day3TempC;

//day 4
@synthesize day4;
@synthesize day4Image;
@synthesize day4Temp;
@synthesize day4TempC;

//day 5
@synthesize day5;
@synthesize day5Image;
@synthesize day5Temp;
@synthesize day5TempC;


- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
    
    NSLog(@"location = %@", newLocation);   
    NSString *baseURl = @"http://free.worldweatheronline.com/feed/weather.ashx";
    NSString *urlStr = [baseURl stringByAppendingFormat:@"?q=%@&format=json&num_of_days=5&key=%@",
						zipcode,
                        @"56891fc26c192034111404"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];  
    
    [manager stopUpdatingLocation];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    

	
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [NSURL URLWithString:
                  @"http://free.worldweatheronline.com/feed/weather.ashx?q=[ZIPCODE]&format=json&num_of_days=5&key=[56891fc26c192034111404]"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
	
	
	// Initialize the forecasts array
	self.forecasts = [NSArray array];
	// Set the title that shows in the navigation bar
	//self.title = @"5 Day Forecast";
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
       [manager startUpdatingLocation];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
	
    [super viewDidAppear:animated];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    responseData = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error loading: %@", error);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSDictionary *json = [responseData yajl_JSON];
	self.forecasts = [json valueForKeyPath:@"data.weather"];
	
	//Get the data by row to load into xib
	NSDictionary *forecast = [forecasts objectAtIndex:0];       
	NSDictionary *forecast2 = [forecasts objectAtIndex:1];
	NSDictionary *forecast3 = [forecasts objectAtIndex:2];
	NSDictionary *forecast4 = [forecasts objectAtIndex:3];
	NSDictionary *forecast5 = [forecasts objectAtIndex:4];
	
	//fill in labels
	//self.nowLocation.text = @"Home";
	self.nowLabel.text =  [forecast objectForKey:@"date"];
	self.nowTemp.text = [[forecast objectForKey:@"tempMaxF"] stringByAppendingString:@"F"];
	self.nowTempC.text = [[forecast objectForKey:@"tempMaxC"] stringByAppendingString:@"C"];
	self.nowWind.text =  [[forecast objectForKey:@"windspeedMiles"]stringByAppendingString:@"mph"];;
	self.nowWindDirection.text = [forecast objectForKey:@"winddir16Point"];
	NSString *weatherIconUrl = [[forecast valueForKeyPath:@"weatherIconUrl.value"] objectAtIndex:0];
	NSURL *url = [NSURL URLWithString:weatherIconUrl];
	NSData *data = [[[NSData alloc] initWithContentsOfURL:url] autorelease];
	self.nowImage.image =[UIImage imageWithData:data];	
	
	
	//day 2
	self.day2.text =  [forecast2 objectForKey:@"date"];
	self.day2Temp.text =  [[forecast2 objectForKey:@"tempMaxF"] stringByAppendingString:@"F"];
	self.day2TempC.text =  [[forecast2 objectForKey:@"tempMaxC"] stringByAppendingString:@"C"];
	NSString *weatherIconUrl2 = [[forecast2 valueForKeyPath:@"weatherIconUrl.value"] objectAtIndex:0];
    NSURL *url2 = [NSURL URLWithString:weatherIconUrl2];
    NSData *data2 = [[[NSData alloc] initWithContentsOfURL:url2] autorelease];
	self.day2Image.image =[UIImage imageWithData:data2];
	
	
	
	//day 3
	self.day3.text =  [forecast3 objectForKey:@"date"];
	self.day3Temp.text =  [[forecast3 objectForKey:@"tempMaxF"] stringByAppendingString:@"F"];
	self.day3TempC.text =  [[forecast3 objectForKey:@"tempMaxC"] stringByAppendingString:@"C"];
	NSString *weatherIconUrl3 = [[forecast3 valueForKeyPath:@"weatherIconUrl.value"] objectAtIndex:0];
    NSURL *url3 = [NSURL URLWithString:weatherIconUrl3];
    NSData *data3 = [[[NSData alloc] initWithContentsOfURL:url3] autorelease];
	self.day3Image.image=[UIImage imageWithData:data3];
	
	
	
	//day 4
	self.day4.text =  [forecast4 objectForKey:@"date"];
	self.day4Temp.text =  [[forecast4 objectForKey:@"tempMaxF"] stringByAppendingString:@"F"];
	self.day4TempC.text =  [[forecast3 objectForKey:@"tempMaxC"] stringByAppendingString:@"C"];
    NSString *weatherIconUrl4 = [[forecast4 valueForKeyPath:@"weatherIconUrl.value"] objectAtIndex:0];
    NSURL *url4 = [NSURL URLWithString:weatherIconUrl4];
    NSData *data4 = [[[NSData alloc] initWithContentsOfURL:url4] autorelease];
	self.day4Image.image =[UIImage imageWithData:data4];
	
	
	
	//day 5
	self.day5.text =  [forecast5 objectForKey:@"date"];
	self.day5Temp.text =  [[forecast5 objectForKey:@"tempMaxF"] stringByAppendingString:@"F"];
	self.day5TempC.text =  [[forecast5 objectForKey:@"tempMaxC"] stringByAppendingString:@"C"];
	NSString *weatherIconUrl5 = [[forecast5 valueForKeyPath:@"weatherIconUrl.value"] objectAtIndex:0];
    NSURL *url5 = [NSURL URLWithString:weatherIconUrl5];
    NSData *data5 = [[[NSData alloc] initWithContentsOfURL:url5] autorelease];
	self.day5Image.image =[UIImage imageWithData:data5];
	
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)dealloc
{
    [super dealloc];
}

@end

