import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'imin_whitelist_printer_method_channel.dart';

// import 'whitelist_method_channel.dart';

/// Abstract class sebagai interface untuk mengatur whitelist.
abstract class IminWhitelistPlatform extends PlatformInterface {
  IminWhitelistPlatform() : super(token: _token);

  static final Object _token = Object();

  static IminWhitelistPlatform _instance = IminMethodChannelWhitelist();

  static IminWhitelistPlatform get instance => _instance;

  static set instance(IminWhitelistPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> addWhitelist(String packageName) {
    throw UnimplementedError('addWhitelist() has not been implemented.');
  }

  Future<void> removeWhitelist(String packageName) {
    throw UnimplementedError('removeWhitelist() has not been implemented.');
  }

  Future<void> clearWhitelist() {
    throw UnimplementedError('clearWhitelist() has not been implemented.');
  }

  Future<List<String>> getWhitelist() {
    throw UnimplementedError('getWhitelist() has not been implemented.');
  }
}
