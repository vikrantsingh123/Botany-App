import 'package:flutter/material.dart';
import './screens/home-view/homeView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botany',
      home: HomeView(),
    );
  }
}
