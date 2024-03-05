import Foundation
import KakaoSDKCommon
import KakaoSDKTalk
import UIKit

@objc(OdnCordovaPluginKakao)
class OdnCordovaPluginKakao: CDVPlugin {

  @objc(sayHello:)
  func sayHello(_ command: CDVInvokedUrlCommand) {
    guard let message = command.arguments.first as? String else {
      return
    }

    let alert = UIAlertController(title: "Hello Swift", message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(defaultAction)
    if let viewController = UIApplication.shared.keyWindow?.rootViewController {
      viewController.present(alert, animated: true, completion: nil)
    }
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }

  @objc(initKakaoSDK:)
  func initKakaoSDK(_ command: CDVInvokedUrlCommand) {
    guard let appKey = command.arguments.first as? String else {
      return
    }

    KakaoSDK.initSDK(appKey: appKey)

    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
    self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
  }

  @objc(addChannel:)
  func addChannel(_ command: CDVInvokedUrlCommand) {
    guard let channelPublicId = command.arguments.first as? String else {
      return
    }

    TalkApi.shared.addChannel(channelPublicId: channelPublicId) { error in
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
