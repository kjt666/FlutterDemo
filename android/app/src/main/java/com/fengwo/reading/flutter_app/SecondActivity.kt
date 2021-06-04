package com.fengwo.reading.flutter_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity : FlutterActivity() {

    lateinit var channel: MethodChannel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val stringExtra = intent.getStringExtra("msg")
        if (stringExtra != null) {
            tv_value.text = stringExtra
        }
        btn.setOnClickListener {
            channel.invokeMethod("lal", "Hello~ \nI'm android", object : MethodChannel.Result {
                override fun notImplemented() {
                    TODO("Not yet implemented")
                }

                override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                    Toast.makeText(this@SecondActivity, "error：$errorMessage", Toast.LENGTH_SHORT).show()
                }

                override fun success(result: Any?) {
                    if (result != null)
                        Toast.makeText(this@SecondActivity, result as String, Toast.LENGTH_SHORT).show()
                }

            })
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NATIVE)
    }
}