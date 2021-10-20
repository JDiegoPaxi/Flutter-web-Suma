import 'package:flutter/material.dart';
import 'package:web_suma/pages/sumapage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SumaPage(),
    );
  }
}

