import 'package:crickstar/Components/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginScreen> {
  final FocusNode userFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();


  var userName = TextEditingController();
  var password = TextEditingController();

  bool isInputFocused = false;
  void initState() {
    super.initState();

    // Add listeners to focus nodes
    userFocusNode.addListener(_handleFocusChange);
    passFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isInputFocused = userFocusNode.hasFocus || passFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passFocusNode.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void handleLogin() async {
      final username = userName.text.trim();
      final pass = password.text.trim();

      final url = Uri.parse("http://192.168.1.11:7700/api/loginUser");

      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "UName": username,
            "PASSWORD": pass,
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          if (data['success'] == true) {
            // ✅ Save data to SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', data['token']);
            await prefs.setString('userName', data['userName']);
            await prefs.setString('userType', data['userType']);
            await prefs.setString('userId', data['ObjuserId']);
            await prefs.setString('businessUnit', data['BusinessUnit']);
            await prefs.setString('role', data['Role']);
            await prefs.setString('name', data['Name']);
            await prefs.setString('style', data['Style']);
            await prefs.setString('hq', data['HQ']);
            await prefs.setString('region', data['Region']);
            await prefs.setString('zone', data['Zone']);

            // ✅ Show SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Successful! Welcome ${data['Name']}"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
              ),
            );

            // ✅ Navigate after a short delay
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(), // Your destination page
                ),
              );
            });
          } else {
            // ❌ Login failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(data['message'] ?? "Login failed"),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Server error: ${response.statusCode}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }




    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/finalBg.jpg", fit: BoxFit.cover),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            Image.asset(
                              "assets/cricklogo.png",
                              width: screenWidth * 0.6,
                            ),
                            // if (!isInputFocused) ...[
                            //   Padding(
                            //     padding: const EdgeInsets.only(left: 30,top: 5),
                            //     child: Image.asset(
                            //       "assets/Grip.png",
                            //       width: screenWidth * 0.3,
                            //       height: screenHeight * 0.3,
                            //     ),
                            //   ),
                            // ],
                            Padding(
                              padding: const EdgeInsets.only(left: 30,top: 5),
                              child: Image.asset(
                                "assets/Grip.png",
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                width: screenWidth * 0.85,
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.purple.withOpacity(
                                    0.01,
                                  ), // background color with opacity
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    top: BorderSide(
                                      width: 0.2,
                                      color: Colors.white,
                                    ),
                                    bottom: BorderSide(
                                      width: 0.2,
                                      color: Colors.white,
                                    ),
                                    left: BorderSide(
                                      width: 0.2,
                                      color: Colors.white,
                                    ),
                                    right: BorderSide(
                                      width: 0.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    TextField(
                                      controller: userName,
                                      focusNode: userFocusNode,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        hintText: "User ID",
                                        hintStyle: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    TextField(
                                      controller: password,
                                      focusNode: passFocusNode,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 25),
                                    ElevatedButton(
                                      onPressed: () {handleLogin();},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.deepPurple,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.25,
                                          vertical: 15,
                                        ),
                                      ),
                                      child: Text("Login"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
