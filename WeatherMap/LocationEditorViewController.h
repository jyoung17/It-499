//
//  LocationEditorViewController.h
//  WeatherMap
//
//  Created by Susie on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class location;

@interface LocationEditorViewController : UIViewController <UITextFieldDelegate>{
	
	UITextField *titleField;
	UITextField *zipcodeField;
	location *loc;
	
}

//create outlets
@property(nonatomic, retain) IBOutlet UITextField *titleField;
@property(nonatomic, retain) IBOutlet UITextField *zipcodeField;
@property(nonatomic, retain) location *loc;

//create button action
-(IBAction)done;

@end
