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
                                if (call.hasArgument("name")) {
                                    val path = call.argument<String>("name")?.let { getImageAsFile(it) }
                                    if (path.isNullOrEmpty()) {
                                        result.error("-1", "调用原生图片失败", null)
                                    } else {
                                        result.success(path)
                                    }
                                }
                            }
                            "logger"->{
                                val level = call.argument<String>("level")
                                val message = call.argument<String>("message")
                                val error = call.argument<String>("error")
                                println("level->$level,message->$message,error->$error")
                                val data = call.argument<List<String>>("data")
                                data?.forEach { println("Android ------> $it") }
                            }
	                        "saveImage"->{
		                        if (call.hasArgument("data")) {
			                        val flag = call.argument<ByteArray>("data")?.let { saveImage(it) }
			                        if (flag!=null&&flag) {
				                        result.success(flag)
			                        } else {
				                        result.error("-1", "调用原生图片失败", null)
			                        }
		                        }
							}
                            else -> result.notImplemented()
                        }
                    }

                })
    }

    private fun getImageAsFile(imageName: String): String {
        var imageFilePath = "$externalCacheDir${File.separator}$imageName"
        val imageFile = File(imageFilePath)
        if (!imageFile.exists()) {
            var imageId = resources.getIdentifier(imageName, "mipmap", packageName)
            if (imageId == 0) {
                imageId = resources.getIdentifier(imageName, "drawable", packageName)
            }
            if (imageId == 0) {
                return ""
            }
            val imageBitmap = BitmapFactory.decodeResource(resources, imageId)
            val fos = FileOutputStream(imageFile)
            val success = imageBitmap.compress(Bitmap.CompressFormat.PNG, 100, fos)
            if (!success) {
                imageFile.delete()
                return ""
            }
        }
        return imageFilePath
    }

	private fun saveImage(data: ByteArray?): Boolean {
		if (data==null||data.isEmpty()){
			return false
		}
		var imageFilePath = "$externalCacheDir${File.separator}123.png"
		val imageFile = File(imageFilePath)
		val bitmap = BitmapFactory.decodeByteArray(data, 0, data.size)
		val fos = FileOutputStream(imageFile)
		val success = bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos)
		if (!success) {
			imageFile.delete()
			return false
		}
		return true
	}

}
