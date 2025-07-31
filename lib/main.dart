import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Médica',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // No const aquí porque HomeScreen no es const
    );
  }
}
