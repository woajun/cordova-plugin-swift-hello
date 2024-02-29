#import <Cordova/CDV.h>

@interface sayHelloPlugin : CDVPlugin

- (void)sayHello:(CDVInvokedUrlCommand*)command;

@end