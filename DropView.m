//
//  DropView.m
//  iGig
//
//  Created by Ben Maslen on 07/08/2010.
//  Copyright 2010 wgrids. All rights reserved.
//

#import "DropView.h"


@implementation DropView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      [self registerForDraggedTypes:
       [NSArray arrayWithObjects:NSFilenamesPboardType,nil]];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}


- (NSDragOperation)draggingEntered:(id )sender {
  NSLog(@"whah");
  
  return NSDragOperationGeneric;  
}

- (BOOL)prepareForDragOperation:(id )sender {
  return YES;
} 


- (BOOL)performDragOperation:(id )sender {
  NSPasteboard *zPasteboard = [sender draggingPasteboard];
  NSArray *zImageTypesAry = [NSArray arrayWithObjects: NSFilenamesPboardType, nil];
  
  NSString *zDesiredType = [zPasteboard availableTypeFromArray:zImageTypesAry];
    
  if ([zDesiredType isEqualToString:NSFilenamesPboardType]) {

    NSArray *zFileNamesAry =
    [zPasteboard propertyListForType:@"NSFilenamesPboardType"];
    NSString *zPath = [zFileNamesAry objectAtIndex:0];

    [mediaController setMovieURL:zPath];
    
    [self setNeedsDisplay:YES];
    return YES;
    
  }
  
  NSLog(@"Error MyNSView performDragOperation");
  return NO;
  
} // end performDragOperation



@end
