import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
     home: StudentInfo(),
   );
 }
}
class StudentInfo extends StatefulWidget {
 @override
 _StudentInfoState createState() => _StudentInfoState();
}
class _StudentInfoState extends State<StudentInfo> {
 final String studentname = 'Juan Dela Cruz';
 final String firstname = 'Juan';
 final String middlename = 'Felipe';
 final String lastname = 'Dela Cruz';
 final String pedigree = 'N/A';
 final String gender = 'Male';
 final String citizenship = 'Philippines';
 final String studtype = 'Old';
 final String regstatus = 'Regular';
 final String yearlevel = 'Old';
 final String plmemail = 'jfdelacruz2020@plm.edu.ph';
 final String studentnum = '2020-110299';
 final bool enrollstatus = false;
 final String course = '(BSCS) Bachelor of Science in Computer Science';
 final String college = 'College of Engineering';
 final String schoolyear = 'School Year 2023 - 2024 1st  Semester';
 bool editButtonClicked = false;

String civilstatus = 'Single';
final civilStatusController = TextEditingController();

String phonenum = '9221235678';
final phoneNumController = TextEditingController();

String personalemail = 'delacruzjuanf@gmail.com';
final personalEmailController = TextEditingController();

 @override
 Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: false,
    title: DefaultTextStyle(
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      child: Text('Information'),
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
    padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
           children: <Widget>[
       Text(
         'Student Profile',
         style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
       ),
        SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Student ID ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = studentnum,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
        SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'First Name ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = firstname,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
        SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Middle Name ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = middlename,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
        SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Last Name ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = lastname,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
        SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Pedigree ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = pedigree,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
          SizedBox(height: 20), 
          Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    'Gender ',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    'Civil Status ',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
          ),
          SizedBox(height: 10),
       Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              readOnly: true,
              controller: TextEditingController()..text = gender,
              style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                fillColor: Color.fromARGB(244,244,245,245),
                filled: true,
              ),
            ),
          ),
          SizedBox(width: 20), 
          Expanded(
            child: TextField(
              readOnly: !editButtonClicked,
              controller: civilStatusController..text = civilstatus,
              style: TextStyle(fontSize: 17.0, color: editButtonClicked ? Colors.black : Color.fromARGB(159, 103, 107, 111)),  
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                fillColor: Color.fromARGB(244,244,245,245),
                filled: true,
              ),
            ),
          ),
        ],
      ),
          SizedBox(height: 20), 
          Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    'Country of Citizenship',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
          ),
          SizedBox(height: 10),
       Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              readOnly: true,
              controller: TextEditingController()..text = citizenship,
              style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                fillColor: Color.fromARGB(244,244,245,245),
                filled: true,
              ),
            ),
          ),
          SizedBox(width: 20), 
          if (editButtonClicked == false)
            Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  editButtonClicked = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical:10, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.edit_outlined, color: Colors.black,),
                    SizedBox(width: 10),
                    Text('Edit Profile', style: TextStyle(color: Colors.black, fontSize: 16.0),),
                  ],
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(251, 191, 36, 1)), 
                elevation: MaterialStateProperty.all(0.0),
              ),
            ),
          ),
        ],
      ),
              SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Phone Number ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        IntlPhoneField(
        readOnly: !editButtonClicked,
        controller: phoneNumController..text = phonenum,
        style: TextStyle(fontSize: 17.0, color: editButtonClicked ? Colors.black : Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        initialCountryCode: 'PH',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        ),
                 SizedBox(height: 20), 
          Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    'Student Type ',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    'Registration Status ',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
          ),
          SizedBox(height: 10),
       Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              readOnly: true,
              controller: TextEditingController()..text = studtype,
              style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                fillColor: Color.fromARGB(244,244,245,245),
                filled: true,
              ),
            ),
          ),
          SizedBox(width: 20), 
          Expanded(
            child: TextField(
              readOnly: true,
              controller: TextEditingController()..text = regstatus,
              style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
                ),
                fillColor: Color.fromARGB(244,244,245,245),
                filled: true,
              ),
            ),
          ),
        ],
      ), 
              SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Official PLM Email ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: true,
        controller: TextEditingController()..text = plmemail,
        style: TextStyle(fontSize: 17.0, color: Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
                SizedBox(height: 20), 
        Row(
          children: <Widget>[
            Text(
              'Personal Email ',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            Text(
              '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
        readOnly: !editButtonClicked,
        controller: personalEmailController..text = personalemail,
        style: TextStyle(fontSize: 17.0, color: editButtonClicked ? Colors.black : Color.fromARGB(159, 103, 107, 111)), 
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 15.0, ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(227, 216, 219, 221), width: 1.0),
          ),
          fillColor: Color.fromARGB(244,244,245,245),
          filled: true,
        ),
        ),
        SizedBox(height: 20),
        if (editButtonClicked == true)
        Row(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  editButtonClicked = false;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 10,)), 
                elevation: MaterialStateProperty.all(0.0),
              ),
              child: Text('Cancel', style: TextStyle(fontSize: 16.0),), 
            ),
            SizedBox(width: 10), 
            ElevatedButton(
              onPressed: () {
                setState(() {
                  civilstatus = civilStatusController.text;
                  personalemail = personalEmailController.text;
                  phonenum = phoneNumController.text;
                  editButtonClicked = false;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 10,)), 
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(251, 191, 36, 1)),
                elevation: MaterialStateProperty.all(0.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.save_outlined, color: Colors.black,),
                  SizedBox(width: 10),
                  Text('Save Changes', style: TextStyle(color: Colors.black, fontSize: 16.0),),
                ],
              ),
            ),
          ],
        )
        else
        Container(),
        SizedBox(height: 40),
     ],
    ), 
  ),
 ),
 );
 }
}
