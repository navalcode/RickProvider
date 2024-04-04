import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

//TODO: add MaterialApp.router whit theme and dark theme to material app,
// add routerConfig
//when provider is ready remember to wrap the app with multiprovider and providers list
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Placeholder(),
    );
  }
}
