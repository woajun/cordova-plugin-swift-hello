var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'sayHelloPlugin', 'coolMethod', [arg0]);
};

exports.sayHello = function (arg0, success, error) {
    exec(success, error, 'sayHelloPlugin', 'sayHello', [arg0]);
};
