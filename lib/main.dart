import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_1/view/home_page.dart';
import 'package:flutter_ui_desing_1/view/message_page.dart';
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(
    MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  var pageList = [HomePage(), MessagePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pageList[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: buildBottomNavBar(),
      ),
    );
  }

  SafeArea buildBottomNavBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 4),
        child: buildGNav(),
      ),
    );
  }

  GNav buildGNav() {
    return GNav(
        rippleColor: Colors.blueGrey,
        hoverColor: Colors.grey[100]!,
        gap: 20,
        activeColor: Color(0xFF363f93),
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.black,
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.search,
            text: 'Search',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      );
  }
}
