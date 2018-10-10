import 'package:flutter/material.dart';
import 'package:learnfluuter_menudrawer/menu_screen.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final Widget menuScreen;

  ZoomScaffold({this.contentScreen, this.menuScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold> with TickerProviderStateMixin{
  MenuController menuController;

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this
    )
      ..addListener(() => setState(() {}));
  }

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
              leading: IconButton(
                  icon: new Icon(Icons.menu),
                  onPressed: () {
                    menuController.toggle();
                  }),
            ),
            body: widget.contentScreen.contentBuilder(context)),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    final slideAmount = 275.0 * menuController.percentOpen;
    final contentScale = 1.0 - (0.2 * menuController.percentOpen);
    final cornerRadius = 10.0 * menuController.percentOpen;
    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0x44af893b),
              blurRadius: 10.0,
              offset: Offset(0.0, 0.5),
              spreadRadius: 10.0)
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(cornerRadius), child: content),
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

class ZoomScaffolMenuController extends StatelessWidget {
  final ZoomScaffolBuilder builder;

  ZoomScaffolMenuController({this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context, getMenuController(context));
  }

  MenuController getMenuController(BuildContext context) {
    final scaffolState =
    context.ancestorStateOfType(new TypeMatcher<_ZoomScaffoldState>())
    as _ZoomScaffoldState;
    return scaffolState.menuController;
  }
}

typedef Widget ZoomScaffolBuilder(BuildContext context,
    MenuController menuController);

class Screen {
  final String title;
  final DecorationImage background;
  final WidgetBuilder contentBuilder;

  Screen({this.title, this.background, this.contentBuilder});
}

class MenuController extends ChangeNotifier {
  MenuState state = MenuState.closed;

//  double percentOpen = 0.0;
  final TickerProvider vsync;
  final AnimationController _animationController;

  MenuController({this.vsync})
      : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
        }
        notifyListeners();
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen{
    print(_animationController.value);
    return _animationController.value;
  }
  open() {
//    state = MenuState.open;
//    percentOpen = 1.0;
//    notifyListeners();
  _animationController.forward();
  }

  close() {
//    state = MenuState.closed;
//    percentOpen = 0.0;
//    notifyListeners();
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState { closed, closing, open, opening }
