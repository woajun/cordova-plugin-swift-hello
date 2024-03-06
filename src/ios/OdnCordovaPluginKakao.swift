import Foundation
import KakaoSDKCommon
import KakaoSDKTalk
import UIKit

@objc(OdnCordovaPluginKakao)
class OdnCordovaPluginKakao: CDVPlugin {

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
