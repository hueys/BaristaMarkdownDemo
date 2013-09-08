//
//  MarkdownTemplateRenderer.h
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BARTemplateRenderer.h"

@interface MarkdownTemplateRenderer : BARTemplateRenderer
+(instancetype)rendererWithViewsDirectoryURL:(NSURL *)url;

@property (nonatomic, readonly, copy) NSURL *viewsDirectoryURL;
@end
