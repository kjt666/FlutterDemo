package com.fengwo.reading.flutter_app

import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

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
                            "image" -> {
                                val imageName = call.argument<String>("name")
                                val bitmap = BitmapFactory.decodeResource(resources, RUtils.getDrawableId(this@MainActivity, imageName))
                                val filePath = "${externalCacheDir?.absolutePath}${File.separator}$imageName"
                                val fos = FileOutputStream(filePath)
                                val sucess = bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos)
                                if (sucess)result.success(filePath) else result.error("","图片本地化失败",null)
                            }
                            "logger"->{
                                val level = call.argument<String>("level")
                                val message = call.argument<String>("message")
                                val error = call.argument<String>("error")
                                println("level->$level,message->$message,error->$error")
                                val data = call.argument<List<String>>("data")
                                data?.forEach { println("Android ------> $it") }
                            }
                            else -> result.notImplemented()
                        }
                    }

                })
    }


}
