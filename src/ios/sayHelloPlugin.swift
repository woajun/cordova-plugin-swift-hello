import UIKit
import Foundation

@objc(sayHelloPlugin)
class sayHelloPlugin: CDVPlugin {
    
    @objc(sayHello:)
    func sayHello(_ command: CDVInvokedUrlCommand) {
        // "Hello" 메시지를 포함한 UIAlertController를 생성합니다.
        let alert = UIAlertController(title: "Hello Swift", message: nil, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        
        // 현재의 ViewController를 가져와서 UIAlertController를 표시합니다.
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        
        // JavaScript에 결과를 반환합니다.
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
}
