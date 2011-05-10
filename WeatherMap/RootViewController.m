//
//  RootViewController.m
//  WeatherMap
//
//  Created by jack young on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MapAnnotation.h"
#import "location.h"
#import "LocationEditorViewController.h"

@implementation RootViewController

@synthesize mapview, mapAnnotations, listview, editor, weatherView, choicelabel, alertbutton; 

//added by Jack 
-(IBAction)showalert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Zoom Focus", @"GMU FX", @"GMU PW", @"Disneyland", @"Las Vegas", nil];
    [alert show];
    [alert release];
}

//added by Jack
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) 
    {
        //this is where the cancel action goes.
    }
    if (buttonIndex == 1) 
    {
        [self gotostandardview]; // zoom focus. 
    }    
    if (buttonIndex == 2) 
    {
        [self gotoGeorgeMasonCampus]; //gmu fx zoom to
    }
    
    if (buttonIndex == 3) 
    {
        [self gotoPrinceWilliamCampus]; //gmu pw zoom to
    }
	if (buttonIndex == 4) 
    {
        [self gotodisneyland]; //disneyland zoom to
    }
    if (buttonIndex == 5) 
    {
        [self gotoVegas]; // vegas zoom to
    }
}

-(IBAction)HandleMap{
	 mapview.mapType = MKMapTypeStandard;
};
-(IBAction)HandleHybrid{
	mapview.mapType = MKMapTypeHybrid;

};
-(IBAction)HandleSat{
	 mapview.mapType = MKMapTypeSatellite;
};

//added by Jack
// this allows you to change the map type. ie. standard, satellite, hybrid.
//-(IBAction)setMap:(id)sender {
   // switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        //case 0:
            //mapview.mapType = MKMapTypeStandard;
            //break;
        //case 1:
            //mapview.mapType = MKMapTypeSatellite;
            //break;
        //case 2:
            //mapview.mapType = MKMapTypeHybrid;
            //break;    
        //default:
            //break;
    //}
//}

//added by Jack
- (void)gotoGeorgeMasonCampus
{
    // start off by default in george mason campus
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 38.835096;
    newRegion.center.longitude = -77.3108712;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    [self.mapview setRegion:newRegion animated:YES];
}

//added by Jack
- (void)gotoPrinceWilliamCampus
{
    // start off by default in prince william campus
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 38.754537;
    newRegion.center.longitude = -77.520816;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    [self.mapview setRegion:newRegion animated:YES];
}

//added by Jack
- (void)gotoVegas
{
    // start off by default at jacks house
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 36.101909;
    newRegion.center.longitude = -115.168436;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    [self.mapview setRegion:newRegion animated:YES];
}

- (void)gotodisneyland{
	// start off by default at jacks house
	MKCoordinateRegion newRegion;
    newRegion.center.latitude = 33.83235;
    newRegion.center.longitude = -117.907039;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    [self.mapview setRegion:newRegion animated:YES];
}



//added by Jack
- (void)gotostandardview
{
    // zoom out if they select cancel
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 38.835096;
    newRegion.center.longitude = -77.3108712;
    newRegion.span.latitudeDelta = 65.112872;
    newRegion.span.longitudeDelta = 55.109863;
    [self.mapview setRegion:newRegion animated:YES];
}

- (void)showDetails:(id)sender
{
    // the detail view does not want a toolbar so hide it
   // [self.navigationController setToolbarHidden:YES animated:NO];
    
	NSLog(@"Annotation Click");
	self.weatherView.title=((UIButton*)sender).currentTitle;
	self.weatherView.zipcode=((UIButton*)sender).currentTitle;
	[self.navigationController pushViewController:self.weatherView animated:YES];
	
	//self.weatherView.title=((UIButton*)sender).currentTitle;
    //[self.navigationController pushViewController:weatherView animated:YES];
}


