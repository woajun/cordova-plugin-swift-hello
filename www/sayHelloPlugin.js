var exec = require('cordova/exec');

exports.sayHello = function (arg0, success, error) {
    exec(success, error, 'sayHelloPlugin', 'sayHello', [arg0]);
};

exports.initKakaoSDK = function (arg0, success, error) {
    exec(success, error, 'sayHelloPlugin', 'initKakaoSDK', [arg0]);
};

exports.addChannel = function (arg0, success, error) {
    exec(success, error, 'sayHelloPlugin', 'addChannel', [arg0]);
};
