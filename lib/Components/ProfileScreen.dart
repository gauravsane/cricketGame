import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       child: SafeArea(child: Text("ProfilePage")),
     ),
   );
  }

}