import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final name = "Name";
 

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();

    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Demo"),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name),
                    SizedBox(width: 20),
                    Expanded(child: TextField(controller: myController)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.child(name).set(myController.text);
                  },
                  child: Text("Submit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Map<String,dynamic> childrenPathValueMap = {};
                    childrenPathValueMap["${name}"] = myController.text;
                    FirebaseDatabase.instance.reference().update(childrenPathValueMap);
                  },
                  child: Text("Update"),

                ),

              ],
            ))
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

}