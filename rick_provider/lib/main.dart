import 'package:flutter/material.dart';
import 'package:rick_provider/config/router/app_router.dart';
import 'package:rick_provider/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getLightTheme(),
        darkTheme: AppTheme().getDarkTheme(),
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      );
  }
}
