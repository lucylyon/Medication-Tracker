import 'package:flutter/material.dart';
import 'Medication.dart';

class AddPage extends StatefulWidget {
  @override
  State createState() => new AddPageState();
}

class AddPageState extends State<AddPage> {

  String med, freq;
  int _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medication'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Enter New Medication:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24 )
          ),
          TextFormField(
            validator: (text) =>
            text.isEmpty
              ?"Enter medication"
              : null,
            onChanged: (text) {
              setState(() {
                med = text;
              });
            },
          ),
          Text("Select Frequency:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24 )),
          DropdownButton(
            value: _value,
            items: [
            DropdownMenuItem(
                child: Text("1"),
                value: 1,
            ),
            DropdownMenuItem(
              child: Text("2"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("3"),
              value: 3,
            ),
            DropdownMenuItem(
              child: Text("4"),
              value: 4,
            ),
            DropdownMenuItem(
              child: Text("6"),
              value: 6,
            )
          ], onChanged: (value){
              setState(() {
                _value = value;
              });
          }
          ),
          RaisedButton(
            padding: EdgeInsets.all(15),
            color: Colors.deepPurple,
            onPressed: () {
              addMed( createMed(med, _value));
            },
            child: Text("Add Medication",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            )
          )
        ],
      )
    );
  }
}

Medication createMed(String name, int frequency){
   // print(name);
   // print(frequency);
  return new Medication(name, frequency);
}

void addMed(Medication med){
  medications.add(med);
  // print(medications[0].name);
  // print(medications[0].frequency);
}
