var exec = require('cordova/exec');

exports.addChannel = function (arg0, success, error) {
    exec(success, error, 'OdnCordovaPluginKakao', 'addChannel', [arg0]);
};
