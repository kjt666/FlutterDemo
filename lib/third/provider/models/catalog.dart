import 'dart:ui';

import 'package:flutter/material.dart';


///用户可以购买的商品目录的代理。
///
///在真正的应用程序中，这可能由后端支持并缓存在设备上。
///在这个示例应用程序中，目录是按程序生成的，并且是无限的。
///
///为了简单起见，目录应该是不可变的（没有产品
///期望在应用程序的执行期间被添加、移除或改变）。
class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  ///通过[id]获取项目。
  ///
  ///在这个示例中，目录是无限的，在[itemNames]上循环。
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  /// 按目录中的位置获取项目。
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      //为了让示例应用程序看起来更好，每个项目都有一个
      //材料设计原色。
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
