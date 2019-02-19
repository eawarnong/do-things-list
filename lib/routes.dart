import 'package:flutter/material.dart';
import 'components/screens/dashboard/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Dashbaord': (BuildContext context) => new Dashboard()
  };

  Routes () {
    runApp(new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: new Dashboard(),
    ));
  }
}