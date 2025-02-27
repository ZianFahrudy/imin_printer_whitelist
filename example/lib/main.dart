import 'package:flutter/material.dart';

import 'package:imin_whitelist_printer/imin_whitelist_printer.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Future<void> requestWriteSettingsPermission() async {
  //   if (!(await Permission.systemAlertWindow.isGranted)) {
  //     // WhitelistManager.addWhitelist('com.test.id');
  //     log('belum dizinkan');

  //     await openAppSettings();
  //   } else {
  //     log('udah dizinkan');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // requestWriteSettingsPermission().then((v) {});
    IminWhitelistManager.addWhitelist('com.test.id');
    // initPlatformState();
  }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await _iminWhitelistPrinterPlugin.getPlatformVersion() ??
  //             'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: IminWhitelistManager.getWhitelist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: List.generate(snapshot.data!.length,
                          (i) => Text(snapshot.data![i])),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data?.packageName ?? '-');
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
