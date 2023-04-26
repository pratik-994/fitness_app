
import 'package:fitness_app/screens/bottomNavBar.dart';
import 'package:fitness_app/screens/login.dart';
import 'package:fitness_app/screens/register.dart';
import 'package:fitness_app/screens/totalFoods.dart';
import 'package:flutter/material.dart';
//11373513
void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/login': (context) => const LoginPageScreen(),
        '/register':(context) => const RegisterPageScreen(),
        '/foods':(context) => const Foods(),
      },
    ),
  );
}