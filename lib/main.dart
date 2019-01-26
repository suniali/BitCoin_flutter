import 'package:flutter/material.dart';
import 'package:flutter_bitcoine/data/dependency_injection.dart';
import 'package:flutter_bitcoine/home_page.dart';
import 'package:flutter/foundation.dart';

void main() async { 
  Injector.configure(Flaver.Prod);
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: defaultTargetPlatform==TargetPlatform.iOS ? Colors.grey[100] : null,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
