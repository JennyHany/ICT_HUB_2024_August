import 'package:flutter/material.dart';
import 'package:task3_new/home_screen.dart';

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      home:HomeScreen(),
    );
  }
}