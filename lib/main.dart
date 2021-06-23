import 'dart:convert';

import 'package:dio/dio.dart';

// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/httpResponse.dart';
import 'package:flutter_app/bean/user_bean.dart';
import 'package:flutter_app/other/jumpPage.dart';
import 'package:flutter_app/util/DioUtil.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(RefreshConfiguration(
      maxOverScrollExtent: 50, maxUnderScrollExtent: 50, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,

          //配置分割线样式
          dividerTheme: DividerThemeData(
              space: 1,
              thickness: 1,
              color: Colors.redAccent,
              indent: 10,
              endIndent: 10)),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> with WidgetsBindingObserver {
  var logger = Logger(printer: PrettyPrinter());
  var _result = "";
  TextStyle headTextStyle = new TextStyle(fontSize: 10, color: Colors.grey);

  var userData = User_data();

  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    MethodChannelUtil.nativeChannel.setMethodCallHandler((call) {
      if (call.method == "lal") {
        return Future.value("Hello~ ${call.arguments}\nI'm flutter");
      }
      return null;
    });
    WidgetsBinding.instance.addObserver(this);
    DioUtil.init();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /*
      resumed - 应用程序可见并响应用户输入。这是来自Android的onResume
      inactive - 应用程序处于非活动状态，并且未接收用户输入。此事件在Android上未使用，仅适用于iOS
      paused - 应用程序当前对用户不可见，不响应用户输入，并在后台运行。这是来自Android的暂停
      suspending - 该应用程序将暂时中止。这在iOS上未使用
   */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _lastLifecycleState = state;
    print(state);
  }

  void getUserData() async {
    var response = await DioUtil.dio.post("m/user/login",
        // options:
        //     buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 30)),
        data: {
          'type': 'mobile',
          'data':
              'Mad2VU9hb7qCUQK7lzh/A6rkIE/pT7MsTwI/ySkofvT3A0gZvuVkyvpu1lvKmgZwg54bnQV9Yr95tFfISFTsghJ2AmzOPsPI4o7MUy9fJx2OJ9rQmBhpXUBsa0xn21Fk6OPCEJTdBI5qWJjPIGgBwap9ByP1ze6H5v7awo/0ZSH9y8h3lUbH35/2vYavWoQW/ApZQKFzojfOodL21FgWcOsiR7u1eODKAELZoTwJY0BR/SZ1ZJdNJPyYUS8bPluP6UrdQ5t+QP+ZxEPjpDA9DFHXs3beLzfaqgeMI5SlM9cruUszrUSRVa3E7fa471rtr6ucdGKekOEiGzvsuQcIQA==',
          'device_id': '27c3a291-1f00-4c36-b7f0-762dd3076b9d'
        });
    print(response.data);
    Map<String, dynamic> data = json.decode(response.data);
    HttpResponse httpResponse = HttpResponse.fromJson(data);
    setState(() {
      userData = httpResponse.data.userData;
    });
    // HttpResponse httpResponse = HttpResponse.fromJson(response.data);
    print(httpResponse.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: new Text("Flutter Test")),
      body: Container(
          child: ListView(
        children: [
          getTitleBar(),
          getHeader(),
          getTabs(),
          new Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
              child: new Image.asset("images/home_ganxingqu_cardbg.png")),
          getItem(Icons.star_border, "我的收藏"),
          getHorizonLine(),
          // Divider(),
          getItem(Icons.supervisor_account, "我的社群"),
          getHorizonLine(),
          getItem(Icons.cloud_download, "我的缓存"),
          new Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: getItem(Icons.adjust, "兴趣管理")),
          getItem(Icons.archive, "订单中心"),
          getHorizonLine(),
          getItem(Icons.all_inclusive, "我的礼物"),
          new Padding(
              padding: EdgeInsets.only(top: 10),
              child: getItem(Icons.alternate_email, "联系客服")),
          getHorizonLine(),
          new Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: getItem(Icons.wifi_tethering, "邀请好友注册有书APP")),
        ],
      )),
    );
  }

  Widget getTitleBar() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new IconButton(
            icon: new Icon(
              Icons.query_builder,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new JumpPage()),
              );
            },
          ),
          new Expanded(
            child: new Center(
              child: new Text("我的",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            flex: 1,
          ),
          new Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                getUserData();
              },
              icon: new Icon(
                Icons.email,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
          new IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () {
                MethodChannelUtil.nativeChannel.invokeMethod("jumpToNative",
                    {'msg': userData == null ? "" : userData.toString()});
              })
        ],
      ),
    );
  }

  Widget getHeader() {
    return new Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: new Row(
        children: [
          new Container(
              width: 60,
              height: 60,
              child: new CircleAvatar(
                  radius: 100,
                  backgroundImage: userData.avatar == null
                      ? AssetImage('images/head.jpg')
                      : NetworkImage(userData.avatar))),
          new Expanded(
            flex: 1,
            child: new Padding(
              padding: EdgeInsets.only(left: 15),
              child: new Column(
                children: [
                  new Row(
                    children: [
                      new Text(verify(userData.name),
                          style: new TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black)),
                      new Container(
                        // width: 25,
                        // height: 25,
                        child: new Padding(
                            padding: EdgeInsets.only(left: 5, right: 3),
                            child:
                                new Image.asset('images/new_vip_tag_icon.png')),
                      ),
                      new Container(
                        // width: 50,
                        // height: 18,
                        child: new Image.asset("images/new_xiucai_tag.png"),
                      )
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 3, bottom: 3),
                    child: new Row(
                      children: [
                        new Text("ID：${verify(userData.userId)}",
                            style: headTextStyle),
                        new Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: new Text("关注：${verify(userData.userType)}",
                                style: headTextStyle)),
                        new Text("粉丝：${verify(userData.badgeId)}",
                            style: headTextStyle)
                      ],
                    ),
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Icon(Icons.android,
                          color: Colors.grey[350], size: 15),
                      new Text(verify(userData.intro), style: headTextStyle)
                    ],
                  )
                ],
              ),
            ),
          ),
          new Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget getTabs() {
    return new Padding(
        padding: EdgeInsets.only(top: 15),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getHeaderTab(verify(userData.level), "已购"),
            getVerticalLine(),
            getHeaderTab(verify(userData.isUnlock), "优惠券"),
            getVerticalLine(),
            getHeaderTab(verify(userData.coins), "我的金币"),
            getVerticalLine(),
            getHeaderTab(verify(userData.androidMoney), "有书币")
          ],
        ));
  }

  Widget getHeaderTab(String a, String b) {
    return new Column(children: [
      new Text(a, style: new TextStyle(fontSize: 14, color: Colors.black)),
      new Padding(
        padding: EdgeInsets.only(top: 5),
        child:
            new Text(b, style: new TextStyle(fontSize: 10, color: Colors.grey)),
      )
    ]);
  }

  Widget getVerticalLine() {
    return SizedBox(
      width: 0.5,
      height: 18,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey[300]),
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await Dio().get('http://www.google.cn');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Widget getItem(IconData icon, String title, {onClick: GestureTapCallback}) {
    return Container(
        height: 45,
        color: Colors.white,
        child: new GestureDetector(
            onTap: () {
              logger.d(title);
              Fluttertoast.showToast(
                  msg: title,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM);
            },
            child: new Row(
              children: [
                new Padding(
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: new Icon(icon, size: 20, color: Colors.black),
                ),
                new Expanded(
                    flex: 1,
                    child: new Text(title,
                        style:
                            new TextStyle(color: Colors.black, fontSize: 15))),
                new Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: new Icon(Icons.arrow_forward_ios,
                      size: 12, color: Colors.grey),
                )
              ],
            )));
  }

  Widget getHorizonLine() {
    return SizedBox(
      height: 0.5,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey[200]),
      ),
    );
  }

  String verify(String value) {
    return value != null && value.isNotEmpty ? value : "xxx";
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
