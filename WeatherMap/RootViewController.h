//
//  RootViewController.h
//  WeatherMap
//
//  Created by jack young on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"
#import "location.h"
#import "LocationEditorViewController.h"
#import "WeatherViewController.h"
#import "TableViewController.h"

@interface RootViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate> {
    MKMapView *mapview;
    CLLocationCoordinate2D *Place;
	NSMutableArray *mapAnnotations;
	LocationEditorViewController *editor;
	location *editingLocation;
	WeatherViewController *weatherView;
	TableViewController *listview;
	NSMutableArray *locationsArray;
	MapAnnotation *details;
	
	//added by jack
	IBOutlet UIButton *alertbutton; // alert button, bottom left hand corner
    IBOutlet UILabel *choicelabel; //  switch map views 
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapview;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property(nonatomic, retain) IBOutlet LocationEditorViewController *editor;
@property(nonatomic, retain) IBOutlet WeatherViewController *weatherView;
@property(nonatomic, retain) IBOutlet TableViewController *listview;


//set the action for tapping add button 
-(IBAction)HandleAddTapped;
-(IBAction)HandleEditTapped;
-(IBAction)HandleMap;
-(IBAction)HandleHybrid;
-(IBAction)HandleSat;

// added by Jack
- (IBAction) showalert;  // alert

-(IBAction)setMap:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *choicelabel; // choice label for switching maps views
@property (nonatomic, retain) IBOutlet UIButton *alertbutton; //alert button

// locations that are used for the zoom feature. 
- (void)goToLocations;
- (void)gotoGeorgeMasonCampus;
- (void)gotoVegas;
- (void)gotodisneyland;
- (void)gotoPrinceWilliamCampus;
- (void)gotostandardview;

@end
