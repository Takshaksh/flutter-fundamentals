
import 'package:first_flutter/navigation/nav_screen_2.dart';
import 'package:first_flutter/navigation/navigation_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavigationScreen(),
      routes: [
        GoRoute(
          path: 'profile',
          builder: (context, state) => const NavSecondScreen()
        ),
      ]
    ),
  ]
);