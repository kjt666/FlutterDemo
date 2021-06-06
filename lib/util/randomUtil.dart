import 'dart:math';
import 'dart:ui';

class RandomUtil {
  static Color randomColor() {
    return Color.fromRGBO(randomInt(), randomInt(), randomInt(), 1);
  }

  static int randomInt() {
    return Random.secure().nextInt(255);
  }
}
