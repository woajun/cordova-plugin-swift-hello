/********* sayHelloPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface sayHelloPlugin : CDVPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)sayHello:(CDVInvokedUrlCommand*)command;

@end

@implementation sayHelloPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)sayHello:(CDVInvokedUrlCommand*)command {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hello" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:defaultAction];
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

@end
