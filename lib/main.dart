import 'package:flutter/material.dart';
import 'package:ticket_try/view/main/view/main_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MainView(),
    );
  }
}
