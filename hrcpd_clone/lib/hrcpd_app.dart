import 'package:flutter/material.dart';
import 'package:hrcpd_clone/screen/login_screen.dart';

import 'screen/home_screen.dart';

class HrcpdApp extends StatelessWidget {
  const HrcpdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRCPD',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: LoginScreen(),
    );
  }
}
