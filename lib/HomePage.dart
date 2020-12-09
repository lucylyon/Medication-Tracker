import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int value = 0;
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                padding: EdgeInsets.all(30),
                color: Colors.deepPurple,
                onPressed: () {
                  Navigator.of(context).pushNamed("/add");
                },
                child: Text("Add Medication",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                )
            ),
            RaisedButton(
                padding: EdgeInsets.all(30),
                color: Colors.deepPurple,
                onPressed: () {
                  Navigator.of(context).pushNamed("/edit");
                },
                child: Text("Edit Medication",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                )
            ),
            RaisedButton(
                padding: EdgeInsets.all(30),
                color: Colors.deepPurple,
                onPressed: () {
                  Navigator.of(context).pushNamed("/today");
                },
                child: Text("See Today's Medication",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                )
            )
          ],
        ),
      ),
    );
  }
}