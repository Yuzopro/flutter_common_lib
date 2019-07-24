import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_common_util/flutter_common_util.dart';

class ColorUtil {
  /// 可以输入多种格式的颜色代码，如: 0x000000,0xff000000,#000000
  static Color str2Color(String colorString, {double alpha = 1.0}) {
    if (TextUtil.isEmpty(colorString)) {
      return Colors.black;
    }
    String colorStr = colorString;
    // colorString未带0xff前缀并且长度为6
    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }
    // colorString为8位，如0x000000
    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    // colorString为7位，如#000000
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }
    // 先分别获取色值的RGB通道
    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    // 通过fromRGBO返回带透明度和RGB值的颜色
    return Color.fromRGBO(red, green, blue, alpha);
  }
}
