
import 'package:first_flutter/navigation/nav_screen_2.dart';
import 'package:first_flutter/storage/storage_screen.dart';
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
      builder: (context, state) => const StorageScreen(),
      routes: [
        GoRoute(
          path: 'profile',
          builder: (context, state) => const NavSecondScreen()
        ),
      ]
    ),
  ]
);