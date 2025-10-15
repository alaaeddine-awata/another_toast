import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'another_toast_method_channel.dart';

abstract class AnotherToastPlatform extends PlatformInterface {
  /// Constructs a AnotherToastPlatform.
  AnotherToastPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnotherToastPlatform _instance = MethodChannelAnotherToast();

  /// The default instance of [AnotherToastPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnotherToast].
  static AnotherToastPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnotherToastPlatform] when
  /// they register themselves.
  static set instance(AnotherToastPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
