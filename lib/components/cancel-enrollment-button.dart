import 'package:cse3_undergrad_studentside/main.dart';
import 'package:cse3_undergrad_studentside/components/button.dart';

import 'package:flutter/material.dart';
import '../dashboard.dart';

class CancelEnrollmentButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CancelEnrollmentButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return CustomButton(
        text: 'Cancel Enrollment',
        variant: ButtonVariant.secondary,
        iconColor: Colors.black,
        onPressed: () async {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context,
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
                      'assets/warning-circle.png',
                      height: 60,
                      width: 30,
                    ),
                    const SizedBox(height: 20),

                    // Add text 'Pamantasan ng Lungsod ng Maynila'
                    const Text(
                      'Are you sure to cancel Enrollment?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Add subtitle 'University of the City of Manila'
                    const Text(
                      'This action will terminate your enrollment process. Please be aware that this action is irreversible.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // Add gray caption for 'Log In using your PLM account (SSO)'
                    const SizedBox(height: 20),

                    CustomButton(text: 'Cancel Enrollment', variant: ButtonVariant.destructive, onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Main()),
                      );
                    }),
                    SizedBox(height: 10),
                    CustomButton(text: 'Continue Enrollment', variant: ButtonVariant.secondary, onPressed: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
              );
            },
          );
        }
    );
  }
}
