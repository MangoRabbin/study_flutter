import "dart:io";
import "dart:convert";
import "package:path_provider/path_provider.dart";



import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home()
    ,));
}

class Home extends StatefulWidget{
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  String fileName = "myJSONFile.json";
  Directory dir;
  bool fileExists = false;
  Map<String, dynamic> fileContent;


  @override
  void initState(){
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      // fileExists = jsonFile.exists();// async... almost app us this
      fileExists =jsonFile.existsSync(); // this example
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }


  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print ("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, String> content = { key : value };
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
    else{
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  @override
  Widget build(BuildContext context) 
  => new Scaffold(
    appBar: new AppBar(title: new Text("JSON Tutorial"),backgroundColor: Colors.deepPurpleAccent,),
    backgroundColor: Colors.white,
    body: new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.only(top: 30.0),),
        new Text("File context: ", style: new TextStyle(fontWeight:  FontWeight.bold)),
        new Text(fileContent.toString()),
        new Padding(padding: new EdgeInsets.only(top: 30.0),),
        new Text("Add to .JSONfile"),
        new TextField(
          controller: keyInputController,
        ),
        new TextField(
          controller: valueInputController,
        ),
        new RaisedButton(
          child: new Text("Add key, Value pair"),
          onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
        )
      ],
    )
  );
}