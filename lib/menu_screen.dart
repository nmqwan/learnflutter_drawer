import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage("images/bg_2.jpg"), fit: BoxFit.cover)),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[createMenuTitle(), createMenuItem()],
        ),
      ),
    );
  }

  createMenuTitle() {
    return Transform(
      transform: Matrix4.translationValues(-100.0, 0.0, 0.0),
      child: OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: Text(
          "Menu",
          style: TextStyle(
              fontSize: 240.0, fontFamily: 'mermaid', color: Color(0xA1ed5421)),
          textAlign: TextAlign.left,
          softWrap: false,
        ),
      ),
    );
  }

  createMenuItem() {
    return Transform(
      transform: Matrix4.translationValues(0.0, 255.0, 0.0),
      child: Column(
        children: <Widget>[
          _MenuListItem(
            title: "Social",
            isSelected: true,
          ),
          _MenuListItem(
            title: "Ecommerce",
            isSelected: false,
          ),
          _MenuListItem(
            title: "Inventory",
            isSelected: false,
          ),
          _MenuListItem(
            title: "Settings",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  String title;
  bool isSelected;

  _MenuListItem({this.title, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: isSelected ? null : () {},
      splashColor: Color(0x44000000),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "bebas-neue",
                letterSpacing: 2.0,
                color: isSelected ? Colors.red : Colors.white),
          ),
        ),
      ),
    );
  }
}
