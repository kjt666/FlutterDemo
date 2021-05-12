package com.fengwo.reading.flutter_app

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

const val CHANNEL_NATIVE = "com.fengwo.reading.flutter_app/native"

class MainActivity : FlutterActivity() {

//    internal  lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NATIVE)
                .setMethodCallHandler(object : MethodChannel.MethodCallHandler {
                    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                        when (call.method) {
                            "jumpToNative" -> {
                                var msg = "来自flutter的数据"
                                val intent = Intent(this@MainActivity, SecondActivity::class.java)
                                if (call.arguments != null) {
                                    msg = call.argument<String>("msg").toString()
                                    intent.putExtra("msg", msg)
                                }
                                Toast.makeText(this@MainActivity, msg, Toast.LENGTH_SHORT).show()
                                startActivity(intent)
                                result.success("成功接收来自flutter的消息")
                            }
                            else -> result.notImplemented()
                        }
                    }

                })
    }


}
