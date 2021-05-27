import 'package:WeatherLogin/bloc/login_bloc.dart';
import 'package:WeatherLogin/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
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
                StreamBuilder<String>(
                    stream: bloc.loginEmail,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onChanged: (value) => bloc.changeLoginEmail,
                      );
                    }),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<String>(
                    stream: bloc.loginPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onChanged: (value) => bloc.changeLoginPassword,
                      );
                    }),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegistrationForm()));
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
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError || !snapshot.hasData
                ? null
                : () {
                    bloc.submit();
                  },
            child: Container(
              height: 40,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: snapshot.hasError || !snapshot.hasData
                    ? Colors.grey
                    : Color(0xffff69b4),
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
        });
  }
}
