//
//  NativeVideoPlayer.h
//
//
//  Created by Varsity Software, Inc on 10-17-13.
//  MIT Licensed
//  Copyright 2013 Decaf Varsity Software, Inc. All rights reserved.

#import <Cordova/CDV.h>

@interface NativeVideoPlayer : CDVPlugin{
    NSString *movie;
}

- (void)play:(CDVInvokedUrlCommand*)command;

@end
