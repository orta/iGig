//
//  mediaController.h
//  iGig
//
//  Created by benmaslen on 11/07/2010.
//  Copyright 2010 ortatherox.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QTKit/QTKit.h"

@interface MediaController : NSObject {
  IBOutlet QTMovieView * movieView;
  IBOutlet NSTableView * trackListView;
  IBOutlet NSArrayController * trackArray;
  IBOutlet NSTextField *lengthLabel;
}

-(IBAction) nextSong:(id) sender;
-(IBAction) previousSong:(id) sender;

- (void) playpause;
- (void) tableViewSelectionDidChange:(NSNotification *)aNotification;
- (void) setMovieURL:(NSString *) url;
- (void) setMovie: (NSString *) url;
- (BOOL) isPlaying;
-(void) updateSetListTime;

@end
 