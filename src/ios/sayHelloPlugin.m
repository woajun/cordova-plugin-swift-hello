#import "sayHelloPlugin.h"

@implementation sayHelloPlugin

- (void)sayHello:(CDVInvokedUrlCommand*)command {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hello" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:defaultAction];
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

@end
