import 'package:flutter/material.dart';
import 'package:agrebnevru_todo/pages/home.dart';
import 'package:agrebnevru_todo/pages/main_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'OpenSans',
      ),
      // home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/todo': (context) => const Home(),
      },
    ));