-(void)goToLocations{
	
	MKCoordinateRegion newRegion;
	newRegion.center.latitude = 37.786996;
	newRegion.center.longitude = -122.440100;
	newRegion.span.latitudeDelta = 0.112872;
	newRegion.span.longitudeDelta = 0.109863;
	
	[self.mapview setRegion:newRegion animated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	mapview.showsUserLocation = YES;
	
	//zoom in -- using jack's function
	[self gotostandardview];
	
	//[self.navigationController setToolbarHidden:YES];
	
	CLLocation *userLoc = mapview.userLocation.location;
	CLLocationCoordinate2D userCoordinate = userLoc.coordinate;
	
	mapview.delegate = self;
	
	NSMutableArray *annotations = [[NSMutableArray alloc]init];
	
	CLLocationCoordinate2D theCoordinate;
	theCoordinate.latitude = 38.848467;
	theCoordinate.longitude = -77.334439;
	
	CLLocationCoordinate2D theCoordinate1;
	theCoordinate1.latitude = 38.75107;
	theCoordinate1.longitude = -77.477959;
	
	CLLocationCoordinate2D theCoordinate2;
	theCoordinate2.latitude = 28.415247;
	theCoordinate2.longitude = -81.509718;
	
	CLLocationCoordinate2D theCoordinate3;
	theCoordinate3.latitude = 33.83235;
	theCoordinate3.longitude = -117.907039;
	
	CLLocationCoordinate2D theCoordinate4;
	theCoordinate4.latitude = 36.12012;
	theCoordinate4.longitude = -115.166039;
	
	
	MapAnnotation *myAnnotation = [[MapAnnotation alloc] init];
	
	myAnnotation.coordinate = theCoordinate;
	myAnnotation.subtitle = @"George Mason (FFX Campus)";
	myAnnotation.title = @"22030";
	
	MapAnnotation *myAnnotation1 = [[MapAnnotation alloc] init];
	
	myAnnotation1.coordinate = theCoordinate1;
	myAnnotation1.subtitle = @"George Mason (PW Campus)";
	myAnnotation1.title = @"20110";
	
	MapAnnotation *myAnnotation2 = [[MapAnnotation alloc] init];
	
	myAnnotation2.coordinate = theCoordinate2;
	myAnnotation2.subtitle = @"Walt Disney World";
	myAnnotation2.title = @"32836";
	
	MapAnnotation *myAnnotation3 = [[MapAnnotation alloc] init];
	
	myAnnotation3.coordinate = theCoordinate3;
	myAnnotation3.subtitle = @"Disneyland";
	myAnnotation3.title = @"92805";
	
	MapAnnotation *myAnnotation4 = [[MapAnnotation alloc] init];
	
	myAnnotation4.coordinate = theCoordinate4;
	myAnnotation4.subtitle = @"Las Vegas";
	myAnnotation4.title = @"89109";
	
	
	[mapview addAnnotation:myAnnotation];
	[mapview addAnnotation:myAnnotation1];
	[mapview addAnnotation:myAnnotation2];
	[mapview addAnnotation:myAnnotation3];
	[mapview addAnnotation:myAnnotation4];
	
	[annotations addObject:myAnnotation];
	[annotations addObject:myAnnotation1];
	[annotations addObject:myAnnotation2];
	[annotations addObject:myAnnotation3];
	[annotations addObject:myAnnotation4];
	
	
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	static NSString *defaultPinID = @"MapAnnotation";
	MKPinAnnotationView *retval = nil;
	
	// Make sure we only create Pins for the Cameras. Ignore the current location annotation 
	// so it returns the 'blue dot'
	if ([annotation isMemberOfClass:[MapAnnotation class]]) {
		// See if we can reduce, reuse, recycle
		(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		
		// If we have to, create a new view
		if (retval == nil) {
			retval = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
			
			// Set up the Left callout
			UIButton *myDetailButton = [UIButton buttonWithType:UIButtonTypeCustom];
			myDetailButton.frame = CGRectMake(0, 0, 23, 23);
			myDetailButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
			myDetailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
			
			// Set the image for the button
			[myDetailButton setImage:[UIImage imageNamed:@"YAGlobe.png"] forState:UIControlStateNormal];
			
			// Set the button as the callout view
			retval.leftCalloutAccessoryView = myDetailButton;
			
			UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			[rightButton setTitle:annotation.title forState:UIControlStateNormal];
			[rightButton addTarget:self
							action:@selector(showDetails:)
				  forControlEvents:UIControlEventTouchUpInside];
			retval.rightCalloutAccessoryView = rightButton;
		}
		
		// Set a bunch of other stuff
		if (retval) {
			[retval setPinColor:MKPinAnnotationColorGreen];
			retval.animatesDrop = YES;
			retval.canShowCallout = YES;
		}
	}
	
	return retval;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidUnload
{
    [super viewDidUnload];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)HandleEditTapped {
	
	[self.navigationController pushViewController:listview animated:YES];
	
}

@end
