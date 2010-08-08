//
//  SpacedWindow.m
//  iGig
//
//  Created by Ben Maslen on 08/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import "SpacedWindow.h"


@implementation SpacedWindow


- (void)keyDown:(NSEvent*)event {
  int key = (int)[[event characters] characterAtIndex:0];
  if(key == (int)' ')
    [mediaController playpause];
}



@end
