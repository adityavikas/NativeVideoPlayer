//
//  NativeVideoPlayer.m
//
//
//  Created by Varsity Software, Inc on 10-17-13.
//  MIT Licensed
//  Copyright 2013 Decaf Varsity Software, Inc. All rights reserved.

#import "NativeVideoPlayer.h"
#import "MediaPlayer/MPMoviePlayerViewController.h"
#import "MediaPlayer/MPMoviePlayerController.h"
#import <Cordova/CDVViewController.h>
#import <Cordova/CDV.h>

@implementation NativeVideoPlayer

- (void)play:(CDVInvokedUrlCommand*)command
{
    //NSString* callbackId = command.callbackId;
    NSDictionary* options = [command.arguments objectAtIndex:0];
    
    if ([options isKindOfClass:[NSNull class]]) {
        options = [NSDictionary dictionary];
    }
    
    CDVPluginResult* pluginResult = nil;
    
    NSString* filePath = [command.arguments objectAtIndex:0];
    
    if (filePath != nil && [filePath length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: filePath];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    MPMoviePlayerViewController *playerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:filePath]] ;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MovieDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];

    playerVC.moviePlayer.controlStyle = MPMovieControlStyleNone;
    playerVC.moviePlayer.shouldAutoplay = YES;
    
    playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self.viewController presentViewController:playerVC animated:NO completion:nil];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)MovieDidFinish:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    int reason = [[[notification userInfo] valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    if (reason == MPMovieFinishReasonPlaybackEnded) {
        //movie finished playin
    }else if (reason == MPMovieFinishReasonUserExited) {
        //user hit the done button
    }else if (reason == MPMovieFinishReasonPlaybackError) {
        //error
    }
    
    self.viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.viewController dismissViewControllerAnimated:NO completion:nil];
    
    [self.viewController removeFromParentViewController];
    
    [self writeJavascript:[NSString stringWithFormat:@"onVideoEnd(\"%d\");", reason]];
    
}


@end
