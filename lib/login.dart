
import 'package:flutter/material.dart';
import './main.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Scaffold(
        body: BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {

  @override
  void initState() {
    super.initState();
    // To ensure the bottom sheet is only shown once, we're using initState
    WidgetsBinding.instance.addPostFrameCallback((_) => _showModalBottomSheet());
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      isDismissible: false, // The bottom sheet cannot be dismissed by tapping outside
      enableDrag: false, // The bottom sheet cannot be closed by swiping down
      builder: (BuildContext context) {
        return Container(
          // height: 300,
          // Add padding to this container
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Add assets/plm_logo.png
              Image.asset(
                'assets/plm_logo.png',
                height: 60,
                width: 30,
              ),
              const SizedBox(height: 20),

              // Add text 'Pamantasan ng Lungsod ng Maynila'
              const Text(
                'Pamantasan ng Lungsod ng Maynila',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Add subtitle 'University of the City of Manila'
              const Text(
                'University of the City of Manila',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // Add gray caption for 'Log In using your PLM account (SSO)'
              const SizedBox(height: 20),
              const Text(
                'Log In using your PLM account (SSO)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),

              ElevatedButton.icon(
                icon: ImageIcon(AssetImage("assets/microsoft_logo.png"), size: 20),
                label: const Text('Log in with Microsoft'),
                onPressed: () {
                //   Redirect to `enrollment.dart` file
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Main()),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 10,)),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(24, 24, 27, 1)),
                  // Change color of text as white
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ),
              const Divider(height: 40, thickness: 2),
              const Text(
                'Not currently enroll in PLM?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 10,)),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(251, 191, 36, 1)),
                  elevation: MaterialStateProperty.all(0.0),
                  // Change color of text as black
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                //   Change font size to 16
                ),
                child: const Text('Apply Now'),
                onPressed: () {
                  // Handle apply now logic
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Since we want to show the bottom sheet immediately and it should not be closable,
    // we remove the button that was previously here and handle the bottom sheet in initState.
    return const SizedBox(); // This can be replaced with actual content if needed.
  }
}
