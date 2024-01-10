import 'package:cse3_undergrad_studentside/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import '../account.dart';
import '../grade.dart';
import '../info.dart';
import '../enrollment.dart';
import '../account.dart';
import 'package:url_launcher/url_launcher.dart';


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
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      title: 'Flutter Demo',
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String studentname = 'Juan Dela Cruz';
  final String studentnum = '2020-110299';
  final bool enrollstatus = false;
  final String course = '(BSCS) Bachelor of Science in Computer Science';
  final String college = 'College of Engineering';
  final String schoolyear = 'School Year 2023 - 2024 1st  Semester';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultTextStyle(
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          child: Text('Dashboard'),
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
      body: SingleChildScrollView(
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
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '$studentname',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                  Text('Enrollment Status: ',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(width: 14.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: enrollstatus ? Colors.green : Colors.red),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      enrollstatus ? 'Enrolled' : 'Not Enrolled',
                      style: TextStyle(
                          color: enrollstatus ? Colors.green : Colors.red,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              DefaultTextStyle(
                style:
                    TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
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
                style:
                    TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
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
                style:
                    TextStyle(fontSize: 17.0, height: 1.5, color: Colors.black),
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
              SizedBox(height: 40.0),

              CustomButton(
                  icon: Icons.print_outlined,
                  text: 'Print SER',
                  color: Color.fromRGBO(251, 191, 36, 1),
                  iconColor: Colors.black,
                  onPressed: () async {
                    final url = Uri.parse(
                      'https://dfqsulnliamqedbuabjx.supabase.co/storage/v1/object/public/cse3-student-side/reg-form.pdf',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    } else {
                      // ignore: avoid_print
                      print("Can't launch $url");
                    }
                  }
              ),
              SizedBox(height: 5.0),
              CustomButton(
                  icon: Icons.open_in_new,
                  text: 'Open Teams',
                  textColor: Colors.white,
                  color: Color.fromRGBO(84, 88, 174, 1),
                  iconColor: Colors.white,
                  onPressed: () async {
                    final url = Uri.parse(
                      'https://teams.microsoft.com/',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    } else {
                      // ignore: avoid_print
                      print("Can't launch $url");
                    }
                  }
              ),

              SizedBox(height: 40.0),
              enrollstatus
                  ? Container()
                  : DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 15.0,
                          height: 1.5,
                          color: Color.fromRGBO(161, 98, 7, 1)),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 252, 232, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(250, 204, 21, 1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.warning_amber_outlined,
                                size: 22.0,
                                color: Color.fromRGBO(161, 98, 7, 1)),
                            SizedBox(width: 12.0),
                            Flexible(
                              child: Text(
                                  'You are not yet officially enrolled for this current term.'),
                            ),
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: 30.0),
              DashboardTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardTable extends StatefulWidget {
  List<List<String>> classes = [
    [
      'GEIT 839-1',
      'Strategic Management of Technology',
      'Monday 8:00 am',
      'Room105'
    ],
    ['GEIT 840-1', 'CS Elective 2', 'Tuesday 8:00 am', 'Room 106'],
    ['GEIT 841-1', 'CS Elective 3', 'Friday 8:00 am', 'Room 107'],
    ['GEIT 842-1', 'Mobile Development', 'Tuesday 8:00 am', 'Room 211'],
    // Add more classes here...
  ];

  @override
  _DashboardTableState createState() => _DashboardTableState();
}

class _DashboardTableState extends State<DashboardTable> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = widget.classes
        .map((classInfo) => DataRow(cells: [
              DataCell(Text(classInfo[0],
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(classInfo[1],
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(classInfo[2],
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(classInfo[3],
                  style: TextStyle(fontWeight: FontWeight.bold))),
            ]))
        .toList();

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Classes',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        SizedBox(height: 30.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(10)), // Rounded corners
              border: Border.all(
                color: Color.fromRGBO(229, 231, 235, 1),
                width: 1,
              ),
            ),
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Class/Section',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAscending = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = true;
                      }
                      widget.classes.sort((a, b) =>
                          a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Class Title',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAscending = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = true;
                      }
                      widget.classes.sort((a, b) =>
                          a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Schedule',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAscending = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = true;
                      }
                      widget.classes.sort((a, b) =>
                          a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Room',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAscending = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = true;
                      }
                      widget.classes.sort((a, b) =>
                          a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
              ],
              rows: rows,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
            ),
          ),
        )
      ],
    );
  }
}
