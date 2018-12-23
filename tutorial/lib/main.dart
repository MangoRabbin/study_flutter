import 'package:flutter/material.dart';

void main() {
  runApp( new MaterialApp(
    home : MyTextInput()
  ));
}

class MyTextInput extends StatefulWidget{
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {

  final TextEditingController controller = new TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Input Text"),
        backgroundColor: Colors.deepOrange
        ,),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Type in Here",
                  ),
                  onSubmitted: (String str) {
                    setState(() {
                      result = result + '\n' + str;
                      
                    });
                    controller.text = ""; // onSubmit -> sentence = hintText
                  },
                  controller: controller, // controller is needed !!
                ),
                new Text(result,)
              ],
            ),
          )
        ),
    );
  }
}