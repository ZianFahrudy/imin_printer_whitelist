import 'package:flutter/services.dart';

import 'imin_whitelist_printer_platform_interface.dart';

/// An implementation of [IminWhitelistPrinterPlatform] that uses method channels.

/// Implementasi default menggunakan MethodChannel
class IminMethodChannelWhitelist extends IminWhitelistPlatform {
  static const MethodChannel _channel = MethodChannel('imin_whitelist_printer');

  @override
  Future<void> addWhitelist(String packageName) async {
    await _channel.invokeMethod('addWhitelist', {"package": packageName});
  }

  @override
  Future<void> removeWhitelist(String packageName) async {
    await _channel.invokeMethod('removeWhitelist', {"package": packageName});
  }

  @override
  Future<void> clearWhitelist() async {
    await _channel.invokeMethod('clearWhitelist');
  }

  @override
  Future<List<String>> getWhitelist() async {
    final String result = await _channel.invokeMethod('getWhitelist');
    return result.isNotEmpty ? result.split(",") : [];
  }
}
