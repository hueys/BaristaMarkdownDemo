//
//  BaristaMarkdownDemo.m
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "BaristaMarkdownDemo.h"

#import <Barista/Barista.h>
#import <Barista/BARServer.h>
#import <Barista/BARRouter.h>

#import "MarkdownTemplateRenderer.h"

@interface BaristaMarkdownDemo ()
{
   BARServer* _server;
}
@end

@implementation BaristaMarkdownDemo

- (void)dealloc
{
   [_server stopListening];
}

- (void)runWithURL:(NSURL*)serverRoot
{
	_server = [BARServer serverWithPort:3333];
	
   [_server addGlobalMiddleware:[MarkdownTemplateRenderer rendererWithViewsDirectoryURL:[serverRoot URLByAppendingPathComponent:@"views"]]];
	
	BARRouter *router = [[BARRouter alloc] init];
	[_server addGlobalMiddleware:router];
	
	[router addRoute:@"/:view" forHTTPMethod:@"GET" handler:^BOOL(BARConnection *connection, BARRequest *request, NSDictionary *parameters)
   {
		BARResponse* response = [[BARResponse alloc] init];
		response.statusCode = 200;
		[response setViewToRender:parameters[@"view"]
                     withObject:nil];
		[connection sendResponse:response];
		
		return YES;
	}];
	
	[_server startListening];
}
@end
