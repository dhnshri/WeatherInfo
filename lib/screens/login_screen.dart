import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          color: Color(0xffc2e0f9),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "User Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _submitbutton(),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Need an Account ?",
                          style: TextStyle(color: Colors.black)),
                      WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                          text: "Register here",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //Nevigate Screen
                            })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitbutton() {
    return GestureDetector(
      onTap: () {
        //Function body
      },
      child: Container(
        height: 40,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffff69b4),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
