//
//  SHAppDelegate.m
//  Barista Markdown Demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "SHAppDelegate.h"

#import "FileURLPathTransformer.h"

@interface SHAppDelegate ()
@property (nonatomic, copy) NSURL* serverRootURL;
@end

@implementation SHAppDelegate

#pragma mark - Properties

- (NSString*)startAndStopButtonTitle
{
   if (self.serverRunning)
   {
      return @"Stop Server";
   }
   else
   {
      return @"Start Server";
   }
}

#pragma mark - KVO

// When self.serverRunning changes, notify observers of self.startAndStopButtonTitle
+ (NSSet*)keyPathsForValuesAffectingStartAndStopButtonTitle
{
   return [NSSet setWithObject:@"serverRunning"];
}

#pragma mark - UIApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   [NSValueTransformer setValueTransformer:[[FileURLPathTransformer alloc] init]
                                   forName:(NSString*)kFileURLPathTransformer];

   self.serverRunning = NO;
}

#pragma mark - Actions

- (IBAction)choose:(id)sender
{
   NSOpenPanel* openPanel = [NSOpenPanel openPanel];
   
   [openPanel setCanChooseDirectories:YES];
   [openPanel setCanChooseFiles:NO];
   [openPanel setCanCreateDirectories:YES];
   [openPanel setAllowsMultipleSelection:NO];
   
   [openPanel beginWithCompletionHandler:^(NSInteger result) {
      if (NSFileHandlingPanelOKButton == result)
      {
         self.serverRootURL = [[openPanel URLs] objectAtIndex:0];
      }
   }];
}

- (IBAction)startOrStopServer:(id)sender
{
   self.serverRunning = !(self.serverRunning);
}
@end
