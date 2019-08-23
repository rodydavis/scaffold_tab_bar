import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go To Screen 3'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Screen3()));
          },
        ),
      ),
    );
  }
}
