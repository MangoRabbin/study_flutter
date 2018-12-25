import 'package:flutter/material.dart';

import './Animations/loader.dart'; 

void main () => runApp(
  new MaterialApp(
    home: new Home(),
    )
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  => new Scaffold(
    backgroundColor: Colors.blueAccent,
    body: new Center(
      child: new Loader()
    ),
  );
}