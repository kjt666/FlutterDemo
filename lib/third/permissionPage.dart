import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            var status = await Permission.camera.status;
            //被拒绝
            if(status.isDenied){
              Fluttertoast.showToast(msg: "没有此权限");
              // openAppSettings();
              var request = await Permission.camera.request();
              if(request.isGranted){
                Fluttertoast.showToast(msg: "已授予此权限");
              }
              if(request.isDenied){
                Fluttertoast.showToast(msg: "拒绝授予此权限");
              }
            }
            //已授予
            if(status.isGranted){
              Fluttertoast.showToast(msg: "已授予此权限");
            }
            //收到限制，拥有部分权限（仅用于IOS）
            if(status.isRestricted){
              Fluttertoast.showToast(msg: "拥有部分权限");
            }
            //永久拒绝
            if(status.isPermanentlyDenied){
              Fluttertoast.showToast(msg: "此权限已被永久拒绝");
              openAppSettings();
            }
            //拥有部分权限
            if(status.isLimited){
              Fluttertoast.showToast(msg: "拥有部分权限");
            }
            //临时的
            if(status.isProvisional){
              Fluttertoast.showToast(msg: "拥有临时权限");
            }
          },
          child: Text("检查通知权限并申请"),
        ),
      ),
    );
  }
}
