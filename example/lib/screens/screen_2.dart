import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go To Screen 2'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Screen2()));
          },
        ),
      ),
    );
  }
}
