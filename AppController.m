//
//  AppController.m
//  iGig
//
//  Created by Ben Maslen on 08/08/2010.
//  Copyright (c) 2010 http://www.ortatherox.com. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
  NSLog(@"app should open");
  if (!applicationHasStarted) {
    // Get the recent documents
    applicationHasStarted = true;
    NSDocumentController *controller =
    [NSDocumentController sharedDocumentController];
    NSArray *documents = [controller recentDocumentURLs];
    
    // If there is a recent document, try to open it.
    if ([documents count] > 0)
    {
      NSError *error = nil;
      [controller
       openDocumentWithContentsOfURL:[documents objectAtIndex:0]
       display:YES error:&error];
      
      // If there was no error, then prevent untitled from appearing.
      if (error == nil)
      {
        return NO;
      }
    }
  }
  
  return YES;
}



@end
