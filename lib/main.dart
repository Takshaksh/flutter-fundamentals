import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter/firebase_options.dart';
import 'package:first_flutter/notify/firebase_notify_service.dart';
import 'package:first_flutter/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotifyService().initFirebaseNotification();
  final prefs = await SharedPreferences.getInstance();
  log("\n\nToken found: ${prefs.getString(Constants.fcmToken)}");

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: goRouterConfig,
      title: "Navigator Example",
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

