import 'package:flutter/material.dart';
import 'package:mb_contact_form/mb_contact_form.dart';

/// Entry point of the app.
void main() {
  runApp(const MyApp());
}

/// Base class for the app.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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
