import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                            if (!isInputFocused) ...[
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Image.asset(
                                  "assets/Grip.png",
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.3,
                                ),
                              ),
                            ],
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                width: screenWidth * 0.85,
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.purple.withOpacity(0.1), // background color with opacity
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white, // border color
                                    width: 2,
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
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        hintText: "User Name",
                                        hintStyle: TextStyle(color: Colors.white54),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    TextField(
                                      controller: password,
                                      focusNode: passFocusNode,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.white54),
                                      ),
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 25),
                                    ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.deepPurple,
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
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
                            )

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
