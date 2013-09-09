//
//  FileURLPathTransformer.h
//  Barista Markdown Demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString* const kFileURLPathTransformer;

/**
 *	A NSValueTransformer subclass for converting between a file URL and it's path
 * as an NSString instance.
 */
@interface FileURLPathTransformer : NSValueTransformer

@end
