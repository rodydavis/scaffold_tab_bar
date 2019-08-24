import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go To Screen 1'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Screen1()));
            // Navigator.pushNamed(context, '/test');
          },
        ),
      ),
    );
  }
}
