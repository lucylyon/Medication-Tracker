import 'package:flutter/material.dart';
import 'package:project1/Medication.dart';

class TodayPage extends StatefulWidget {
  @override
  State createState() => new TodayPageState();
}

class TodayPageState extends State<TodayPage> {

  @override
  Widget build(BuildContext context) {
    
    List<Widget> medText = List();

    if (medications.length == 0){
      medText.add(Text('You are not taking any medications today',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36
          )));

    } else {
      medText.add(Text('Today you are taking:',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36
          )));
      for (int i = 0; i < medications.length; i ++) {
        String name = medications[i].name;
        int freq = medications[i].frequency;
        medText.add(Text('$name $freq time(s)',
            style: TextStyle(
                fontSize: 36
            )));
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Today\'s medication'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: medText,
        )
    );
  }
}