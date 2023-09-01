import 'package:flutter/material.dart';
// import 'package:zinjanow_app/ui/pages/home.dart';
import 'package:zinjanow_app/ui/pages/welcome.dart';
// import 'package:zinjanow_app/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zinjanow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}