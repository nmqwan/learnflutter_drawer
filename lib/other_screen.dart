import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnfluuter_menudrawer/zoom_scaffold.dart';

final Screen otherScreen = new Screen(
    title: "Other Screen",
    background: DecorationImage(
        image: new AssetImage('images/bg_1.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            new ColorFilter.mode(Color(0xCC000000), BlendMode.multiply)),
    contentBuilder: (BuildContext context) {
      return Center(
          child: Container(
              padding: EdgeInsets.all(25.0),
              width: double.infinity,
              height: 300.0,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/food_4.jpg',
                      height: 180.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                        child: Center(child: Text("This is another screen ! ")))
                  ],
                ),
              )));
    });
