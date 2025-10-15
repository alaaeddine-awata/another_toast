import 'package:flutter/services.dart';

class AnotherToast {
  static const MethodChannel _channel = MethodChannel('another_toast');

  static Future<void> showToast({
    required String message,
    ToastLength length = ToastLength.short,
    String backgroundColor = "#323232",
    String textColor = "#FFFFFF",
    double fontSize = 16,
    double radius = 16,
    ToastGravity gravity = ToastGravity.bottom,
  }) async {
    await _channel.invokeMethod('showToast', {
      'message': message,
      'length': length.name,
      'backgroundColor': backgroundColor,
      'textColor': textColor,
      'fontSize': fontSize,
      'radius': radius,
      'gravity': gravity.name,
    });
  }
}

enum ToastLength {
  short,
  long,
}

enum ToastGravity {
  top,
  center,
  bottom,
}
