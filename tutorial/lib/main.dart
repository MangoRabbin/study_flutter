import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

void main() => runApp(
  new MaterialApp(
    home: new HomePage(),
    )
);

class HomePage extends StatefulWidget {
  @override
  HomePageState createState () => new HomePageState ();
}

class HomePageState extends State<HomePage> {

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );
    // print(response.body);

    List data = json.decode(response.body);
    print(data[2]["title"]);
  }// Future??

  @override
  Widget build (BuildContext context)
  => new Scaffold(
    body: new Center(
      child: new RaisedButton(
        child: new Text("Get data"),
        onPressed: getData,
      )
    ),
  );
}