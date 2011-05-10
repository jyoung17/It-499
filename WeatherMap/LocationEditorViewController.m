//
//  LocationEditorViewController.m
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationEditorViewController.h"
#import "location.h"

@implementation LocationEditorViewController
@synthesize titleField, zipcodeField, loc;

- (void)viewDidLoad {
    [super viewDidLoad];
}

//set the values that need to be edited in the textbox
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.titleField.text = self.loc.title;
	self.zipcodeField.text = self.loc.zipcode;
}


//Reaction to Done button being pressed
-(IBAction)done{
	[self.navigationController popViewControllerAnimated:YES];
}


//dismiss the Keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

//set values in location class equal to textfield values
-(void)textFieldDidEndEditing:(UITextField *)textField{
	if(textField == self.titleField) {
		self.loc.title = self.titleField.text;
	}  else if(textField == self.zipcodeField) {
		self.loc.zipcode = self.zipcodeField.text;
	}
}

-(void) dealloc{
	[super dealloc];
}
@end
