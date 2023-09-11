import 'package:flutter/material.dart';

import 'new_password.dart';
// ignore_for_file: prefer_const_constructors

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF252634),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80.0,
                  ),
                  SizedBox(
                    child: Text(
                      "Enter Your email account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration("Email", Icons.email),
                      validator: _validateEmail),
                  SizedBox(
                    height: 16.0,
                  ),
                  // SizedBox(
                  //   height: 16.0,
                  // ),
                  //
                  //
                  // SizedBox(
                  //     height: 50,
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             backgroundColor: Color(0xFFF15900)),
                  //         onPressed: (){
                  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassword()));
                  //         },
                  //         child:
                  //         Text("Validate Email", style: TextStyle(fontSize: 20)))),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPassword()),
                      );
                    },
                    child: Text(
                      "Validate Email",
                      style: TextStyle(color: Color(0xFFF5CC06), fontSize: 20),
                    ),
                  )
                ],
              )),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0xAA494A59),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color(0xFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}