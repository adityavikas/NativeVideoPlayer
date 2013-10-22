NativeVideoPlayer
=================

PhoneGap plugin to access native video player in IOS


Usage
=================

var strURL = "http://www.YOURURL.com/video.mp4";    
window.playNativeVideo(strURL, onVideoStart, onVideoFail);      

function onVideoStart(strFileURL) { 
}

function onVideoFail(err) { 
}
