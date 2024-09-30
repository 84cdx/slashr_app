import 'package:flutter/material.dart';
import 'package:media_recommendation_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slashr',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      navigatorObservers: [routeObserver],
    );
  }
}
