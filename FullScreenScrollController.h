//
//  FullScreenScrollController.h
//  iGig
//
//  Created by Ben Maslen on 10/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface FullScreenScrollController : NSObject {
  IBOutlet NSScrollView * scrollView;
  IBOutlet QTMovieView * movieView;
  NSTimer *timer;
}

- (void) toggle;

@end
