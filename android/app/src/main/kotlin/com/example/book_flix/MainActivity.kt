package com.example.book_flix

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/native_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNativeMessage") {
                val message = getNativeMessage()
                result.success(message)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeMessage(): String {
        return "Hello from Native Kotlin!"
    }
}
