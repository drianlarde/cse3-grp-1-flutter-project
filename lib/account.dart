import 'package:cse3_undergrad_studentside/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import './login.dart';

var parser = EmojiParser();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Account(),
    );
  }
}

class Account extends StatelessWidget {
  final String studentname = 'Juan Dela Cruz';
  final String studentnum = '2020-110299';
  final bool enrollstatus = false;
  final String course = '(BSCS) Bachelor of Science in Computer Science';
  final String college = 'College of Engineering';
  final String schoolyear = 'School Year 2023 - 2024 1st  Semester';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          child: Text('Account'),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none_outlined, color: Colors.black),
            onPressed: () {
              // Handle bell icon press
            },
          ),
        ],
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hi ',
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '$studentname',
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' ${parser.get('wave')?.code ?? ''}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.0),
              DefaultTextStyle(
                style: TextStyle(fontSize: 17.0, color: Colors.black),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info_outline, size: 18.0),
                    SizedBox(width: 12.0),
                    Text('$studentnum'),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                children: <Widget>[
                  Text('Enrollment Status: ', style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(width: 14.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: enrollstatus ? Colors.green : Colors.red),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      enrollstatus ? 'Enrolled' : 'Not Enrolled',
                      style: TextStyle(color: enrollstatus ? Colors.green : Colors.red, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              DefaultTextStyle(
                style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.work_outline, size: 18.0),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text('$course'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              DefaultTextStyle(
                style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.school_outlined, size: 20.0),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text('$college'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              DefaultTextStyle(
                style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_month_outlined, size: 20.0),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text('$schoolyear'),
                    ),
                  ],
                ),
              ),
              SizedBox(height:40.0),
              CustomButton(text: 'Change Password', icon: Icons.password, variant: ButtonVariant.secondary, onPressed: () {
                // Handle change password button press
              }),
              SizedBox(height: 5.0),
              CustomButton(text: 'Log Out', icon: Icons.logout, variant: ButtonVariant.outlined, onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomSheetApp()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}