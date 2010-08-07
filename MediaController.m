//
//  mediaController.m
//  iGig
//
//  Created by benmaslen on 11/07/2010.
//  Copyright 2010 ortatherox.com. All rights reserved.
//

#import "MediaController.h"

@implementation MediaController

- (void) setMovieURL:(NSString *) url {
  NSArray * array = [trackArray selectedObjects];
  NSManagedObject * currentTrack = [array objectAtIndex:0];
  [currentTrack setValue:url forKey:@"fileLocation"];
  [self setMovie:url];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification{
  
  NSArray * array = [trackArray selectedObjects];
  NSManagedObject * currentTrack = [array objectAtIndex:0];  
  [self setMovie:[currentTrack valueForKey:@"fileLocation"]];
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

@end
