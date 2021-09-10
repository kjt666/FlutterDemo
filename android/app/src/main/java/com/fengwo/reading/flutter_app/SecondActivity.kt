package com.fengwo.reading.flutter_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity : FlutterActivity() {

    lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NATIVE)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val stringExtra = intent.getStringExtra("msg")
        if (stringExtra != null) {
            tv_value.text = stringExtra
        }
        tv_value.text = "density = ${getResources().getDisplayMetrics().toString()}\ndensityDpi = ${getResources().getDisplayMetrics().densityDpi}"
        btn.setOnClickListener {
            channel.invokeMethod("lal", "android", object : MethodChannel.Result {
                override fun notImplemented() {
                    Toast.makeText(this@SecondActivity, "notImplemented", Toast.LENGTH_SHORT).show()
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
}