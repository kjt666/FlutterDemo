package com.fengwo.reading.flutter_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity : FlutterActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val stringExtra = intent.getStringExtra("msg")
        if (stringExtra!=null){
            tv_value.text = stringExtra
        }
    }
}