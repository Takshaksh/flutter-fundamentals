
import 'package:first_flutter/firewire/firebase_screen.dart';
import 'package:first_flutter/navigation/nav_screen_2.dart';
import 'package:go_router/go_router.dart';

const root = "/";
const notification = "/notify";
const profile = "/profile";
const test = "/test";

GoRouter goRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const NavigationScreen(),
      // builder: (context, state) => const StorageScreen(),
      // builder: (context, state) => const DBScreen(),
      // builder: (context, state) => const ExplorerScreen(),
      // builder: (context, state) => const MediaPlayerScreen(),
      builder: (context, state) => const FirewireScreen(),
      routes: [
        GoRoute(
          path: 'profile',
          builder: (context, state) => const NavSecondScreen()
        ),
      ]
    ),
  ]
);