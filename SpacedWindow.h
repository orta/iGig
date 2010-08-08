//
//  SpacedWindow.h
//  iGig
//
//  Created by Ben Maslen on 08/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MediaController.h"

@interface SpacedWindow : NSWindow {
  IBOutlet MediaController* mediaController;
}

@end
