package com.imin.whitelist.imin_whitelist_printer;

import android.provider.Settings;
import android.content.Context;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** IminWhitelistPrinterPlugin */
public class IminWhitelistPrinterPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "imin_whitelist_printer");
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "addWhitelist":
        String addPackage = call.argument("package");
        if (addPackage != null) {
          Settings.System.putString(context.getContentResolver(), "imin_system_add", addPackage);
          result.success("Added: " + addPackage);
        } else {
          result.error("INVALID_ARGUMENT", "Package name is required", null);
        }
        break;

      case "removeWhitelist":
        String removePackage = call.argument("package");
        if (removePackage != null) {
          Settings.System.putString(context.getContentResolver(), "imin_system_remove", removePackage);
          result.success("Removed: " + removePackage);
        } else {
          result.error("INVALID_ARGUMENT", "Package name is required", null);
        }
        break;

      case "clearWhitelist":
        Settings.System.putString(context.getContentResolver(), "imin_system_clear", "clear");
        result.success("Whitelist cleared");
        break;

      case "getWhitelist":
        String whitelist = Settings.System.getString(context.getContentResolver(), "imin_system_whitelist");
        if (whitelist != null) {
          result.success(whitelist);
        } else {
          result.success("[]"); // Kembalikan string kosong jika tidak ada whitelist
        }
        break;

      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
