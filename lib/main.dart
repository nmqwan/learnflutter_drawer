import 'package:flutter/material.dart';
import 'package:learnfluuter_menudrawer/menu_screen.dart';
import 'package:learnfluuter_menudrawer/other_screen.dart';
import 'package:learnfluuter_menudrawer/restaurant_screen.dart';
import 'package:learnfluuter_menudrawer/zoom_scaffold.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}
/**
 * 1:22:00
 */
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(contentScreen: activeScreen,menuScreen: MenuScreen(),);
  }
}
