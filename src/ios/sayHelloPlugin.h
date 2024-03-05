#import <Cordova/CDV.h>

@interface sayHelloPlugin : CDVPlugin

- (void)sayHello:(CDVInvokedUrlCommand*)command;
- (void)initKakaoSDK:(CDVInvokedUrlCommand*)command;
- (void)addChannel:(CDVInvokedUrlCommand*)command;

@end