# scaffold_tab_bar

* Easy Navigation for Flutter
* Tabs can be created and changed dynamically
* Can be used in a [StatelessWidget]
* No need to specify current index
* Screen and Tab are created together
* Debug Labels
* Scaffold [Drawer], [EndDrawer] and other widgets can be added
* Tabs are inside of a [IndexdStack] so tabs are built once
* Optional navigation back to first screen when tab is double tapped

## Demo

You can try a demo [here](https://appleeducate.github.io/scaffold_tab_bar/).

## Example

```dart
import 'package:flutter/material.dart';

import 'package:scaffold_tab_bar/scaffold_tab_bar.dart';

import 'screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldTabBar(
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

```