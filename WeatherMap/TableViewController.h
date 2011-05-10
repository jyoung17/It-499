//
//  TableViewController.h
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "location.h"
#import "LocationEditorViewController.h"


@interface TableViewController :  UITableViewController <UITableViewDelegate, UITableViewDataSource>{
	
	LocationEditorViewController *editor;
	location *editingLocation;
	NSMutableArray *locArray;
	UITableViewCell *nibLoadedCell;
	
}

//set the outlet
@property(nonatomic, retain) IBOutlet LocationEditorViewController *editor;


@property(nonatomic, retain) IBOutlet UITableViewCell *nibLoadedCell;

//set the action for tapping add button
-(IBAction)HandleAddTapped;

@end
