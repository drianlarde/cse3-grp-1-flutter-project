import 'package:cse3_undergrad_studentside/components/button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './enrollment_2.dart';
import './components/cancel-enrollment-button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enrollment Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: StudentEnrollment(),
    );
  }
}

class StudentEnrollment extends StatelessWidget {
  final _classes = [
    // Replace this with your actual class data
    // Example:
    {
      'code': 'CS101',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS102',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS103',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS104',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS105',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS106',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS107',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS108',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    },
    {
      'code': 'CS109',
      'title': 'Introduction to Programming',
      'schedule': 'MWF 9:00 AM - 10:00 AM',
      'totalSlots': 30,
      'remainingSlots': 15,
    }
    // ... more classes
  ];

  @override
  Widget build(BuildContext context) {
    // Convert your _classes data to a list of ClassInfo objects
    final classInfos = _classes.map<ClassInfo>((classData) {
      return ClassInfo(
        code: classData['code'] as String, // Cast to String
        title: classData['title'] as String, // Cast to String
        schedule: classData['schedule'] as String, // Cast to String
        totalSlots: classData['totalSlots'] as int, // Cast to int
        remainingSlots: classData['remainingSlots'] as int, // Cast to int
      );
    }).toList();

    // Create a data source from the list
    final dataSource = ClassesDataSource(classInfos);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultTextStyle(
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          child: Text('Enrollment'),
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Text("Current School Year / Term",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  Text("School Year 2023 - 2024 1st Trimester",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will provide equal spacing automatically
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.rectangle,
                      ),
                      margin: EdgeInsets.only(
                          right: 5), // Add margin to separate the bars
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        // Change color to disable/inactive color grey
                        color: Color.fromRGBO(24, 24, 27, 0.1),
                        shape: BoxShape.rectangle,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 5), // Add margin to separate the bars
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(24, 24, 27, 0.1),
                        shape: BoxShape.rectangle,
                      ),
                      margin: EdgeInsets.only(
                          left: 5), // Add margin to separate the bars
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                // Center the content horizontally
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Add a Circle with '1' inside
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First step",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("Enroll available classes",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              PaginatedDataTable(
                // 5 row per page
                rowsPerPage: 5,
                source: dataSource,
                columns: [
                  DataColumn(
                    label: Text(''),
                    onSort: (int columnIndex, bool ascending) {},
                  ),
                  DataColumn(label: Text('Code')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Schedule')),
                  DataColumn(label: Text('Total Slots')),
                  DataColumn(label: Text('Remaining Slots')),
                ],
              ),
              SizedBox(height: 30),

              // Button to proceed to step 2
              CustomButton(
                  text: 'Proceed to Step 2',
                  color: Color.fromRGBO(251, 191, 36, 1),
                  iconColor: Colors.black,
                  onPressed: () async {
                    // Handle apply now logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentEnrollment2()),
                    );
                  }),
              SizedBox(height: 5),
              // Button to cancel enrollment
              CancelEnrollmentButton(
                  text: 'Cancel Enrollment',
                  onPressed: () {
                    // Handle cancel enrollment logic
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassInfo {
  final String code;
  final String title;
  final String schedule;
  final int totalSlots;
  final int remainingSlots;
  bool isSelected; // Add this line

  ClassInfo({
    required this.code,
    required this.title,
    required this.schedule,
    required this.totalSlots,
    required this.remainingSlots,
    this.isSelected = false, // Add this line
  });
}

class ClassesDataSource extends DataTableSource {
  final List<ClassInfo> classes;

  ClassesDataSource(this.classes);

  void selectAll(bool checked) {
    classes.forEach((classInfo) => classInfo.isSelected = checked);
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= classes.length) {
      // Return an empty DataRow for indexes beyond your data range
      return DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text(''))
      ]);
    }

    final classInfo = classes[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Checkbox(
          value: classInfo.isSelected,
          onChanged: (value) {
            if (value != null) {
              classInfo.isSelected = value;
              notifyListeners();
            }
          },
        )),
        DataCell(Text(classInfo.code)),
        DataCell(Text(classInfo.title)),
        DataCell(Text(classInfo.schedule)),
        DataCell(Text('${classInfo.totalSlots}')),
        DataCell(Text('${classInfo.remainingSlots}')),
      ],
    );
  }

  @override
  int get rowCount => classes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
