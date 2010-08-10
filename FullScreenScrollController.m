//
//  FullScreenScrollController.m
//  iGig
//
//  Created by Ben Maslen on 10/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import "FullScreenScrollController.h"


@implementation FullScreenScrollController

- (void) toggle {
  if(timer){
    [timer invalidate];
    timer = nil;
  }else{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(tick:) userInfo:nil repeats:YES];    
  }
}

- (void) tick:(id) sender {
  NSLog(@"ticks");
}
           
@end
