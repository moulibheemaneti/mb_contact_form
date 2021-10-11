/// Ensure you use the below two packages in the file which you are working on
import 'package:flutter/material.dart';
import 'package:mb_contact_form/mb_contact_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MB Contact Form Demo"),
        elevation: 0,
      ),
      body: const MBContactForm(
        hasHeading: true,
        withIcons: false,
        destinationEmail: "email@gmail.com",
      ),
    );
  }
}
