import 'package:flutter/material.dart';

class ScaffoldTabBar extends StatefulWidget {
  const ScaffoldTabBar({
    Key key,
    this.routes = const {},
    this.children,
    this.tabPopsToFirst = true,
    this.scaffoldKey,
    this.drawer,
    this.endDrawer,
    this.persistentFooterButtons,
    this.backgroundColor,
    this.bottomNavigationBarBackgroundColor,
    this.bottomNavigationBarType = BottomNavigationBarType.fixed,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  final Color backgroundColor, bottomNavigationBarBackgroundColor;
  final BottomNavigationBarType bottomNavigationBarType;
  final List<ScreenTab> children;
  final Widget drawer, endDrawer;
  final List<Widget> persistentFooterButtons;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final FloatingActionButton floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Map<String, WidgetBuilder> routes;

  /// If tab is currently selected, tapping again will pop to first page
  final bool tabPopsToFirst;

  @override
  _ScaffoldTabBarState createState() => _ScaffoldTabBarState();
}

class _ScaffoldTabBarState extends State<ScaffoldTabBar> {
  int _currentIndex = 0;
  final List<GlobalKey<NavigatorState>> _keys = [];
  List<ScreenTab> _screens = [];

  @override
  void didUpdateWidget(ScaffoldTabBar oldWidget) {
    if (oldWidget.children != widget.children) {
      if (mounted) {
        setState(() => _setUp());
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _setUp();
    super.initState();
  }

  void _setUp() {
    _screens = widget.children;
    _currentIndex = 0;
    for (var screen in _screens) {
      _keys.add(GlobalKey<NavigatorState>(debugLabel: screen?.debugLabel));
    }
  }

  void _onTap(int val, BuildContext context) {
    if (widget.tabPopsToFirst && _currentIndex == val) {
      _keys[val].currentState.popUntil((route) => route.isFirst);
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    for (int i = 0; i < _screens.length; i++) {
      _children.add(Navigator(
        key: _keys[i],
        onGenerateRoute: (settings) {
          if (widget.routes.containsKey(settings.name)) {
            return MaterialPageRoute(
              settings: settings,
              builder: widget.routes[settings.name],
            );
          }
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => _screens[i].screen,
          );
        },
      ));
    }
    return Scaffold(
      backgroundColor: widget?.backgroundColor,
      key: widget?.scaffoldKey,
      drawer: widget?.drawer,
      endDrawer: widget?.endDrawer,
      persistentFooterButtons: widget?.persistentFooterButtons,
      floatingActionButton: widget?.floatingActionButton,
      floatingActionButtonAnimator: widget?.floatingActionButtonAnimator,
      floatingActionButtonLocation: widget?.floatingActionButtonLocation,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: widget?.bottomNavigationBarType,
        currentIndex: _currentIndex,
        onTap: (val) => _onTap(val, context),
        backgroundColor: widget?.bottomNavigationBarBackgroundColor ??
            Theme.of(context).scaffoldBackgroundColor,
        items: _screens.map((s) => s.tab).toList(),
      ),
    );
  }
}

class ScreenTab {
  const ScreenTab({
    @required this.tab,
    @required this.screen,
    this.debugLabel,
  });

  final String debugLabel;
  final Widget screen;
  final BottomNavigationBarItem tab;
}
