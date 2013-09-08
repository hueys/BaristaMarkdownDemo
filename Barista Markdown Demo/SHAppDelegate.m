//
//  SHAppDelegate.m
//  Barista Markdown Demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "SHAppDelegate.h"

@implementation SHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (IBAction)choose:(id)sender
{
   NSOpenPanel* openPanel = [NSOpenPanel openPanel];
   
   [openPanel setCanChooseDirectories:YES];
   [openPanel setCanChooseFiles:NO];
   [openPanel setCanCreateDirectories:YES];
   [openPanel setAllowsMultipleSelection:NO];
   
   [openPanel beginWithCompletionHandler:^(NSInteger result) {
      
   }];
}

- (IBAction)startOrStopServer:(id)sender
{
   self.startAndStopButton.title = @"Stop Server";
}
@end
