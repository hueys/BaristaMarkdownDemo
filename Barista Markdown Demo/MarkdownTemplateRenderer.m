//
//  MarkdownTemplateRenderer.m
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "MarkdownTemplateRenderer.h"

#import <MMMarkdown/MMMarkdown.h>

@interface MarkdownTemplateRenderer ()
@property (nonatomic, readwrite, copy) NSURL *viewsDirectoryURL;
@end

@implementation MarkdownTemplateRenderer
+(instancetype)rendererWithViewsDirectoryURL:(NSURL *)url{
	MarkdownTemplateRenderer *renderer = [[self alloc] init];
	renderer.viewsDirectoryURL = url;
	return renderer;
}

+(NSString *)templateFileExtension{
	return @"markdown";
}

-(void)willSendResponse:(BARResponse*)response
             forRequest:(BARRequest*)request
          forConnection:(BARConnection*)connection
        continueHandler:(void (^)(void))handler
{
   NSString* viewName = [response customValueForKey:@"BARTemplateView"];
   //id object = [response customValueForKey:@"BARTemplateViewObject"];
   
   if (viewName)
   {
      NSURL *viewURL = [[self.viewsDirectoryURL URLByAppendingPathComponent:viewName] URLByAppendingPathExtension:[[self class] templateFileExtension]];
      
      NSString* fileAsString = [NSString stringWithContentsOfURL:viewURL
                                                        encoding:NSUTF8StringEncoding
                                                           error:NULL];
      
      NSString* content = [MMMarkdown HTMLStringWithMarkdown:fileAsString error:NULL];
      NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
      response.responseData = contentData;
   }
   
   handler();
}@end
