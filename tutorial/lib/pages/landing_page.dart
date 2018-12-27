import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  => new Material(
    color:  Colors.greenAccent,
    child: new InkWell(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Lets Quizzz", style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
          new Padding(padding: EdgeInsets.only(bottom: 30.0),),
          new Text("Tap to Start !", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
        ],
      )
    ),
  );
}