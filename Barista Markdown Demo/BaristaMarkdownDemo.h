//
//  BaristaMarkdownDemo.h
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaristaMarkdownDemo : NSObject

/**
 *	Run a Barista server on the given port, serving files from the provided file URL.
 *
 *	@param	serverRoot	file URL to the server root directory to serve files from
 *	@param	port	port to listen for requests on
 */
- (void)runWithURL:(NSURL*)serverRoot onPort:(NSUInteger)port;

@end
