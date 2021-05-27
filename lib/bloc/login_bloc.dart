import 'dart:async';

import 'package:WeatherLogin/bloc/Validator_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  //Getter(for Hearing Purpose)
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword =>
      _loginPassword.stream.transform(passwordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (a, b) => true);

  // Setter (for input purpose)

  Function(String) get changeLoginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;

  void submit() {
    print(_loginEmail.value);
    print(_loginPassword.value);
  }

  //Transformer

  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}
