//
//  NativeVideoPlayer.js
//
//  A plugin to enable the native video player in IOS
//
//  Created by Varsity Software, Inc on 10-17-13.
//  MIT Licensed
//  Copyright 2013 Decaf Varsity Software, Inc. All rights reserved.

var exec = function (methodName, options, success, error) {
    cordova.exec(success, error, "NativeVideoPlayer", methodName, options);
};

var log = function (msg) {
    console.log("NativeVideoPlayer[js]: " + msg);
};

var NativeVideoPlayer = function () {
    this.options = {};
};

NativeVideoPlayer.prototype.init = function (options) {
    this.options = {
        ready:    options.ready || function () {},
        error:    options.error || function () {}
    };
};


module.exports = new NativeVideoPlayer();
