import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import '../dashboard.dart';
import '../grade.dart';
import '../info.dart';
import '../enrollment.dart';
import '../account.dart';

var parser = EmojiParser();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Dashboard(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int navIndex = 0;
  List<Widget> pages = [
    Dashboard(),
    StudentEnrollment(),
    Grades(),
    StudentInfo(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[navIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        currentIndex: navIndex,
        type: BottomNavigationBarType.fixed,
        // Remove scaling when item is selected
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: true,
        iconSize: 30,
        elevation: 50,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Enrollment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Grades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],

      ),
    );
  }
}
