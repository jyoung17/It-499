//
//  TableViewController.m
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"

NSString *testData[][2]={
	{@"George Mason (FFX Campus)", @"22030"},
	{@"George Mason (PW Campus)", @"20110"},
	{@"Walt Disney World", @"32836"},
	{@"Disneyland", @"92805"},
	{@"Las Vegas", @"89109"}
};

@implementation TableViewController

@synthesize editor, nibLoadedCell;


-(void) loadTestData {
	// fill locArray with test data
	for (int i=0; i< 5; i++) {
		location *aLocation = [[location alloc] init];
		aLocation.title = testData[i][0];
		aLocation.zipcode = testData[i][1];
		[locArray addObject: aLocation];
		[aLocation release];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;	
    locArray = [[NSMutableArray alloc] init];
	
	[self.navigationController setToolbarHidden:NO];
	
	[self loadTestData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	// update table view if a location was edited
	if (editingLocation) {
		NSIndexPath *updatedPath = [NSIndexPath
									indexPathForRow: [locArray indexOfObject: editingLocation]
									inSection: 0];
		NSArray *updatedPaths = [NSArray arrayWithObject:updatedPath];
		[self.tableView reloadRowsAtIndexPaths:updatedPaths
							  withRowAnimation:NO];
		editingLocation = nil;
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [locArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell"; 
	UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];  //<label id="code.RootViewController.cellforrowatindexpath.initcell.dequeue.end"/>
	if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		[[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:NULL];
		cell = nibLoadedCell;
		
	}
	
	location *aLocation = [locArray objectAtIndex:indexPath.row];
	
	UILabel *titleLabel = (UILabel *) [cell viewWithTag:1];
	titleLabel.text = aLocation.title;
	
	UILabel *zipcodeLabel = (UILabel *) [cell viewWithTag:2];
	zipcodeLabel.text = aLocation.zipcode;
	//cell.textLabel.text = aLocation.title;
	//cell.detailTextLabel.text = aLocation.zipcode;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	editingLocation = [locArray objectAtIndex:indexPath.row];
	editor.loc = editingLocation;
	[self.navigationController pushViewController:editor animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
 // Override to support editing the table view.
 */
//START:code.RootViewController.commiteditingstyle
- (void)tableView:(UITableView *)tableView
commitEditingStyle: (UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		// Delete the row from the data source.
		[locArray removeObjectAtIndex: indexPath.row];
		[tableView deleteRowsAtIndexPaths:
		 [NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationFade];
	}   
}


# pragma mark IBActions

//START:code.RootViewController.handleaddtapped
-(IBAction)HandleAddTapped {
	location *newLocation = [[location alloc] init];
	editingLocation = newLocation;
	editor.loc = editingLocation;
	[self.navigationController pushViewController:editor animated:YES];
	// update UITableView (in background) with new member
	[locArray addObject: newLocation];
	NSIndexPath *newLocationPath =
	[NSIndexPath indexPathForRow: [locArray count]-1 inSection:0];
	NSArray *newLocationPaths = [NSArray arrayWithObject:newLocationPath];
	[self.tableView insertRowsAtIndexPaths:newLocationPaths withRowAnimation:NO];
	[newLocation release];
}


//close the location Manager
-(IBAction)HandleDoneTapped{
	[self.navigationController popViewControllerAnimated:YES];
};

//END:code.RootViewController.handleaddtapped


# pragma mark cleanup

- (void)dealloc {
    [super dealloc];
}


@end
