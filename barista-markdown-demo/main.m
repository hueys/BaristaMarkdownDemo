//
//  main.m
//  barista-markdown-demo
//
//  Created by Steven Huey on 9/6/13.
//  Copyright (c) 2013 Steven Huey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaristaMarkdownDemo.h"

int main(int argc, const char * argv[])
{
   @autoreleasepool
   {
      BaristaMarkdownDemo* demo = [[BaristaMarkdownDemo alloc] init];
      
      [demo runWithURL:nil];
   }
   
   return 0;
}

