//
//  NativeVideoPlayer.js
//
//  A plugin to enable the native video player in IOS
//
//  Created by Varsity Software, Inc on 10-17-13.
//  MIT Licensed
//  Copyright 2013 Decaf Varsity Software, Inc. All rights reserved.

window.playNativeVideo = function(str, onStart, onFail) {
    cordova.exec(onStart, onFail, "NativeVideoPlayer", "play", [str]);
};

