package com.odn.cordova.plugin.kakao

import org.apache.cordova.CordovaPlugin
import org.apache.cordova.CordovaArgs
import org.apache.cordova.CallbackContext

import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.util.Base64

import org.json.JSONArray
import org.json.JSONObject

import java.security.MessageDigest

import com.kakao.sdk.common.KakaoSdk
import com.kakao.sdk.talk.TalkApiClient

class OdnCordovaPluginKakao : CordovaPlugin() {
  companion object {
    const val PLUGIN_NAME = "OdnCordovaPluginKakao";
  }

  override fun pluginInitialize() {
    super.pluginInitialize()
    val e: String = super.cordova.context.packageName
    val ai: ApplicationInfo = super.cordova.context.packageManager.getApplicationInfo(e, PackageManager.GET_META_DATA)
    val bundle: Bundle = ai.metaData
    var apiKey = bundle.getString("com.kakao.sdk.AppKey")

    if (apiKey != null) {
      println("[kakao initialized]")
      KakaoSdk.init(super.cordova.context, apiKey)
    }
  }

  override fun execute(action: String?, args: CordovaArgs?, callbackContext: CallbackContext?): Boolean {
    when (action) {
      "addChannel" -> {
        println("[kakao addChannel]")
        val arg = args?.get(0)
        if (arg != null && arg is String && callbackContext != null) {
          TalkApiClient.instance.addChannel(super.cordova.context, arg) { error ->
            if (error != null) {
              println("카카오톡 채널 추가 실패 $error")
            }
          }
        }
      }
    }
    return true
  }
}