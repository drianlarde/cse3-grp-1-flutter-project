import 'package:cse3_undergrad_studentside/components/button.dart';
import 'package:cse3_undergrad_studentside/enrollment_2.dart';
import 'package:cse3_undergrad_studentside/main.dart';
import 'package:flutter/material.dart';
import './components/cancel-enrollment-button.dart';

import 'package:url_launcher/url_launcher.dart';

void main() async {
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
      home: StudentEnrollment3(),
    );
  }
}

class StudentEnrollment3 extends StatefulWidget {
  const StudentEnrollment3({Key? key}) : super(key: key);

  @override
  _StudentEnrollment3State createState() => _StudentEnrollment3State();
}

class ClassInfo {
  final String code;
  final String title;
  final String schedule;
  final int totalSlots;
  final int remainingSlots;

  ClassInfo({
    required this.code,
    required this.title,
    required this.schedule,
    required this.totalSlots,
    required this.remainingSlots,
  });
}

class ClassesDataSource extends DataTableSource {
  final List<ClassInfo> classes;

  ClassesDataSource(this.classes);

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

class _StudentEnrollment3State extends State<StudentEnrollment3> {
  @override
  Widget build(BuildContext context) {
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
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.black),
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
                          color: Colors.amber,
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
                          color: Colors.amber,
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
                          "3",
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
                        Text("Third step",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("View Assessment and Student Enrollment Record",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),

                CustomButton(
                    text: 'Download Assessment',
                    variant: ButtonVariant.defaultButton,
                    onPressed: () {
                      final url = Uri.parse(
                        'https://dfqsulnliamqedbuabjx.supabase.co/storage/v1/object/public/cse3-student-side/assessment.pdf',
                      );
                      if (canLaunchUrl(url) != null) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print("Can't launch $url");
                      }
                    },
                    icon: Icons.download),

                SizedBox(height: 5),

                CustomButton(
                    text: 'Download Student Enrollment Record',
                    variant: ButtonVariant.defaultButton,
                    onPressed: () {
                      final url = Uri.parse(
                        'https://dfqsulnliamqedbuabjx.supabase.co/storage/v1/object/public/cse3-student-side/reg-form.pdf',
                      );
                      if (canLaunchUrl(url) != null) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print("Can't launch $url");
                      }

                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        enableDrag:
                            false, // The bottom sheet cannot be closed by swiping down
                        builder: (BuildContext context) {
                          return Container(
                            // height: 300,
                            // Add padding to this container
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // Add assets/plm_logo.png
                                Image.asset(
                                  'assets/checkmark_circle.png',
                                  height: 60,
                                  width: 30,
                                ),
                                const SizedBox(height: 20),

                                // Add text 'Pamantasan ng Lungsod ng Maynila'
                                const Text(
                                  'You’re Successfully Enrolled!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // Add subtitle 'University of the City of Manila'
                                const Text(
                                  "You're added to your subject’s MS Teams. The start of classes will be on January 1, 2024",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomButton(
                                  text: 'Back to Home',
                                  variant: ButtonVariant.defaultButton,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Main()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icons.download),

                SizedBox(height: 10),
                Text(
                  'Download necessary documents to successfully enroll.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 30),

                Divider(
                  height: 30,
                  thickness: 2,
                ),

                SizedBox(height: 30),

                CustomButton(
                    text: 'Back',
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentEnrollment2()),
                      );
                    }),

                SizedBox(height: 10),
                // Button to cancel enrollment
                CancelEnrollmentButton(
                    text: 'Cancel Enrollment',
                    onPressed: () {
                      // Handle cancel enrollment logic
                    }),
              ],
            ),
          ),
        ));
  }
}
