import 'package:flutter/material.dart';

void main() => runApp(
 new MaterialApp(
   home: MyStatelessWidget()
 )
);

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => new Scaffold(
        appBar: new AppBar(
          title: new Text("Stateless Widget"),),
           body: new Container(
             padding: new EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new MyCard(
                  title: new Text("I love Flutter", style: TextStyle(
                    fontSize: 25.0,
                  ),),
                  icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
                ),
                new MyCard(
                  title: new Text("Hello dude", style: TextStyle(
                    fontSize: 25.0,
                  ),),
                  icon: new Icon(Icons.favorite_border, size: 40.0, color: Colors.teal)
                ),
                new MyCard(
                  title: new Text("I love you", style: TextStyle(
                    fontSize: 25.0,
                  ),),
                  icon: new Icon(Icons.favorite, size: 40.0, color: Colors.yellow)
                )
              ]
            ),)
    );
  
}

class MyCard extends StatelessWidget {
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context)
  => new Container(
    padding: new EdgeInsets.only(bottom: 20.0),
    child: new Card(
      child: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
              this.title,
              this.icon
            ],
          ) ,
        )
      ),
    );
}