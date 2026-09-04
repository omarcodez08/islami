import 'package:flutter/material.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner:false,
      routes: {
     RoutesManager.homeRouteName:(context) =>HomeScreen()

      },
    initialRoute: RoutesManager.homeRouteName,
    );
  }
}

