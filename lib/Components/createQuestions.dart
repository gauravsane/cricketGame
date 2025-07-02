import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateQuestions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateQuestionsState();
}

class CreateQuestionsState extends State<CreateQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            color: Color(0xFF1C2E6E),
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Container(
                  // color: Color(0xFF4A399F),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Create New Question",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            // make sure it fits horizontally
                            child: SizedBox(
                              height: 120, // or any height you want
                              child: GridView.count(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                // physics: NeverScrollableScrollPhysics(), // optional
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A399F),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.edit,color: Colors.orange,size: 40,),
                                        SizedBox(child: Text("CREATE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A399F),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.auto_awesome,color: Colors.orange,size: 40,),
                                        SizedBox(child: Text("AI GENERATE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4A399F),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.collections,color: Colors.orange,size: 40,),
                                        SizedBox(child: Text("CHOOSE FROM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
