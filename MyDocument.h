//
//  MyDocument.h
//  CoreDataDragDrop
//
//  Created by Tim Isted on 17/07/2008.
//  Copyright Tim Isted © 2008. All rights reserved.
//
//  If this is useful to you, please let me know.
//  All acknowledgements encouraged and gratefully received!
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

#import <Cocoa/Cocoa.h>
#import "MediaController.h"
#import "AppleRemote.h"

@interface MyDocument : NSPersistentDocument <NSTableViewDataSource>{
	
	IBOutlet NSArrayController *itemsArrayController;
	NSArray *_sortDescriptors;
	IBOutlet NSTableView *itemsTableView;
  IBOutlet MediaController * mediaController;
  AppleRemote* remoteControl;
  BOOL applicationHasStarted;

}

- (IBAction)addNewItem:(id)sender;
- (IBAction)removeSelectedItems:(id)sender;

- (NSArray *)sortDescriptors;

- (NSArray *)itemsUsingFetchPredicate:(NSPredicate *)fetchPredicate;
- (NSArray *)itemsWithViewPosition:(int)value;
- (NSArray *)itemsWithNonTemporaryViewPosition;
- (NSArray *)itemsWithViewPositionGreaterThanOrEqualTo:(int)value;
- (NSArray *)itemsWithViewPositionBetween:(int)lowValue and:(int)highValue;
- (int)renumberViewPositionsOfItems:(NSArray *)array startingAt:(int)value;
- (void)renumberViewPositions;

- (NSArray *)copyItems:(NSArray *)itemsToCopyArray;



@end
