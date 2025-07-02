import 'package:crickstar/Components/ProfileScreen.dart';
import 'package:crickstar/Components/RankScreen.dart';
import 'package:crickstar/Components/createQuestions.dart';
import 'package:crickstar/Components/loginPage.dart';
import 'package:crickstar/Components/splashpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<HomePage>with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  void _onTabTapped(int index) async{
    if (index == 3) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // ✅ Show Custom SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Logout Success"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          )
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(index); // 👈 switch manually
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Ranking"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          ProfileScreen(),
          CreateQuestions(),
          RankScreen(),
        ],
      ),
    );
  }
  
}