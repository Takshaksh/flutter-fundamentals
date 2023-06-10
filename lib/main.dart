import 'package:first_flutter/old/screens/post_screen.dart';
import 'package:first_flutter/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation/navigation_screen.dart';
import 'old/screens/default_screen.dart';

void main(){
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
      // home: const DefaultScreen(),
      // home: const PostScreen(),
    );
  }
}

