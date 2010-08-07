//
//  mediaController.m
//  iGig
//
//  Created by benmaslen on 11/07/2010.
//  Copyright 2010 ortatherox.com. All rights reserved.
//

#import "MediaController.h"

@implementation MediaController

- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(int)rowIndex{
  NSLog(@"changed row?");

  NSArray * array = [trackArray selectedObjects];
  NSManagedObject * currentTrack = [array objectAtIndex:0];
  
  QTDataReference *ref = [QTDataReference dataReferenceWithReferenceToFile:[currentTrack valueForKey:@"fileLocation"]];
  NSError *movErr = nil;
  QTMovie* movie = [[QTMovie alloc] initWithDataReference:ref error:&movErr];
  
  if(movErr == nil){
    [movieView setMovie:movie];  
  }

	return YES;
}

@end
