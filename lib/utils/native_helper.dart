import 'package:flutter/services.dart';

class NativeHelper {
  static const platform = MethodChannel('com.example/native_channel');

  static Future<String> getNativeMessage() async {
    try {
      final String result = await platform.invokeMethod('getNativeMessage');
      return result;
    } on PlatformException catch (err) {
      return 'Error: ${err.message}';
    }
  }
}
