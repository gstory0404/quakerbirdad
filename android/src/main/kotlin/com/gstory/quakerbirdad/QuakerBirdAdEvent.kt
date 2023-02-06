package com.gstory.quakerbirdad

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/**
 * @Author: gstory
 * @CreateDate: 2023/2/3 16:18
 * @Description: java类作用描述
 */

class QuakerBirdAdEvent : FlutterPlugin, EventChannel.StreamHandler {
    companion object {
        private var eventChannel: EventChannel? = null

        private var eventSink: EventChannel.EventSink? = null

        private var context: Context? = null

        fun sendContent(content: MutableMap<String, Any?>) {
            eventSink?.success(content)
        }

        fun sendError(errorCode: String, errorMessage: String, content: MutableMap<String, Any?>) {
            eventSink?.error(errorCode, errorMessage, content)
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel = EventChannel(binding.binaryMessenger, QuakerBirdAdConfig.adevent)
        eventChannel?.setStreamHandler(this)
        context = binding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel?.setStreamHandler(null)
        eventChannel = null
    }
}