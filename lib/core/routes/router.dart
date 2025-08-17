import 'package:flutter/material.dart';
import 'package:whats_app_task/core/constants/extensions.dart';
import 'package:whats_app_task/presentation/screens/chat_screen.dart';
import 'package:whats_app_task/presentation/screens/nav_bar_screen.dart';
import 'package:whats_app_task/presentation/screens/not_found_screen.dart';
import 'package:whats_app_task/presentation/screens/story_screen.dart';

import 'route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.chat:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ChatScreen(),
          transitionsBuilder: (_, animation, ___, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
            return FadeTransition(opacity: curved, child: child);
          },
          transitionDuration: 500.milSec,
        );
      case AppRouteNames.story:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => StoryScreen(),
          transitionsBuilder: (_, animation, ___, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
            return FadeTransition(opacity: curved, child: child);
          },
          transitionDuration: 500.milSec,
        );
      case AppRouteNames.navBar:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => NavBarScreen(),
          transitionsBuilder: (_, animation, ___, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
            return FadeTransition(opacity: curved, child: child);
          },
          transitionDuration: 500.milSec,
        );
      default:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => NotFoundScreen(),
          transitionsBuilder: (_, animation, ___, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return FadeTransition(opacity: curved, child: child);
          },
          transitionDuration: 500.milSec,
        );
    }
  }
}
