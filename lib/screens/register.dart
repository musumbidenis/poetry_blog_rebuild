import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/data/api.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  /*Text Controllers */
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey[900],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            Text(
              "Create a new account",
              style: TextStyle(color: Colors.grey[700]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 45.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        labelText: "USERNAME",
                        labelStyle: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "USERNAME field cannot be blank";
                        }
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "EMAIL",
                        labelStyle: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "EMAIL field cannot be blank";
                        }
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: "PHONE",
                        labelStyle: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "PHONE field cannot be blank";
                        }
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pinkAccent)),
                      ),
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "PASSWORD field cannot be blank";
                        }
                      },
                    ),
                    SizedBox(height: 75.0),
                    Container(
                      height: 50.0,
                      child: GestureDetector(
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.red,
                          color: Colors.pink,
                          elevation: 5.0,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                _isLoading ? 'REGISTERING..' : 'REGISTER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Source Sans Pro'),
                              ),
                            ),
                          ),
                        ),
                        onTap: _handleRegister,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                InkWell(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      /*User data to be pushed to db */
      var data = {
        "username": username.text,
        "email": email.text,
        "phone": phone.text,
        "password": password.text,
      };

      /*Set the registration button to loading state */
      setState(() {
        _isLoading = true;
      });

      /*Handles posting data to db */
      var response = await CallAPi().postData(data, 'register');
      var body = json.decode(response.body);

      if (body == 'success') {
        /*Navigate to login page */
        Navigator.pop(context);

        /**Set loading state of button to false &&
         * Clear the text fields
        */
        username.clear();
        password.clear();
        email.clear();
        phone.clear();
        setState(() {
          _isLoading = false;
        });

        /**Display success message */
        Flushbar(
          message: "Registration was successfull!",
          duration: Duration(seconds: 10),
          backgroundColor: Colors.green,
        )..show(context);
      } else if (body == 'userExists') {
        /**Display error message */
        Flushbar(
          message: "Username already taken! Please choose a unique username.",
          duration: Duration(seconds: 10),
          backgroundColor: Colors.red,
        )..show(context);

        /**Set loading state of button to false &&
         * Clear the username text field
        */
        username.clear();
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
