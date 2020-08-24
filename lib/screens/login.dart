import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          onPressed: () {},
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            Text(
              "Create a new account",
              style: TextStyle(color: Colors.grey[700]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
              child: Form(
                child: Column(
                  children: [
                    Input(
                      labelText: "USERNAME",
                    ),
                    SizedBox(height: 8.0),
                    Input(
                      labelText: "EMAIL",
                    ),
                    SizedBox(height: 8.0),
                    Input(
                      labelText: "PHONE",
                    ),
                    SizedBox(height: 8.0),
                    Input(
                      labelText: "PASSWORD",
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
                        onTap: () {},
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
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
