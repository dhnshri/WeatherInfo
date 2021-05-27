import 'package:WeatherLogin/bloc/login_bloc.dart';
import 'package:WeatherLogin/screens/login_screen.dart';
import 'package:WeatherLogin/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/registration_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        Provider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
        )
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
