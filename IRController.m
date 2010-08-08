//
//  IRController.m
//  iGig
//
//  Created by Ben Maslen on 08/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import "IRController.h"


@implementation IRController

-(void)awakeFromNib {
  remoteControl = [[[AppleRemote alloc] initWithDelegate: self] autorelease];
    [remoteControl startListening: self];

}


// delegate method for the MultiClickRemoteBehavior
- (void) sendRemoteButtonEvent: (RemoteControlEventIdentifier) buttonIdentifier pressedDown: (BOOL) pressedDown  remoteControl: (RemoteControl*)remote{

	NSString* buttonName=nil;
	NSString* pressed=@"";
	
	if (pressedDown) pressed = @"(pressed)"; else pressed = @"(released)";
	
	switch(buttonIdentifier) {
		case kRemoteButtonPlus:
			buttonName = @"Volume up";			
			break;
		case kRemoteButtonMinus:
			buttonName = @"Volume down";
			break;			
		case kRemoteButtonMenu:
			buttonName = @"Menu";
			break;			
		case kRemoteButtonPlay:
			buttonName = @"Play";
			break;			
		case kRemoteButtonRight:	
			buttonName = @"Right";
			break;			
		case kRemoteButtonLeft:
			buttonName = @"Left";
			break;			
		case kRemoteButtonRight_Hold:
			buttonName = @"Right holding";	
			break;	
		case kRemoteButtonLeft_Hold:
			buttonName = @"Left holding";		
			break;			
		case kRemoteButtonPlus_Hold:
			buttonName = @"Volume up holding";	
			break;				
		case kRemoteButtonMinus_Hold:			
			buttonName = @"Volume down holding";	
			break;				
		case kRemoteButtonPlay_Hold:
			buttonName = @"Play (sleep mode)";
			break;			
		case kRemoteButtonMenu_Hold:
			buttonName = @"Menu (long)";
			break;
		case kRemoteControl_Switched:
			buttonName = @"Remote Control Switched";
			break;
		default:
			NSLog(@"Unmapped event for button %d", buttonIdentifier); 
			break;
	}
    
	NSString* clickCountString = @"";
	NSString* feedbackString = [NSString stringWithFormat:@"%@ %@ %@", buttonName, pressed, clickCountString];
	
	// print out events
	NSLog(@"%@", feedbackString);
	
}

- (void) dealloc {
  [remoteControl stopListening: self];
  [super dealloc];

}
@end
