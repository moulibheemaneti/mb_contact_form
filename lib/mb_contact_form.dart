/// Copyright 2021
/// Author : Mouli Bheemaneti

library mb_contact_form;

import 'package:flutter/material.dart';
import 'package:mb_button/mb_button.dart';
import 'package:url_launcher/url_launcher.dart';

/// [MBContactForm] is a [StatefulWidget].
/// It takes [withIcons] and [destinationEmail] as its arguments.
/// This widget creates a Contact Form which has 3 [TextFormField],
/// [Name], [Email] and [Message].
///
class MBContactForm extends StatefulWidget {
  /// [withIcons] is a [bool] variable which decides
  /// whether the contact form has icons or not.
  final bool withIcons;

  /// [destinationEmail] is a [String] variable which cannot be null.
  /// The destinationEmail must be a proper email address of the reciever.
  /// The message entered will be sent as a mail for the destinationEmail.
  final String destinationEmail;

  /// [hasHeading] is a [bool] variable.
  /// If it is set to true. then it displays a Contact Form text as a heading
  /// in the widget. And if set to false, there will be only [Name], [Email]
  /// [Message] and a submit [Button]
  final bool hasHeading;

  /// [MBContactForm] has 2 [required] fields [withIcons] and [destinationEmail].
  const MBContactForm({
    Key? key,
    this.hasHeading = true,
    required this.withIcons,
    required this.destinationEmail,
  }) : super(key: key);

  @override
  State<MBContactForm> createState() => _MBContactFormState();
}

class _MBContactFormState extends State<MBContactForm> {
  /// Initializing a [GlobalKey] of type [FormState]
  /// [_formKey] is helpful to store [FormState] of the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Initializing a [TextEditingController] for [Name] field as [_nameEditingController]
  final TextEditingController _nameEditingController = TextEditingController();

  /// Initializing a [TextEditingController] for [Email] field as [_emailEditingController]
  final TextEditingController _emailEditingController = TextEditingController();

  /// Initializing a [TextEditingController] for [Message] field as [_messageEditingController]
  final TextEditingController _messageEditingController =
      TextEditingController();

  /// [name] store the value from [_nameEditingController]
  /// And it is validated by [_validateName]
  String name = '';

  /// [email] store the value from [_emailEditingController]
  /// And it is validated by [_validateEmail]
  String email = '';

  /// [message] store the value from [_messageEditingController]
  /// And it is validated by [_validateMessage]
  String message = '';

  /// Overrides the parent's [dispose] method.
  ///
  /// After using the [_nameEditingController], [_emailEditingController]
  /// and [_messageEditingController], [TextEditingController]s
  @override
  void dispose() {
    // Disposing [_nameEditingController]
    _nameEditingController.dispose();
    // Disposing [_emailEditingController]
    _emailEditingController.dispose();
    // Disposing [_messageEditingController]
    _messageEditingController.dispose();
    super.dispose();
  }

  /// [_validateName] validates the value of [_name]
  String? _validateName(String name) {
    // Regular Expression for fullname (a space between first name and second name)
    String nameRegExp = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";

    if (name.isEmpty) {
      // Name field should not be empty
      return 'Enter your name';
    }
    if (!RegExp(nameRegExp).hasMatch(name)) {
      // If the value in name field doesn't match with the regular expression
      // then it throws an error message.
      return 'Give a space between \nyour first name and last name';
    }
    return null;
  }

  /// [_validateEmail] validates the value of [_email]
  String? _validateEmail(String email) {
    // Regular Expression for email
    String emailRegExp =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (email.isEmpty) {
      // Name field should not be empty
      return 'Enter your email';
    }
    if (!RegExp(emailRegExp).hasMatch(email)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: username@example.com';
    }
    return null;
  }

  /// [_validateMessage] validates the value of [_message]
  String? _validateMessage(String name) {
    if (name.isEmpty) {
      // Message field should not be empty
      return 'Message is empty. Please fill it.';
    }
    return null;
  }

  /// [_sendEmail] redirects to gmail app with the message and name
  /// entered by the user.
  void _sendEmail(
      {required String destEmail, required String body, required String name}) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    /// [emailLaunchUri] sends an email to the destination email.
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: destEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Feedback from $name',
        'body': body,
      }),
    );

    // Launching the URL.
    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: 32,
      ),

      /// Contact Form
      child: Form(
        key: _formKey,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                widget.hasHeading
                    ? const Text(
                        'Contact Form',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      )
                    : Container(),

                const SizedBox(
                  height: 32,
                ),
                // Name Field
                TextFormField(
                  controller: _nameEditingController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateName(value!),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  decoration: InputDecoration(
                    icon: widget.withIcons
                        ? const Icon(Icons.person_outline)
                        : null,
                    label: const Text('Name'),
                    hintText: 'FirstName LastName',
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 32,
                ),

                // Email Field
                TextFormField(
                  controller: _emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateEmail(value!),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                  decoration: InputDecoration(
                    icon: widget.withIcons
                        ? const Icon(Icons.alternate_email)
                        : null,
                    label: const Text('E-mail'),
                    hintText: 'Name',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),

                // Message or Feedback Field
                TextFormField(
                  controller: _messageEditingController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => _validateMessage(value!),
                  onChanged: (value) {
                    setState(() {
                      message = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      message = value!;
                    });
                  },
                  decoration: InputDecoration(
                    icon: widget.withIcons
                        ? const Icon(Icons.message_outlined)
                        : null,
                    label: const Text('Message'),
                    hintText: 'Message',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),

                // Submit button
                MBButton(
                  isIconButton: true,
                  elevation: 0,
                  roundness: 10,
                  text: 'Submit',
                  onTapFunction: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        _sendEmail(
                          name: name,
                          destEmail: widget.destinationEmail,
                          body: message,
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
