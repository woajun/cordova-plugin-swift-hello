import Foundation
import KakaoSDKCommon
import KakaoSDKTalk
import UIKit

@objc(sayHelloPlugin)
class sayHelloPlugin: CDVPlugin {

  @objc(sayHello:)
  func sayHello(_ command: CDVInvokedUrlCommand) {
    print("Hello, world!")

    if let message = command.arguments.first as? String {
      let alert = UIAlertController(title: "Hello Swift", message: message, preferredStyle: .alert)
      let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(defaultAction)
      if let viewController = UIApplication.shared.keyWindow?.rootViewController {
        viewController.present(alert, animated: true, completion: nil)
      }
      let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
      self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
  }

  @objc(initKakaoSDK:)
  func initKakaoSDK(_ command: CDVInvokedUrlCommand) {
    KakaoSDK.initSDK(appKey: "ba758ad99735aef083caea6309ee58b4")
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }

  @objc(addChannel:)
  func addChannel(_ command: CDVInvokedUrlCommand) {
    TalkApi.shared.addChannel(channelPublicId: "_hlZXG") { error in
      if let error = error {
        print(error)
      } else {
        print("addChannel() success.")
      }
    }
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }
}
