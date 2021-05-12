import 'dart:math';

import 'package:flutter/cupertino.dart';

class RandomUtil{
  
  static Random _random = Random.secure();
  
  
  static int getInt(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  static Color getColor(){
    return Color.fromRGBO(
        _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);
  }
}