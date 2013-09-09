//
//  MarkdownTemplateRenderer.h
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BARTemplateRenderer.h"

/**
 *	A BARTemplateRenderer based on the Mustache template renderer included with Barista
 * that renders pages marked up with Markdown: http://daringfireball.net/projects/markdown/ .
 *
 * It relies on MMMarkdown available from: https://github.com/mdiep/MMMarkdown
 */
@interface MarkdownTemplateRenderer : BARTemplateRenderer
+(instancetype)rendererWithViewsDirectoryURL:(NSURL *)url;

@property (nonatomic, readonly, copy) NSURL *viewsDirectoryURL;
@end
