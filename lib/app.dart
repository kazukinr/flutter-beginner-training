import 'package:flutter/material.dart';

import 'home/home_page.dart';

/// アプリケーションのルートWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Beginner Training',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const HomePage(),
            );
          default:
            return null;
        }
      },
    );
  }
}
