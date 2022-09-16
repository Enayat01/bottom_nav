import 'package:bottom_nav/screens/cars_screen.dart';
import 'package:bottom_nav/screens/history_screen.dart';
import 'package:bottom_nav/screens/home_screen.dart';
import 'package:bottom_nav/screens/location_screen.dart';
import 'package:flutter/material.dart';
import './screens/tab_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(29, 25, 52, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(29, 25, 52, 1),
        ).copyWith(
          secondary: const Color.fromRGBO(230, 11, 80, 1),
        ),
      ),
      home: const TabBarScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LocationScreen.routeName: (context) => const LocationScreen(),
        CarsScreen.routeName: (context) => const CarsScreen(),
        HistoryScreen.routeName: (context) => HistoryScreen(),
      },
    );
  }
}
