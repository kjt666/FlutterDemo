package com.fengwo.reading.flutter_app;

import android.app.Application;
import android.content.Context;
import android.text.TextUtils;

/**
 * @Description :   根据图片名称设置本地图片
 */
public class RUtils {

    public static int getDrawableId(Context context,String name) {
        if (TextUtils.isEmpty(name)) {
            return 0;
        }
        int resID = context.getResources().getIdentifier(name, "mipmap", Application.getProcessName());
        return resID;
    }
}
