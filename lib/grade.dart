import 'package:flutter/material.dart';

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
      home: Grades(),
    );
  }
}

class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          child: Text('Student Grade'),
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
                      text: 'A.Y./SEMESTER ',
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              GradesTable(), // Added GradesTable widget
            ],
          ),
        ),
      ),
    );
  }
}

class GradesTable extends StatefulWidget {
  List<List<String>> classes = [
    ['CSC 0112.1 Software Engineering 1', '3', '1', 'Passed'],
    ['CSC 0122.1 Research Writing', '3', '1', 'Passed'],
    ['CSC 0132.1 Thesis Writing 1', '3', '1', 'Passed'],
    ['CSC 0142.1 Information Security', '3', '1', 'Passed'],
    ['CSC 0152.1 CS Elective 1.1', '3', '1', 'Passed'],
    // Add more classes here...
  ];

  @override
  _GradesTableState createState() => _GradesTableState();
}

class _GradesTableState extends State<GradesTable> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = widget.classes.map((classInfo) => DataRow(cells: [
      DataCell(Text(classInfo[0], style: TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text(classInfo[1], style: TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text(classInfo[2], style: TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text(classInfo[3], style: TextStyle(fontWeight: FontWeight.bold))),
    ]))
        .toList();

    return Column(
      children: <Widget>[
        SizedBox(height: 30.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)), // Rounded corners
              border: Border.all(
                color: Color.fromRGBO(229, 231, 235, 1),
                width: 1,
              ),
            ),
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Subject Code - Section and Title',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = sortAscending;
                      widget.classes.sort((a, b) => a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Units',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = sortAscending;
                      widget.classes.sort((a, b) => a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Grades',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = sortAscending;
                      widget.classes.sort((a, b) => a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
                      if (!_sortAscending) {
                        widget.classes = widget.classes.reversed.toList();
                      }
                    });
                  },
                ),
                DataColumn(
                  label: Text(
                    'Remarks',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = sortAscending;
                      widget.classes.sort((a, b) => a[_sortColumnIndex].compareTo(b[_sortColumnIndex]));
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