import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/data/api.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  /*Text Controllers */
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(color: Colors.grey[700]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 45.0, right: 45.0, top: 50.0, bottom: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    SizedBox(height: 30.0),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.pink),
                    ),
                    SizedBox(height: 30.0),
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
                                _isLoading ? 'LOGING..' : 'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Source Sans Pro'),
                              ),
                            ),
                          ),
                        ),
                        onTap: _handleLogin,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don\'t have an account? "),
                InkWell(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      /*User data to be pushed to db */
      var data = {
        "username": username.text,
        "password": password.text,
      };

      /*Set the login button to loading state */
      setState(() {
        _isLoading = true;
      });

      /*Handles posting data to db */
      var response = await CallAPi().postData(data, 'login');
      var body = json.decode(response.body);

      if (body == 'success') {
        /*Navigate to the Home page */
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Navigation()));

        /*Save the username of logged in user to localstorage */
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('userKey', username.text);

        /**Set loading state of button to false &&
         * Clear the text fields
         */
        username.clear();
        password.clear();
        setState(() {
          _isLoading = false;
        });
      } else {
        username.clear();
        password.clear();
        setState(() {
          _isLoading = false;
        });
        /**Display error message */
        Flushbar(
          message: "Incorrect details! Please try again.",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context);

        /**Set loading state of button to false &&
         * Clear the text fields
         */

      }
    }
  }
}
