import 'package:flutter/material.dart';

import 'package:scaffold_tab_bar/scaffold_tab_bar.dart';
import 'package:scaffold_tab_bar_example/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldTabBar(
        routes: {
          '/test': (_) => TestScreen(),
        },
        children: [
          ScreenTab(
            screen: Screen1(),
            tab: BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
          ),
          ScreenTab(
            screen: Screen2(),
            tab: BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Calendar'),
            ),
          ),
          ScreenTab(
            screen: Screen3(),
            tab: BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
