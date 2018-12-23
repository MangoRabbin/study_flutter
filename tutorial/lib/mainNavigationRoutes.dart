import 'package:flutter/material.dart';

void main (){
  runApp(
    new MaterialApp(
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        // "/home": (BuildContext context ) => new HomePage(),
        "/SecondPage":(BuildContext context) => new SecondPage(),
      }
    )
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.favorite, color: Colors.deepPurple),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed('/SecondPage');},
              ),
              new Text("Home")
            ],
          ),)
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SecondPage"),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.purple),
                iconSize: 70.0,
                onPressed: null,
              ),
              new Text("Second Page")
            ],
          ),)
      )
    );
  }
}