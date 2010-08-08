  //
  //  mediaController.m
  //  iGig
  //
  //  Created by benmaslen on 11/07/2010.
  //  Copyright 2010 ortatherox.com. All rights reserved.
  //

#import "MediaController.h"
#import "RemoteControl.h"

@implementation MediaController

- (void) awakeFromNib{
  [self performSelector:@selector(updateSetListTime) withObject:self afterDelay:1];
}

- (void) playpause {
  NSLog(@"pp");
  if(! [self isPlaying]){
    [movieView play:self];
  } else{
    [movieView pause:self]; 
    NSLog(@"pause %@", [movieView movie]);
  }
}

- (void) setMovieURL:(NSString *) url {
  NSArray * array = [trackArray selectedObjects];
  NSManagedObject * currentTrack = [array objectAtIndex:0];
  [currentTrack setValue:url forKey:@"fileLocation"];
  [self setMovie:url];
  [self updateSetListTime];
  
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification{
  NSArray * array = [trackArray selectedObjects];
  NSManagedObject * currentTrack = [array objectAtIndex:0];  
  [self setMovie:[currentTrack valueForKey:@"fileLocation"]];
    //  NSLog(@" %@ - %@ - %@", [currentTrack valueForKey:@"name"],  [currentTrack valueForKey:@"fileLocation"],  [currentTrack valueForKey:@"viewPosition"]);
  
}

- (void) setMovie: (NSString *) url {
  if(url == nil){
    [movieView setMovie:nil];
    return;
  }
  QTDataReference *ref = [QTDataReference dataReferenceWithReferenceToFile:url];
  NSError *movErr = nil;
  QTMovie* movie = [[QTMovie alloc] initWithDataReference:ref error:&movErr];
  
  if(movErr == nil){
    [movieView setMovie:movie];  
  }
}

- (BOOL)isPlaying {
  return ([movieView movie] != nil) && ([[movieView movie] rate] != 0);
}

-(void) updateSetListTime {
  float totalDuration = 0;
  
  NSUInteger i, count = [[trackArray arrangedObjects] count];
  for (i = 0; i < count; i++) {
    NSManagedObject * obj = [[trackArray arrangedObjects] objectAtIndex:i];
    if([obj valueForKey:@"fileLocation"]){
      QTDataReference *ref = [QTDataReference dataReferenceWithReferenceToFile:[obj valueForKey:@"fileLocation"]];
      NSError *movErr = nil;
      QTMovie* movie = [[QTMovie alloc] initWithDataReference:ref error:&movErr];
      totalDuration += [movie duration].timeValue / [movie duration].timeScale;  
    }
  }
  float minTotalDuration = totalDuration/60;
  int roundDuration = (int)(minTotalDuration + 0.5f);
  if(roundDuration > 0){
    [lengthLabel setStringValue:[NSString stringWithFormat:@"Duration %i minutes", roundDuration]];     
  }

}


// delegate method for the MultiClickRemoteBehavior
- (void) sendRemoteButtonEvent: (RemoteControlEventIdentifier) buttonIdentifier pressedDown: (BOOL) pressedDown  remoteControl: (RemoteControl*)remote{
  
	NSString* buttonName=nil;
	NSString* pressed=@"";
	if(pressedDown) return;
	if (pressedDown) pressed = @"(pressed)"; else pressed = @"(released)";
	
	switch(buttonIdentifier) {
		case kRemoteButtonPlus:
      [self nextSong:self];
			break;
		case kRemoteButtonMinus:
      [self previousSong:self];
			break;			
		case kRemoteButtonMenu:
			buttonName = @"Menu";
			break;			
		case kRemoteButtonPlay:
      buttonName = @"Play";
			[self playpause];
			break;			
		case kRemoteButtonRight:	
			buttonName = @"Right";
			break;			
		case kRemoteButtonLeft:
			buttonName = @"Left";
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

-(IBAction) nextSong:(id) sender {
  [trackArray setSelectionIndex:[trackArray selectionIndex] - 1 ];
}

-(IBAction) previousSong:(id) sender {
  [trackArray setSelectionIndex:[trackArray selectionIndex] + 1 ];
}

@end
