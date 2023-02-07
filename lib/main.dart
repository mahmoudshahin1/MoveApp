import 'package:flutter/material.dart';
import 'package:moveapp/core/service/services_locator.dart';

import 'package:moveapp/move/presention/screens/movies_screen.dart';

void main() {

 ServicesLocator().init();
  
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}