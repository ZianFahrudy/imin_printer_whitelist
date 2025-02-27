import 'imin_whitelist_printer_platform_interface.dart';

// import 'platform/whitelist_platform_interface.dart';

class IminWhitelistManager {
  static Future<void> addWhitelist(String packageName) async {
    await IminWhitelistPlatform.instance.addWhitelist(packageName);
  }

  static Future<void> removeWhitelist(String packageName) async {
    await IminWhitelistPlatform.instance.removeWhitelist(packageName);
  }

  static Future<void> clearWhitelist() async {
    await IminWhitelistPlatform.instance.clearWhitelist();
  }

  static Future<List<String>> getWhitelist() async {
    return await IminWhitelistPlatform.instance.getWhitelist();
  }
}
