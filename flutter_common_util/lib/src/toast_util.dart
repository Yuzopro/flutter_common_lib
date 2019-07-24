import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showMessgae(String message) {
    ToastBuilder builder = ToastBuilder();
    builder.msg(message);
    showBuilder(builder);
  }

  static void showBuilder(ToastBuilder builder) {
    Fluttertoast.showToast(
        msg: builder.getMsg(),
        toastLength: builder.getToastLength(),
        gravity: builder.getGravity(),
        timeInSecForIos: builder.getTimeInSecForIos(),
        backgroundColor: builder.getBackgroundColor(),
        textColor: builder.getTextColor(),
        fontSize: builder.getFontSize());
  }
}

class ToastBuilder {
  String _msg;
  Toast _toastLength = Toast.LENGTH_SHORT;
  int _timeInSecForIos = 1;
  double _fontSize = 14.0;
  ToastGravity _gravity = ToastGravity.BOTTOM;
  Color _backgroundColor = Colors.black;
  Color _textColor = Colors.white;

  ToastBuilder msg(String msg) {
    this._msg = msg;
  }

  ToastBuilder length(Toast toastLength) {
    this._toastLength = toastLength;
  }

  ToastBuilder timeInSecForIos(int timeInSecForIos) {
    this._timeInSecForIos = timeInSecForIos;
  }

  ToastBuilder fontSize(double fontSize) {
    this._fontSize = fontSize;
  }

  ToastBuilder gravity(ToastGravity gravity) {
    this._gravity = gravity;
  }

  ToastBuilder backgroundColor(Color backgroundColor) {
    this._backgroundColor = backgroundColor;
  }

  ToastBuilder textColor(Color textColor) {
    this._textColor = textColor;
  }

  String getMsg() {
    return _msg;
  }

  Toast getToastLength() {
    return _toastLength;
  }

  int getTimeInSecForIos() {
    return _timeInSecForIos;
  }

  double getFontSize() {
    return _fontSize;
  }

  ToastGravity getGravity() {
    return _gravity;
  }

  Color getBackgroundColor() {
    return _backgroundColor;
  }

  Color getTextColor() {
    return _textColor;
  }
}
