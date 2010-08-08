  //
  //  mediaController.m
  //  iGig
  //
  //  Created by benmaslen on 11/07/2010.
  //  Copyright 2010 ortatherox.com. All rights reserved.
  //

#import "MediaController.h"

@implementation MediaController

- (void) awakeFromNib{
  [self performSelector:@selector(updateSetListTime) withObject:self afterDelay:1];
}

- (void) playpause {
  if(! [self isPlaying]){
    [movieView play:self];
  } else{
    [movieView pause:self]; 
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
  [lengthLabel setStringValue:[NSString stringWithFormat:@"Duration %i minutes", roundDuration]]; 
}

@end
