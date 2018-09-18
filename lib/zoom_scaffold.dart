import 'package:flutter/material.dart';
import 'package:learnfluuter_menudrawer/menu_screen.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold> {
  createContentDisplay() {
    return zoomAndSlideContent(
      Container(
        decoration: BoxDecoration(image: widget.contentScreen.background),
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                widget.contentScreen.title,
                style: new TextStyle(fontFamily: "bebas-neue", fontSize: 25.0),
              ),
              leading: IconButton(icon: new Icon(Icons.menu), onPressed: () {}),
            ),
            body: widget.contentScreen.contentBuilder(context)),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    return Transform(
      transform: Matrix4.translationValues(275.0, 0.0, 0.0)
        ..scale(0.8, 0.8),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x44af893b),
              blurRadius: 10.0,
              offset:Offset(0.0, 0.5),
              spreadRadius: 10.0
            )
          ]
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.menuScreen,
      createContentDisplay(),
    ]);
  }
}

class Screen {
  final String title;
  final DecorationImage background;
  final WidgetBuilder contentBuilder;

  Screen({this.title, this.background, this.contentBuilder});
}
