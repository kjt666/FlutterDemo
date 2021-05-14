import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListWheelScrollViewPage extends StatelessWidget {
  var citys = [
    "北京市",
    "广东省",
    "山东省",
    "江苏省",
    "河南省",
    "上海市",
    "河北省",
    "浙江省",
    "香港特别行政区",
    "陕西省",
    "湖南省",
    "重庆市",
    "福建省",
    "天津市",
    "云南省",
    "四川省",
    "广西壮族自治区",
    "安徽省",
    "海南省",
    "江西省",
    "湖北省",
    "山西省",
    "辽宁省",
    "台湾省",
    "黑龙江",
    "内蒙古自治区",
    "澳门特别行政区",
    "贵州省",
    "甘肃省",
    "青海省",
    "新疆维吾尔自治区",
    "西藏自治区",
    "吉林省",
    "宁夏回族自治区"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListWheelScrollView"),
        ),
        body: FractionallySizedBox(
          heightFactor: 0.3,
          child: ListWheelScrollView(
            itemExtent: 42,
            diameterRatio: 1,
            //使用放大镜
            // useMagnifier: true,
            //放大倍数
            // magnification: 1.2,
            //非选中item透明度
            // overAndUnderCenterOpacity: 0.4,
            //item挤压倍数，1为标准
            squeeze: 2,
            //x轴角度
            // offAxisFraction: 0.5,
            children: [
              for (var i = 0; i < citys.length; i++) getItem(citys[i])
            ],
          ),
        ));
  }

  Widget getItem(String name) {
    return ListTile(
      title: Text(
        name,
        textAlign: TextAlign.center,
      ),
    );
  }
}
