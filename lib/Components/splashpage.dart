import 'package:crickstar/Components/loginPage.dart';
import 'package:crickstar/Components/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("assets/finalBg.jpg", fit: BoxFit.cover),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset(
                          "assets/cricklogo.png",
                          width: screenWidth * 0.6,
                          // height: screenHeight * 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Image.asset(
                            "assets/Grip.png",
                            width: screenWidth * 0.7,
                            height: screenHeight * 0.6,
                          ),
                        ),
                        Transform.translate(offset: Offset(0, -10),child: ElevatedButton(
                          onPressed: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? token = prefs.getString('token');
                            print('Token is Present or Not $token');
                            if(token != ""){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            }
                            else{
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 15,
                            ), // 👈 Bigger size
                          ),
                          child: Text("Let's Play"),
                        ),),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: screenWidth * 0.7,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Your favourite games are waiting for you on this platform. Play with love. Win by playing.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}