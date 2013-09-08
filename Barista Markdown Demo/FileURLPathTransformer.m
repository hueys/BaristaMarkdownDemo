//
//  FileURLPathTransformer.m
//  Barista Markdown Demo
//
//  Created by Steven Huey on 9/8/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import "FileURLPathTransformer.h"

const NSString* const kFileURLPathTransformer = @"FileURLPathTransfomer";

@implementation FileURLPathTransformer

#pragma mark - NSValueTransformer

+ (BOOL)allowsReverseTransformation
{
   return YES;
}

+ (Class)transformedValueClass
{
   return [NSString class];
}

- (id)transformedValue:(id)value
{
   id transformedValue = nil;
   
   if ([value isKindOfClass:[NSURL class]])
   {
      NSURL* url = (NSURL*)value;
      
      transformedValue = [url path];
   }
   
   return transformedValue;
}

- (id)reverseTransformedValue:(id)value
{
   id reverseTransformedValue = nil;
   
   if ([value isKindOfClass:[NSString class]])
   {
      reverseTransformedValue = [NSURL fileURLWithPath:(NSString*)value];
   }
   
   return reverseTransformedValue;
}

@end
