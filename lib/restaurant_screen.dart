import 'package:flutter/material.dart';
import 'package:learnfluuter_menudrawer/zoom_scaffold.dart';

final Screen restaurantScreen = new Screen(
    title: "Restaurent",
    background: DecorationImage(
        image: new AssetImage('images/bg.jpg'), fit: BoxFit.cover),
    contentBuilder: (BuildContext context) {
      return ListView(
        children: <Widget>[
          new _RestaurentCard(
              title: 'Tôm rang chua ngọt',
              headImageAssetsPath: 'images/food_1.jpg',
              heartCount: 52,
              icon: Icons.ac_unit,
              iconBackgroundColor: Colors.lightBlueAccent,
              subTitle: 'Số 9, Hoa Cau, Phú Nhuận, Tp HCM'),
          new _RestaurentCard(
              title: 'Tôm rang chua ngọt',
              headImageAssetsPath: 'images/food_2.jpg',
              heartCount: 52,
              icon: Icons.ac_unit,
              iconBackgroundColor: Colors.amberAccent,
              subTitle: 'Số 9, Hoa Cau, Phú Nhuận, Tp HCM'),
          new _RestaurentCard(
              title: 'Tôm rang chua ngọt',
              headImageAssetsPath: 'images/food_3.jpg',
              heartCount: 52,
              icon: Icons.ac_unit,
              iconBackgroundColor: Colors.lightGreen,
              subTitle: 'Số 9, Hoa Cau, Phú Nhuận, Tp HCM'),
          new _RestaurentCard(
              title: 'Tôm rang chua ngọt',
              headImageAssetsPath: 'images/food_4.jpg',
              heartCount: 52,
              icon: Icons.ac_unit,
              iconBackgroundColor: Colors.orangeAccent,
              subTitle: 'Số 9, Hoa Cau, Phú Nhuận, Tp HCM'),
          new _RestaurentCard(
              title: 'Tôm rang chua ngọt',
              headImageAssetsPath: 'images/food_1.jpg',
              heartCount: 52,
              icon: Icons.ac_unit,
              iconBackgroundColor: Colors.yellow,
              subTitle: 'Số 9, Hoa Cau, Phú Nhuận, Tp HCM'),
        ],
      );
    });

class _RestaurentCard extends StatelessWidget {
  final String headImageAssetsPath, title, subTitle;
  final IconData icon;
  final int heartCount;
  final Color iconBackgroundColor;

  _RestaurentCard(
      {this.headImageAssetsPath,
        this.title,
        this.subTitle,
        this.icon,
        this.heartCount,
        this.iconBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset(
              headImageAssetsPath,
              width: double.infinity,
              height: 160.0,
              fit: BoxFit.cover,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        color: iconBackgroundColor,
                        borderRadius:
                        new BorderRadius.all(Radius.circular(15.0))),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontFamily: "mermaid", fontSize: 22.0),
                      ),
                      Text(subTitle,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: "bebas-neue",
                              fontSize: 16.0,
                              letterSpacing: 1.0,
                              color: Color(0xFFAAAAAA)))
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.white,
                      Color(0xFFAAAAAA),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: Colors.red),
                      Text('$heartCount')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
