import 'package:flutter/material.dart';
import 'package:invitaion/information.dart';
import 'package:invitaion/invitation_card.dart';

void main() {
  runApp(MyApp());
}

//stateless
//stateful
//they extends widget

//class MyApp

class MyApp extends StatelessWidget {

  //Constructor
  //build

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Information(),
    );
  }

}