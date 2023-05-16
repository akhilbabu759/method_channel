package com.example.methode_channel_sample

import android.graphics.Color
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel as MethodChannel1

class MainActivity: FlutterActivity() {
    var channelName = "sample";
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var channel = MethodChannel1(flutterEngine.dartExecutor.binaryMessenger, channelName);
        channel.setMethodCallHandler { call, result ->
            if (call.method == "changeColor") {
                Toast.makeText(this,"sample method channel",Toast.LENGTH_LONG).show();
            }
        }
    }
}


