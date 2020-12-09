import 'package:flutter/material.dart';
import 'Medication.dart';

class EditPage extends StatefulWidget {
  @override
  State createState() => new EditPageState();
}

class EditPageState extends State<EditPage> {

  int screen = 0;
  int value; //index of medication user wants to edit
  String title; //for alert dialog
  String text; //for alert

  @override
  Widget build(BuildContext context) {
    if (screen == 0)
      return buildMeds(context);
    else if (screen == 1)
      return buildNameFrequency(context);
    else if (screen == 2)
      return buildEditName(context);
    else if (screen ==3)
      return buildEditFreq(context);
  }


  Widget buildMeds(BuildContext context) {
    List<Widget> medText = List();
    if (medications.length == 0) {
      medText.add(Text('You are not taking any medications today',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36
          )));
    } else {
      medText.add(Text('Which medication would you like to edit?:',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36
          )));
      for (int i = 0; i < medications.length; i ++) {
        String name = medications[i].name;
        int freq = medications[i].frequency;

        medText.add(RaisedButton(
            padding: EdgeInsets.all(10),
            color: Colors.deepPurple,
            onPressed: () {
              setState(() {
                screen = 1;
                value = i;
              });
            },
            child: Text('$name, $freq',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),
            )
        ));
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Medication'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: medText,
        )
    );
  }


  Widget buildNameFrequency(BuildContext context) {
    String name = medications[value].name;
    int freq = medications[value].frequency;

    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit Medication')),
        body: Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.deepPurple,
                    onPressed: () {
                      setState(() {
                        screen = 2;
                      });
                    },
                    child: Text('Edit Name ($name)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),)
                ),
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.deepPurple,
                    onPressed: () {
                      setState(() {
                        screen = 3;
                      });
                    },
                    child: Text('Edit Frequency ($freq)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),)
                ),
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.deepPurple,
                    onPressed: () {
                        medications.removeAt(0);
                        title = 'Delete medication';
                        text = 'This medication has been deleted';
                        Navigator.of(context).pushNamed("/");
                        _showMyDialog();
                    },
                    child: Text('Delete this medication',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),)
                ),
              ],
            )
        )
    );
  }

  Widget buildEditName(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit Name')
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Enter new name:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24)),
            TextFormField(
              validator: (text) =>
              text.isEmpty
                  ? "Enter medication"
                  : null,
              onChanged: (text) {
                setState(() {
                  medications[value].name = text;
                  print(medications[value].name);
                });
              },
            ),
          ],
        )
    );
  }

  Widget buildEditFreq(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit Name')
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Enter new frequency:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24)),
            TextFormField(
              validator: (text) =>
              text.isEmpty
                  ? "Enter frequency"
                  : null,
              onChanged: (text) {
                setState(() {
                  medications[value].frequency = int.parse(text);
                  print(medications[value].frequency);
                });
              },
            ),
          ],
        )
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
