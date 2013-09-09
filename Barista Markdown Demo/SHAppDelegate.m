//
//  SHAppDelegate.m
//  Barista Markdown Demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "SHAppDelegate.h"

#import "BaristaMarkdownDemo.h"
#import "FileURLPathTransformer.h"

@interface SHAppDelegate ()
{
   BaristaMarkdownDemo* _demoServer;
}

@property (nonatomic, copy) NSURL* serverRootURL;
@property (nonatomic, readonly) NSUInteger serverPort;
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

- (NSUInteger)serverPort
{
   return (NSUInteger)[[self.serverPortField stringValue] integerValue];
}

#pragma mark - KVO

// When self.serverRunning changes, notify observers of self.startAndStopButtonTitle
// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVODependentKeys.html
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
   
   if (self.serverRunning)
   {
      _demoServer = [[BaristaMarkdownDemo alloc] init];
      
      if (_demoServer)
      {
         [_demoServer runWithURL:self.serverRootURL
                          onPort:self.serverPort];
      }
   }
   else
   {
      _demoServer = nil;
   }
}
@end
