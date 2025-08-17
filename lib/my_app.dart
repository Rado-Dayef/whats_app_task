import 'package:flutter/material.dart';
import 'package:whats_app_task/core/constants/strings.dart';
import 'package:whats_app_task/core/routes/route_names.dart';
import 'package:whats_app_task/core/routes/router.dart';
import 'package:whats_app_task/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRouteNames.navBar,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
