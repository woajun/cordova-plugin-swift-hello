#import <Cordova/CDV.h>

@interface sayHelloPlugin : CDVPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)sayHello:(CDVInvokedUrlCommand*)command;

@end