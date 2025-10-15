import 'package:flutter_test/flutter_test.dart';
import 'package:another_toast/another_toast.dart';
import 'package:another_toast/another_toast_platform_interface.dart';
import 'package:another_toast/another_toast_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnotherToastPlatform
    with MockPlatformInterfaceMixin
    implements AnotherToastPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnotherToastPlatform initialPlatform = AnotherToastPlatform.instance;

  test('$MethodChannelAnotherToast is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnotherToast>());
  });
}
