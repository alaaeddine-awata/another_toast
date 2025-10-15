import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'another_toast_platform_interface.dart';

/// An implementation of [AnotherToastPlatform] that uses method channels.
class MethodChannelAnotherToast extends AnotherToastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('another_toast');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
