// import 'package:flutter_test/flutter_test.dart';
// import 'package:imin_whitelist_printer/imin_whitelist_printer.dart';
// import 'package:imin_whitelist_printer/imin_whitelist_printer_platform_interface.dart';
// import 'package:imin_whitelist_printer/imin_whitelist_printer_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockIminWhitelistPrinterPlatform
//     with MockPlatformInterfaceMixin
//     implements IminWhitelistPrinterPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final IminWhitelistPrinterPlatform initialPlatform = IminWhitelistPrinterPlatform.instance;

//   test('$MethodChannelIminWhitelistPrinter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelIminWhitelistPrinter>());
//   });

//   test('getPlatformVersion', () async {
//     IminWhitelistPrinter iminWhitelistPrinterPlugin = IminWhitelistPrinter();
//     MockIminWhitelistPrinterPlatform fakePlatform = MockIminWhitelistPrinterPlatform();
//     IminWhitelistPrinterPlatform.instance = fakePlatform;

//     expect(await iminWhitelistPrinterPlugin.getPlatformVersion(), '42');
//   });
// }
