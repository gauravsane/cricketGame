import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RankScreenState();
}

class RankScreenState extends State<RankScreen>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       child: SafeArea(child: Text("RankPage")),
     ),
   );
  }

}