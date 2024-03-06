var exec = require('cordova/exec');

exports.initKakaoSDK = function (arg0, success, error) {
    exec(success, error, 'OdnCordovaPluginKakao', 'initKakaoSDK', [arg0]);
};

exports.addChannel = function (arg0, success, error) {
    exec(success, error, 'OdnCordovaPluginKakao', 'addChannel', [arg0]);
};
