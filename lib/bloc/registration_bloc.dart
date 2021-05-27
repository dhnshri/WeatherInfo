import 'package:WeatherLogin/bloc/Validator_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationBloc with Validator {
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _phonenumber = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();

  //getter

  Stream<String> get name => _name.stream.transform(nameValidator);
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get phonenumber =>
      _phonenumber.stream.transform(phonenumberValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmpassword =>
      _confirmpassword.stream.transform(confirmPasswordValidator);

  Stream<bool> get isValid => Rx.combineLatest5(name, email, phonenumber,
      password, confirmpassword, (a, b, c, d, e) => true);

  Stream<bool> get isPasswordMatch =>
      Rx.combineLatest2(password, confirmpassword, (a, b) {
        if (a != b) {
          return false;
        } else {
          return true;
        }
      });

  void submit() {
    if (password != confirmpassword) {
      _confirmpassword.sink.addError("Do not match password");
    } else {
      print("Register");
    }
  }

  // setter

  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePhonenumber => _phonenumber.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmpassword.sink.add;

  void dispose() {
    _name.close();
    _email.close();
    _phonenumber.close();
    _password.close();
    _confirmpassword.close();
  }
}
